# Day 1/90 — Back to Python

> Python foundations — from core syntax to modules, imports, exceptions, and type hints.

**Author:** Rutuja  
**Date:** September 23, 2026

---

Day 1 of my 90-day AI Engineer roadmap is a Python revision day.

Today's topics are:

- Variables and data types
- Lists, tuples, sets, and dictionaries
- Conditionals and loops
- Functions
- Classes
- Modules and imports
- Exceptions
- Type hints

I've already covered most of the Python fundamentals before, so this is mainly a **revision of the basics**, followed by a deeper look at **modules, imports, exceptions, and type hints**.

If you're completely new to Python, work through the refresher below first. If the basics already feel familiar, jump directly to [Modules](#modules).

You can also use the [AI Engineer Tracker](../AI_Engineer_90_Day_Tracker.xlsx) to follow along with the 90-day roadmap.

---

# Python Basics Revision

Python is used across web development, automation, scripting, data analysis, machine learning, and AI.

One reason it is so widely used is its readability. Once the fundamentals feel familiar, larger Python programs are mostly combinations of the same building blocks.

## Your First Python Program

`print()` displays something on the screen.

```python
print("Hello")
```

Output:

```text
Hello
```

Numbers do not need quotes:

```python
print(25)
```

Text does:

```python
print("25")
```

These may look similar, but Python treats them differently.

---

## Variables and Data Types

A **variable** is a name that refers to a value.

```python
age = 25
language = "Python"
score = 92.5
active = True
```

Python determines the type dynamically.

```text
25        → int
92.5      → float
"Python"  → str
True      → bool
None      → no value
```

You can inspect a type with:

```python
print(type(age))
```

### Common types

| Type | Meaning | Example |
|---|---|---|
| `int` | Whole number | `25` |
| `float` | Decimal number | `10.5` |
| `str` | Text | `"hello"` |
| `bool` | True or False | `True` |
| `None` | No value | `None` |

Variables can be reassigned:

```python
score = 10
score = 20
```

The variable still has the same name, but now refers to a different value.

### Assignment vs comparison

```python
x = 5
```

means:

> assign `5` to `x`

while:

```python
x == 5
```

asks:

> is `x` equal to `5`?

---

## Conditions

Conditions let a program make decisions.

```python
score = 85

if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    print("C")
```

Python checks conditions from top to bottom.

### Common comparison operators

```text
==   equal to
!=   not equal to
>    greater than
<    less than
>=   greater than or equal to
<=   less than or equal to
```

### Logical operators

```python
age = 20
has_id = True

if age >= 18 and has_id:
    print("Allowed")
```

```text
and → both conditions must be true
or  → at least one must be true
not → reverses True / False
```

---

## Strings and Slicing

A string stores text.

```python
word = "Python"
```

Characters have positions called indexes:

```text
Value:  P  y  t  h  o  n
Index:  0  1  2  3  4  5
```

```python
word[0]   # P
word[-1]  # n
```

### Slicing

Slicing selects part of a sequence.

```python
numbers = [10, 20, 30, 40, 50]

numbers[1:4]
```

Result:

```text
[20, 30, 40]
```

The full syntax is:

```text
sequence[start:stop:step]
```

Examples:

```python
numbers[:3]    # first 3 items
numbers[2:]    # from index 2 to the end
numbers[::2]   # every second item
numbers[::-1]  # reverse
```

### Useful string methods

```python
text = "Hello World"

text.lower()
text.upper()
text.replace("World", "Python")
```

And:

```python
"one two three".split()
```

Result:

```text
["one", "two", "three"]
```

---

## Lists

A list stores multiple values together.

```python
languages = ["Python", "JavaScript", "C++"]
```

Lists are **ordered** and **mutable**.

```python
languages.append("Java")
```

Useful operations:

```python
languages[0]        # first item
languages[-1]       # last item
len(languages)      # number of items
"Python" in languages
```

Removing values:

```python
languages.pop()
languages.remove("C++")
```

Sorting:

```python
numbers = [5, 2, 8, 1]

numbers.sort()          # changes original list
sorted(numbers)         # returns a new sorted list
```

---

## Tuples

A tuple is an ordered collection that cannot be changed directly after creation.

```python
coordinates = (10, 20)
```

Compare:

```text
List   → [10, 20]  → mutable
Tuple  → (10, 20)  → immutable
```

---

## Sets

A set stores **unique values**.

```python
skills = {"Python", "AI", "Python", "SQL"}

print(skills)
```

`Python` appears only once.

Create an empty set with:

```python
seen = set()
```

Add a value:

```python
seen.add(10)
```

Check membership:

```python
10 in seen
```

Python's `set` is commonly used as a **hash set** in DSA/interview terminology.

---

## Dictionaries

A dictionary stores information as **key-value pairs**.

```python
user = {
    "name": "Maya",
    "language": "Python",
    "score": 95
}
```

Retrieve a value:

```python
user["name"]
```

Add or update:

```python
user["score"] = 100
```

Useful methods:

```python
user.keys()
user.values()
user.items()
user.get("score")
user.get("missing_key", 0)
```

Python's `dict` is commonly used as a **hash map**.

---

## Mutable vs Immutable

A mutable object can be changed in place.

Common mutable types:

```text
list
dict
set
```

Example:

```python
numbers = [1, 2, 3]
numbers[0] = 100
```

Common immutable types:

```text
int
float
bool
str
tuple
```

For example, strings cannot be changed in place:

```python
word = "hello"

# word[0] = "H"  # error
```

Instead, create a new string:

```python
word = "H" + word[1:]
```

---

## Loops

Loops repeat work.

### `for`

```python
numbers = [10, 20, 30]

for number in numbers:
    print(number)
```

### `range()`

```python
for i in range(5):
    print(i)
```

Output:

```text
0
1
2
3
4
```

Full form:

```python
range(start, stop, step)
```

Example:

```python
range(2, 10, 2)
```

produces:

```text
2, 4, 6, 8
```

### `enumerate()`

`enumerate()` gives both the index and value.

```python
fruits = ["apple", "banana", "orange"]

for index, fruit in enumerate(fruits):
    print(index, fruit)
```

Output:

```text
0 apple
1 banana
2 orange
```

### `while`

```python
count = 0

while count < 3:
    print(count)
    count += 1
```

### `break` and `continue`

```text
break    → stop the loop
continue → skip the current iteration
```

---

## Functions

A function is a reusable block of code that performs a task.

```python
def greet(name):
    return f"Hello, {name}"
```

Call it:

```python
greet("Maya")
```

### Parameters vs arguments

```python
def greet(name):
    ...
```

`name` is a **parameter**.

```python
greet("Maya")
```

`"Maya"` is the **argument**.

### `print()` vs `return`

```python
def add(a, b):
    print(a + b)
```

displays a value.

But:

```python
def add(a, b):
    return a + b
```

sends the value back so it can be stored or reused.

```python
result = add(2, 3)
```

Now:

```text
result = 5
```

### Default parameters

```python
def greet(name="Guest"):
    return f"Hello, {name}"
```

---

## Classes and Objects

A class is a blueprint for creating objects with related data and behavior.

```python
class User:
    def __init__(self, name):
        self.name = name

    def greet(self):
        return f"Hello, I'm {self.name}"
```

Create an object:

```python
user = User("Maya")

print(user.name)
print(user.greet())
```

Think:

```text
Class  → blueprint
Object → instance created from the class
Method → function inside a class
self   → current object
```

---

# Modules

When a Python program is small, keeping everything in one file is manageable.

```text
app.py
```

But as an application grows, that one file may eventually contain:

```text
user logic
database connections
API calls
authentication
machine-learning models
file processing
logging
configuration
utilities
```

A single file with thousands of lines quickly becomes difficult to understand.

This is one of the main reasons **modules** exist.

> A module is a named unit of Python code that groups related functionality together.

Instead of:

```text
app.py
├── user functions
├── database functions
├── model functions
├── authentication functions
└── utility functions
```

we can organize the application like:

```text
app/
├── main.py
├── users.py
├── database.py
├── models.py
├── authentication.py
└── utils.py
```

Each file has a clear responsibility.

### `users.py`

```python
def create_user(name):
    return {"name": name}


def delete_user(user_id):
    ...
```

### `database.py`

```python
def connect():
    ...


def save(data):
    ...
```

### `models.py`

```python
def load_model():
    ...


def predict(data):
    ...
```

These Python files can act as modules.

A module can contain:

- functions
- classes
- variables
- constants
- other Python objects

A `.py` file is one of the most common ways we create a module ourselves.

## Why Modules Are Useful

### 1. Organization

Related functionality stays together.

```text
database.py → database logic
users.py    → user logic
models.py   → model logic
```

### 2. Reuse

Write something once:

```python
def calculate_total(price, quantity):
    return price * quantity
```

and import it wherever it is needed instead of rewriting it.

### 3. Separation of responsibility

Different modules can focus on different jobs.

```text
database module       → database operations
model module          → model operations
authentication module → authentication
```

---

## Modules Create Namespaces

A module creates its own **namespace**.

A namespace is a place where names belong.

For example, Python's `math` module contains:

```text
math
├── sqrt
├── ceil
├── floor
├── sin
├── cos
└── pi
```

When we write:

```python
math.sqrt(25)
```

we mean:

> use the `sqrt` function from the `math` namespace.

Different modules can even contain functions with the same name:

```python
math.calculate()
finance.calculate()
analytics.calculate()
```

The module name tells Python which one we mean.

---

# Imports

Modules organize functionality.

**Imports make that functionality available in the current program.**

```python
import math
```

Now we can use:

```python
math.sqrt(25)
math.floor(4.8)
math.pi
```

The relationship is:

```text
Module
   ↓
organizes related functionality

Import
   ↓
makes that functionality available
```

---

## Import Something Specific

Instead of:

```python
import math

result = math.sqrt(25)
```

we can write:

```python
from math import sqrt

result = sqrt(25)
```

This:

```python
from math import sqrt
```

means:

> find `sqrt` inside `math` and make the name available here.

Multiple imports:

```python
from math import sqrt, ceil, floor
```

---

## Import Aliases

We can give an imported package a shorter local name.

```python
import numpy as np
import pandas as pd
```

Then:

```python
np.array([1, 2, 3])
pd.DataFrame(...)
```

`np` and `pd` are simply aliases.

---

## Where Do Imports Come From?

### Python standard library

These ship with Python:

```python
import math
import random
import json
import os
import re
```

### Third-party libraries

These are installed separately:

```python
import numpy as np
import pandas as pd
import torch
```

Or:

```python
from sklearn.linear_model import LinearRegression
```

### Our own code

Imagine:

```text
project/
├── main.py
└── calculations.py
```

Inside `calculations.py`:

```python
def add(a, b):
    return a + b
```

Then:

```python
from calculations import add

print(add(5, 3))
```

`calculations` is the module.

`add` is the function imported from it.

---

## Common Imports

| I want to... | Common import |
|---|---|
| Do mathematical operations | `import math` |
| Generate random values | `import random` |
| Work with dates | `from datetime import datetime` |
| Read/write JSON | `import json` |
| Work with file paths | `from pathlib import Path` |
| Read environment variables | `import os` |
| Search text patterns | `import re` |
| Count repeated values | `from collections import Counter` |
| Work with arrays/vectors | `import numpy as np` |
| Work with tabular data | `import pandas as pd` |
| Build ML models | `from sklearn...` |
| Work with tensors/deep learning | `import torch` |

Example: environment variable

```python
import os

api_key = os.getenv("API_KEY")
```

JSON:

```python
import json

data = json.loads('{"name": "Maya"}')
```

Vectors:

```python
import numpy as np

vector = np.array([1, 2, 3])
```

---

# Exceptions

An **exception** represents something going wrong while a Python program is running.

For example:

```python
10 / 0
```

raises:

```text
ZeroDivisionError
```

And:

```python
int("hello")
```

raises:

```text
ValueError
```

Common exceptions include:

| Exception | Meaning |
|---|---|
| `ValueError` | Value is invalid for the operation |
| `TypeError` | Wrong type was used |
| `KeyError` | Dictionary key does not exist |
| `IndexError` | Sequence index does not exist |
| `FileNotFoundError` | Requested file was not found |
| `ZeroDivisionError` | Division by zero |
| `ModuleNotFoundError` | Python could not find a module |

---

## `try` and `except`

We can handle expected failures:

```python
try:
    age = int("hello")
except ValueError:
    print("Age must be a number")
```

Python first runs the `try` block.

If a matching exception occurs, it moves to `except`.

---

## `else`

`else` runs when no exception occurs.

```python
try:
    age = int("25")
except ValueError:
    print("Invalid age")
else:
    print(age)
```

---

## `finally`

`finally` runs whether the operation succeeds or fails.

```python
try:
    file = open("data.txt")
except FileNotFoundError:
    print("File not found")
finally:
    print("Finished")
```

---

## Raising Exceptions

We can intentionally raise an exception when input violates the rules of our program.

```python
def divide(a, b):
    if b == 0:
        raise ValueError("b cannot be zero")

    return a / b
```

Exceptions are not just error messages.

They give different parts of a program a structured way to **signal and respond to failures**.

---

# Type Hints

Python does not require us to declare types.

This is valid:

```python
def add(a, b):
    return a + b
```

But we cannot immediately tell what `a` and `b` are supposed to contain.

Type hints make that expectation explicit.

```python
def add(a: int, b: int) -> int:
    return a + b
```

Here:

```text
a: int  → a is expected to be an integer
b: int  → b is expected to be an integer
-> int  → the function is expected to return an integer
```

---

## Common Type Hints

Variables:

```python
name: str = "Maya"
age: int = 25
score: float = 92.5
active: bool = True
```

Collections:

```python
names: list[str] = ["Maya", "Noah"]

scores: dict[str, int] = {
    "Maya": 95,
    "Noah": 90
}

coordinates: tuple[float, float] = (10.5, 20.5)

skills: set[str] = {"Python", "AI"}
```

Functions:

```python
def average(scores: list[float]) -> float:
    return sum(scores) / len(scores)
```

---

## When Something Can Be `None`

Sometimes a value may not exist.

```python
def find_user(user_id: int) -> str | None:
    if user_id == 1:
        return "Maya"

    return None
```

The return type:

```python
str | None
```

means:

```text
string OR None
```

Type hints normally do **not** enforce types at runtime.

Instead, they help:

- us understand code
- other developers understand code
- editors provide better autocomplete
- static type checkers catch mistakes

Compare:

```python
def search(query, limit):
    ...
```

with:

```python
def search(query: str, limit: int) -> list[str]:
    ...
```

The second version tells us much more about the function before we even read its implementation.

---

# Day 1 Takeaway

The Python basics still matter because almost everything later in AI engineering builds on them.

The four ideas I wanted to understand better today fit together like this:

```text
Modules
   ↓
organize related functionality

Imports
   ↓
make that functionality available

Exceptions
   ↓
represent and handle failures

Type hints
   ↓
describe the data our code expects
```

And the broader Python foundation is still:

```text
variables
   ↓
data types
   ↓
conditions
   ↓
collections
   ↓
loops
   ↓
functions
   ↓
classes
   ↓
modules
```

You do not need to memorize every method or every piece of syntax at once.

The goal is to look at Python code and understand **what it is trying to do and how the pieces fit together**.

---

**Day 1/90 complete.**

Use the [AI Engineer Tracker](../AI_Engineer_90_Day_Tracker.xlsx) to follow along and keep track of your progress.

Happy learning :)
