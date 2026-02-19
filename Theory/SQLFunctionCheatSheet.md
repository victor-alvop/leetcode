# 1) SELECT básico

```sql
SELECT column1, column2
FROM table;
```

Con alias:

```sql
SELECT column AS alias_name
FROM table;
```

---

# 2) WHERE (filtrar filas)

```sql
SELECT *
FROM table
WHERE condition;
```

Operadores comunes:

```sql
=  <>  >  <  >=  <=
AND  OR  NOT
IN (value1, value2)
BETWEEN value1 AND value2
LIKE '%text%'
IS NULL
IS NOT NULL
```

---

# 3) GROUP BY

```sql
SELECT column, AGG_FUNCTION(column2)
FROM table
GROUP BY column;
```

---

# 4) HAVING (filtrar grupos)

```sql
SELECT column, COUNT(*)
FROM table
GROUP BY column
HAVING COUNT(*) > 1;
```

---

# 5) ORDER BY

```sql
SELECT *
FROM table
ORDER BY column ASC;
```

```sql
ORDER BY column DESC;
```

---

# 6) LIMIT / TOP

(MySQL / PostgreSQL)

```sql
SELECT *
FROM table
LIMIT 5;
```

(SQL Server)

```sql
SELECT TOP 5 *
FROM table;
```

---

# 7) JOIN

INNER JOIN:

```sql
SELECT *
FROM table1 t1
JOIN table2 t2
  ON t1.id = t2.foreign_id;
```

LEFT JOIN:

```sql
SELECT *
FROM table1 t1
LEFT JOIN table2 t2
  ON t1.id = t2.foreign_id;
```

---

# 8) Subquery

En WHERE:

```sql
SELECT *
FROM table
WHERE column > (
    SELECT AVG(column)
    FROM table
);
```

En FROM:

```sql
SELECT *
FROM (
    SELECT column
    FROM table
) AS sub;
```

---

# 9) Funciones agregadas

```sql
COUNT(column)
COUNT(*)
SUM(column)
AVG(column)
MIN(column)
MAX(column)
```

Con DISTINCT:

```sql
COUNT(DISTINCT column)
```

---

# 10) CASE WHEN

```sql
SELECT
  column,
  CASE
      WHEN condition1 THEN value1
      WHEN condition2 THEN value2
      ELSE default_value
  END AS new_column
FROM table;
```

---

# 11) Window Functions

ROW_NUMBER:

```sql
ROW_NUMBER() OVER (
    PARTITION BY column
    ORDER BY column2 DESC
)
```

RANK:

```sql
RANK() OVER (
    ORDER BY column DESC
)
```

DENSE_RANK:

```sql
DENSE_RANK() OVER (
    ORDER BY column DESC
)
```

LAG / LEAD:

```sql
LAG(column, 1) OVER (ORDER BY column2)
LEAD(column, 1) OVER (ORDER BY column2)
```

Acumulado:

```sql
SUM(column) OVER (
    PARTITION BY column2
    ORDER BY column3
)
```

---

# 12) DISTINCT

```sql
SELECT DISTINCT column
FROM table;
```

---

# 13) EXISTS

```sql
SELECT *
FROM table1 t1
WHERE EXISTS (
    SELECT 1
    FROM table2 t2
    WHERE t1.id = t2.foreign_id
);
```

---

# 14) UNION

```sql
SELECT column FROM table1
UNION
SELECT column FROM table2;
```

Mantener duplicados:

```sql
UNION ALL
```

---

# 15) DATE funciones comunes

Fecha actual:

```sql
CURRENT_DATE
```

Diferencia de días (MySQL):

```sql
DATEDIFF(date1, date2)
```

Extraer año / mes:

```sql
YEAR(date_column)
MONTH(date_column)
```

---

# 16) COALESCE (manejo de NULL)

```sql
COALESCE(column, 0)
```

Devuelve el primer valor no NULL.

---

# 17) IFNULL (MySQL)

```sql
IFNULL(column, 0)
```

---

# Regla mental para entrevistas

Si ves:

* ranking → window function
* más de X → group by + having
* por cada grupo → partition by
* comparar contra promedio → subquery
* jerarquía → self join
* consecutivos → lag

