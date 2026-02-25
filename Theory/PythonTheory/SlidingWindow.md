## ¿Qué es el patrón *Sliding Window*?

**Sliding Window** es una técnica para recorrer **subarreglos o subcadenas contiguas** sin recalcular todo cada vez.

👉 En lugar de volver a empezar desde cero para cada ventana, **la “deslizas”**:

* agregas lo que entra
* quitas lo que sale

📉 **Reduce complejidad**

* De **O(n²)** 👉 **O(n)**
* Ideal cuando trabajas con **arrays, strings y rangos continuos**

---

## 🧠 Formas mentales típicas para identificarlo

Cuando leas un problema, piensa:

### 🔍 1. ¿El problema habla de…?

* “subarray”
* “substring”
* “ventana”
* “rango continuo”
* “máximo / mínimo / suma / promedio”
* “longitud más larga / más corta”

💡 *Casi seguro es Sliding Window*

---

¡Va! 😄🔥 Vamos a **bajar Sliding Window a tierra**, viendo **los tipos**, **cómo se usan las variables** y **qué está pensando tu cerebro mientras codificas** 🧠🪟
Voy a usar ejemplos **muy típicos de LeetCode** y explicar **para qué sirve cada variable**.

---

# Tipos de Sliding Window (con mentalidad y variables)

---

## 🔒 1. Sliding Window de **tamaño fijo**

### 📌 Cuándo usarlo

Cuando el problema dice algo como:

* “subarray de tamaño **k**”
* “promedio de los últimos k elementos”
* “suma máxima en una ventana fija”

👉 **El tamaño NO cambia**

---

### 🧠 Variables típicas

```python
left = 0               # inicio de la ventana
window_sum = 0         # lo que estás calculando
max_sum = 0            # resultado
```

---

### 🧩 Ejemplo: promedio máximo de tamaño k

```python
def max_average(nums, k):
    window_sum = sum(nums[:k])
    max_sum = window_sum

    for right in range(k, len(nums)):
        window_sum += nums[right]     # entra
        window_sum -= nums[right-k]   # sale
        max_sum = max(max_sum, window_sum)

    return max_sum / k
```

### 🧠 Qué hace cada variable

| Variable     | Significado mental          |
| ------------ | --------------------------- |
| `right`      | El elemento que entra       |
| `right-k`    | El que sale                 |
| `window_sum` | Estado actual de la ventana |
| `max_sum`    | Mejor resultado hasta ahora |

🪟 *La ventana se mueve, pero nunca cambia de tamaño*

---

## 🔓 2. Sliding Window **variable** (condición)

### 📌 Cuándo usarlo

Cuando buscas:

* “longest / shortest”
* “at most k”
* “while la condición se cumpla”

👉 **El tamaño cambia**

---

### 🧠 Variables típicas

```python
left = 0
right = 0
contador / set / hashmap
resultado = 0
```

---

### 🧩 Ejemplo: Longest substring sin repetir caracteres

```python
def lengthOfLongestSubstring(s):
    seen = set()
    left = 0
    max_len = 0

    for right in range(len(s)):
        while s[right] in seen:
            seen.remove(s[left])
            left += 1

        seen.add(s[right])
        max_len = max(max_len, right - left + 1)

    return max_len
```

### 🧠 Qué está pasando

* `right` 👉 expande la ventana
* `left` 👉 la encoge cuando la condición falla
* `seen` 👉 valida la condición

📌 *Aquí la ventana respira: crece y se encoge*

---

## 🔢 3. Sliding Window con **conteo (HashMap)**

### 📌 Cuándo usarlo

Cuando el problema dice:

* “anagramas”
* “frecuencia”
* “k caracteres distintos”

---

### 🧩 Ejemplo: Longest substring con **máximo k caracteres distintos**

```python
def longest_k_distinct(s, k):
    count = {}
    left = 0
    max_len = 0

    for right in range(len(s)):
        count[s[right]] = count.get(s[right], 0) + 1

        while len(count) > k:
            count[s[left]] -= 1
            if count[s[left]] == 0:
                del count[s[left]]
            left += 1

        max_len = max(max_len, right - left + 1)

    return max_len
```

### 🧠 Variables clave

| Variable     | Rol                              |
| ------------ | -------------------------------- |
| `count`      | Estado interno de la ventana     |
| `len(count)` | Condición                        |
| `left`       | Corrige cuando se rompe la regla |

---

## 🪜 4. Sliding Window para **mínimos**

### 📌 Cuándo usarlo

* “mínimo subarray que cumpla X”
* “shortest window”

---

### 🧩 Ejemplo: Subarray más corto con suma ≥ target

```python
def minSubArrayLen(target, nums):
    left = 0
    window_sum = 0
    min_len = float('inf')

    for right in range(len(nums)):
        window_sum += nums[right]

        while window_sum >= target:
            min_len = min(min_len, right - left + 1)
            window_sum -= nums[left]
            left += 1

    return min_len if min_len != float('inf') else 0
```

### 🧠 Mentalidad

* Primero **expandes**
* Luego **aprietas** la ventana para minimizar

---

## 🧠 Plantillas mentales rápidas (cheat sheet)

### 🔒 Ventana fija

```python
for right in range(k, n):
    entra
    sale
```

---

### 🔓 Ventana variable

```python
for right in range(n):
    agregar
    while condición rota:
        remover
        mover left
```

---

## 🧩 Cómo saber qué variable necesitas

| Problema        | Variable            |
| --------------- | ------------------- |
| Sumas           | `window_sum`        |
| Repetidos       | `set`               |
| Frecuencias     | `dict`              |
| Conteo distinto | `len(dict)`         |
| Máximo / mínimo | `max_len / min_len` |

---

## 🎯 Regla final (muy importante)

> **Sliding Window siempre mantiene un “estado” de la ventana**
> 👉 variables = estado
> 👉 mover punteros = corregir estado

