# 🧠 PATRÓN 1 — GROUP BY + HAVING (Agregaciones)

## 🔎 ¿De qué trata?

Agrupar registros para calcular métricas por grupo (conteos, sumas, promedios, etc.) y luego filtrar esos grupos.

Se usa cuando la pregunta dice:

* “más de”
* “promedio”
* “total”
* “número de”

---

## 📌 Ejemplo

> Encuentra los clientes que han hecho más de 3 órdenes.

```sql
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;
```

---

## 🛠 Cómo aplicarlo

1. Identifica por qué campo debes agrupar
2. Aplica función agregada
3. Usa HAVING para filtrar resultados agregados

⚠ `WHERE` filtra filas
⚠ `HAVING` filtra grupos

---

# 🧠 PATRÓN 2 — JOIN (Relaciones entre tablas)

## 🔎 ¿De qué trata?

Combinar información de múltiples tablas.

Se usa cuando:

* Hay claves foráneas
* Se necesita información que está distribuida

---

## 📌 Ejemplo

> Mostrar nombre del cliente y número de órdenes.

```sql
SELECT c.name, COUNT(o.id)
FROM Customers c
LEFT JOIN Orders o
  ON c.id = o.customer_id
GROUP BY c.name;
```

---

## 🛠 Cómo aplicarlo

1. Identifica clave primaria y foránea
2. Decide INNER o LEFT
3. Une
4. Luego aplica agregaciones si es necesario

---

# 🧠 PATRÓN 3 — Subqueries

## 🔎 ¿De qué trata?

Hacer una consulta dentro de otra.

Se usa cuando:

* Comparas contra un agregado global
* Necesitas filtrar basado en otro resultado

---

## 📌 Ejemplo

> Empleados que ganan más que el promedio.

```sql
SELECT name
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
```

---

## 🛠 Cómo aplicarlo

1. Identifica valor de referencia
2. Haz subconsulta que calcule ese valor
3. Compárala en WHERE

---

# 🧠 PATRÓN 4 — Window Functions

🔥 Muy fuerte en entrevistas actuales.

## 🔎 ¿De qué trata?

Aplicar funciones analíticas sin colapsar filas.

Diferencia clave:

* GROUP BY → reduce filas
* OVER() → mantiene filas

---

## 📌 Ejemplo

> Segundo salario más alto

```sql
SELECT salary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 2;
```

---

## 🛠 Cómo aplicarlo

1. Usa OVER()
2. Si necesitas ranking → usa RANK / DENSE_RANK / ROW_NUMBER
3. Si es por grupo → usa PARTITION BY

---

# 🧠 PATRÓN 5 — Top N por grupo

## 🔎 ¿De qué trata?

Encontrar el mejor/peor elemento dentro de cada categoría.

Se usa cuando la pregunta dice:

* “por cada”
* “el más alto por departamento”

---

## 📌 Ejemplo

> Empleado mejor pagado por departamento

```sql
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM Employees
) t
WHERE rn = 1;
```

---

## 🛠 Cómo aplicarlo

1. PARTITION BY grupo
2. ORDER BY métrica
3. Filtrar rn = 1

---

# 🧠 PATRÓN 6 — Self Join

## 🔎 ¿De qué trata?

Unir una tabla consigo misma.

Se usa en:

* Jerarquías
* Comparaciones entre filas
* Consecutivos

---

## 📌 Ejemplo

> Empleado y su manager

```sql
SELECT e.name, m.name AS manager
FROM Employees e
LEFT JOIN Employees m
  ON e.manager_id = m.id;
```

---

## 🛠 Cómo aplicarlo

1. Usa alias distintos
2. Define relación entre filas
3. JOIN como si fueran dos tablas distintas

---

# 🧠 PATRÓN 7 — Consecutive Rows (Gaps & Islands)

🔥 Pregunta clásica avanzada.

## 🔎 ¿De qué trata?

Detectar secuencias consecutivas o patrones temporales.

Se usa cuando:

* “3 días seguidos”
* “números consecutivos”
* “actividad continua”

---

## 📌 Ejemplo (conceptual)

Detectar números repetidos 3 veces seguidas usando LAG:

```sql
SELECT num
FROM (
    SELECT num,
           LAG(num,1) OVER (ORDER BY id) AS prev1,
           LAG(num,2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
  AND num = prev2;
```

---

## 🛠 Cómo aplicarlo

1. Ordena por columna temporal
2. Usa LAG() o LEAD()
3. Compara fila actual con anteriores

---

# 🎯 Cómo estudiar estos 7 patrones

## Semana ideal de preparación

Día 1–2 → GROUP BY + HAVING
Día 3 → JOIN
Día 4 → Subqueries
Día 5 → Window functions
Día 6 → Top N + Self join
Día 7 → Consecutivos

---

# 🚀 Nivel entrevista senior

Si dominas:

* Window functions
* Top N por grupo
* Consecutivos

Estás arriba del promedio.
