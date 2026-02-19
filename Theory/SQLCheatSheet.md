# SQL INTERVIEW CHEAT SHEET

---

# 1) GROUP BY + HAVING

## Cuándo usarlo

* “más de”
* “al menos”
* “total por”
* “promedio por”
* detectar duplicados

## Plantilla mental

```sql
SELECT column_group,
       AGG_FUNCTION(column)
FROM table
GROUP BY column_group
HAVING AGG_FUNCTION(column) condition;
```

## Errores comunes

* Usar WHERE en vez de HAVING
* No incluir en GROUP BY todas las columnas no agregadas
* No manejar NULL correctamente

## Pregunta clave

¿Estoy filtrando filas o grupos?

---

# 2) JOIN

## Cuándo usarlo

* La información está en varias tablas
* Hay claves foráneas

## Plantilla mental

```sql
SELECT ...
FROM table1 t1
JOIN table2 t2
  ON t1.id = t2.foreign_id;
```

## Decisión rápida

* INNER JOIN → solo coincidencias
* LEFT JOIN → quiero todo de la izquierda aunque no haya match

## Error típico

Confundir la condición del JOIN con filtro lógico (poner filtros en ON vs WHERE).

---

# 3) Subqueries

## Cuándo usarlo

* Comparar contra un agregado global
* “mayor que el promedio”
* “igual al máximo”

## Plantilla mental

```sql
SELECT ...
FROM table
WHERE column > (
    SELECT AGG(column)
    FROM table
);
```

## Alternativa moderna

Muchas subqueries pueden reemplazarse por window functions.

## Error típico

Subquery que devuelve múltiples filas cuando se espera una sola.

---

# 4) Window Functions

## Cuándo usarlo

* Ranking
* Top N por grupo
* Comparar con fila anterior
* Calcular acumulados sin perder filas

## Plantilla ranking

```sql
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY group_column
           ORDER BY metric DESC
       ) AS rn
FROM table;
```

Luego:

```sql
SELECT *
FROM ( ... ) t
WHERE rn = 1;
```

## Funciones clave

* ROW_NUMBER() → posición exacta
* RANK() → empates con salto
* DENSE_RANK() → empates sin salto
* LAG() / LEAD() → comparar con filas vecinas
* SUM() OVER() → acumulados

## Regla mental

GROUP BY reduce filas
OVER() mantiene filas

---

# 5) Top N por grupo

## Patrón completo

```sql
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY group_column
               ORDER BY metric DESC
           ) AS rn
    FROM table
) t
WHERE rn <= N;
```

## Pregunta clave

¿Necesito uno por grupo o global?

---

# 6) Self Join

## Cuándo usarlo

* Jerarquías (manager-empleado)
* Comparar fila actual vs anterior
* Consecutivos

## Plantilla

```sql
SELECT a.*, b.*
FROM table a
JOIN table b
  ON a.column = b.column_related;
```

## Regla mental

Usa alias diferentes siempre.

---

# 7) Consecutive Rows (Gaps & Islands)

## Patrón con LAG

```sql
SELECT *,
       LAG(column) OVER (ORDER BY date_column) AS prev_value
FROM table;
```

Luego filtras donde:

* current = prev
* diferencia de fechas = 1
* etc.

## Patrón avanzado (islands)

```sql
ROW_NUMBER() OVER (ORDER BY date) 
-
ROW_NUMBER() OVER (PARTITION BY status ORDER BY date)
```

Si el resultado es constante → mismo grupo consecutivo.

---

# DECISION TREE RÁPIDO EN ENTREVISTA

Si la pregunta menciona:

* “más de X” → GROUP BY + HAVING
* “por cada departamento” → PARTITION BY
* “segundo más alto” → DENSE_RANK()
* “empleado y su manager” → SELF JOIN
* “días consecutivos” → LAG()
* “comparar contra promedio” → SUBQUERY
* “traer info de otra tabla” → JOIN

---

# Checklist antes de entregar respuesta

1. ¿Estoy manejando NULL?
2. ¿Necesito DISTINCT?
3. ¿Estoy agrupando correctamente?
4. ¿Mi JOIN puede duplicar filas?
5. ¿Puedo simplificar usando window functions?

---

# Nivel Senior Tip

Si puedes resolver el problema de 2 formas:

* Con subquery
* Con window function

Y explicas cuál es más eficiente,

Estás por encima del promedio.

---
