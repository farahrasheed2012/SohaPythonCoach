#!/usr/bin/env python3
"""
Auto-generated rich enrichments for lessons w1-l1 through w10-l3.
Excludes: w2-* (already done) and w3-l4 (already rich).
Total lessons: 32

Quality target: matches w2-l5 and w3-l4 with ## sections,
trace tables, code examples, common bugs, stepped starterCode.
"""

from __future__ import annotations
from typing import Any

GENERATED_ENRICHMENTS: dict[str, dict[str, Any]] = {

    # ──────────────────────────────────────────────
    # WEEK 1 — Python Basics
    # ──────────────────────────────────────────────

    "w1-l1": {
        "body": """
Python is a **language** — a set of rules for telling a computer exactly what to do.
You type instructions in a file, hit **Run**, and the computer executes them one line at a time.

## Your first instruction: `print()`

`print()` sends text to the screen.  Everything inside the parentheses is what gets shown.

```
print("Hello, Soha!")
print("I am learning Python!")
```

The computer reads **top to bottom**, one line per step:

| Step | Line | What happens |
|------|------|--------------|
| 1 | `print("Hello, Soha!")` | Screen shows: `Hello, Soha!` |
| 2 | `print("I am learning Python!")` | Screen shows: `I am learning Python!` |

## Strings — text in quotes

Any text inside `"..."` or `'...'` is called a **string**.  Python treats it as data, not a command.

```
print("Science Bowl")   # works
print(Science Bowl)     # ❌ SyntaxError — no quotes!
```

## What happens if I make a mistake?

Python shows an **error message** with a line number. That is not failure — that is the program telling you exactly where to look!

```
  File "main.py", line 1
    print("Hello)
                 ^
SyntaxError: EOL while scanning string literal
```

Fix: find the line, check your quotes.

## Common bugs

- Forgetting the closing `"` → `SyntaxError`
- Typing `Print` instead of `print` → `NameError` (Python is case-sensitive)
- Forgetting parentheses → `SyntaxError`

Run the starter below.  It already works — change the text inside the quotes and run again!
""",
        "teacherScript": "Ask Soha to predict the output before clicking Run. Then ask: what happens if we delete one quotation mark? Let her find the error message and read it aloud. Goal: make error messages feel friendly, not scary.",
        "practiceSteps": [
            "Read Learn — what does print() do? What is a string?",
            "Run the starter without changing anything — read every line of output.",
            "Change 'Soha' to your own name and re-run. Predict first, then check.",
            "Add a third print line with your favorite subject.",
            "Deliberately delete one quote mark, Run, read the error, then fix it.",
        ],
        "starterCode": """
# Step 1 — run this and read the output
print("Hello, Soha!")
print("I am learning Python!")

# Step 2 — YOUR TURN: add one more print line below
# print("My favorite subject is ___")
""",
        "codeTests": [
            ("w1-l1-prints", "Uses print() at least twice", 'assert user_code.count("print") >= 2', True),
            ("w1-l1-string", "Has a string in quotes", 'assert \'"\' in user_code or "\'" in user_code', True),
        ],
    },

    "w1-l2": {
        "body": """
A **variable** is a labeled box that stores a value.

```
name = "Soha"
age  = 12
```

- Left side: the **label** (variable name)
- `=`: means "store this value"
- Right side: the **value** being stored

## Rules for variable names

| Allowed | Not allowed |
|---------|-------------|
| `name`, `my_score`, `grade7` | `7grade`, `my-score`, `first name` |
| Letters, digits, underscores | Spaces, hyphens, starting with a digit |

## Using a variable

Once stored, use the name anywhere:

```
name = "Soha"
print(name)            # Soha
print("Hi,", name)    # Hi, Soha
```

## Updating a variable

```
score = 10
score = score + 5   # score is now 15
print(score)        # 15
```

**Trace table** — follow the value step by step:

| Line | score |
|------|-------|
| `score = 10` | 10 |
| `score = score + 5` | 15 |
| `print(score)` | prints 15 |

## Common bugs

- Spelling the variable name differently when you use it → `NameError: name 'socre' is not defined`
- Using `=` to compare instead of `==` (you'll see this more in Week 2)
- Putting a space in a variable name → `SyntaxError`
""",
        "teacherScript": "Draw a literal box on paper labeled 'name' with 'Soha' inside. Erase and rewrite the value when score updates. Before Run, ask: if score starts at 10 and we add 5, what does Python store?",
        "practiceSteps": [
            "Read Learn — draw the name and age boxes on paper with their values.",
            "Run the starter. Does the output match what you predicted?",
            "Change name to your actual name and grade to your grade — re-run.",
            "Complete the YOUR TURN line: print next year's age using age + 1.",
            "Run auto-checks. Fix any NameError by checking your spelling.",
        ],
        "starterCode": """
# Step 1 — variables as labeled boxes
name = "Soha"
age  = 12

print(name)
print("Age:", age)

# Step 2 — YOUR TURN: print next year's age
# print("Next year:", age + 1)

# Step 3 — updating a variable (trace on paper first!)
score = 10
score = score + 5
print("Score:", score)   # what prints?
""",
        "codeTests": [
            ("w1-l2-vars", "Defines name and age variables", 'assert "name" in user_code and "age" in user_code', True),
            ("w1-l2-score", "score ends at 15", "score = 10\nscore = score + 5\nassert score == 15"),
        ],
    },

    "w1-l3": {
        "body": """
**Mini project: About Me**

Time to build something personal.  You will combine `print` and variables to make a short biography program — yours, not a copy from a worksheet.

## Plan before you code

Sketch on paper:
1. A title banner line
2. Four facts stored in variables (name, grade, subject, hobby)
3. A closing sentence that uses two variables

## What it looks like

```
=== About Soha ===
Name: Soha
Grade: 7
Favorite subject: Science
Hobby: Science Bowl
Soha loves Science Bowl!
```

## Building it step by step

**Step 1 — banner:**
```
print("=== About Me ===")
```

**Step 2 — variables:**
```
name    = "Soha"
grade   = 7
subject = "Science"
hobby   = "Science Bowl"
```

**Step 3 — print each fact:**
```
print("Name:", name)
print("Grade:", grade)
```

**Step 4 — closing sentence using two variables:**
```
print(name, "loves", hobby + "!")
```

## Common bugs

- Forgetting the closing `"` on a string value
- Trying to do `print("Grade: " + grade)` — you cannot add a number to a string without `str(grade)` — use a comma instead: `print("Grade:", grade)`
""",
        "teacherScript": "Let Soha pick her own facts (real name, grade, subject, hobby). Do not correct style — celebrate the first working version. When done, ask: how would you add a second hobby?",
        "practiceSteps": [
            "Read Learn — sketch the five output lines on paper before opening Playground.",
            "Run the starter. Does the output match your sketch?",
            "Change every placeholder value to YOUR real facts.",
            "Complete the YOUR TURN lines (favorite subject and hobby).",
            "Add one closing sentence that uses at least two variables.",
        ],
        "starterCode": """
# Step 1 — title banner
print("=== About Me ===")

# Step 2 — store your facts in variables
name    = "Soha"
grade   = 7
subject = "Science"
hobby   = "Science Bowl"

# Step 3 — print each fact
print("Name:", name)
print("Grade:", grade)

# Step 4 — YOUR TURN: print subject and hobby
# print("Favorite subject:", subject)
# print("Hobby:", hobby)

# Step 5 — YOUR TURN: closing sentence using two variables
# print(name, "loves", hobby + "!")
""",
        "codeTests": [
            ("w1-l3-four-prints", "Uses print at least 4 times", 'assert user_code.count("print") >= 4', True),
            ("w1-l3-vars", "Defines name and grade variables", 'assert "name" in user_code and "grade" in user_code', True),
        ],
    },

    "w1-l4": {
        "body": """
You have three ways to build messages in Python. Knowing all three makes you flexible.

## Method 1 — Commas in `print()`

```
name = "Soha"
print("Hi,", name)          # Hi, Soha
print("Grade:", 7)          # Grade: 7  ← numbers work too!
```

Python automatically puts a **space** between each comma-separated item.

## Method 2 — Concatenation with `+`

```
print("I love " + "Python")     # I love Python
print("Hi " + name)             # Hi Soha
```

⚠️ **Both sides must be strings.** Mixing types crashes:
```
print("Grade: " + 7)   # ❌ TypeError!
print("Grade: " + str(7))  # ✅ convert first
```

## Method 3 — f-strings (bonus — preview of Week 2)

```
grade = 7
print(f"I am in grade {grade}")    # I am in grade 7
```

The `f` before the quote and `{variable}` inside — Python fills it in automatically.

## Comparison table

| Method | Code | Auto-space? | Numbers OK? |
|--------|------|-------------|-------------|
| Commas | `print("Hi,", name)` | Yes | Yes |
| `+` concat | `print("Hi " + name)` | No (add manually) | Must use str() |
| f-string | `print(f"Hi {name}")` | You control | Yes |

## Common bugs

- Using curly "smart quotes" `"..."` from Word instead of straight `"..."` → `SyntaxError`
- Forgetting a space before the closing quote when using `+` → `"Hi Soha"` vs `"HiSoha"`
- `print("Grade:" + grade)` — TypeError; use a comma or `str(grade)`
""",
        "teacherScript": "Have Soha predict the output of each method before Run. Demonstrate the TypeError from mixing string + int — let her read the error and fix it herself using str() or a comma.",
        "practiceSteps": [
            "Read Learn — in the table, trace which method adds spaces automatically.",
            "Run the starter. Match each print line to a method in the table.",
            "Complete the YOUR TURN line using commas.",
            "Add a line using + concatenation (remember to keep both sides strings).",
            "Bonus: try one f-string line — print your name and grade in one sentence.",
        ],
        "starterCode": """
# Three ways to combine text — run each step and compare

name  = "Soha"
hobby = "Science Bowl"
grade = 7

# Method 1 — commas (Python adds spaces)
print("Hi,", name)
print("Grade:", grade)

# Method 2 — concatenation with +
print("I love " + hobby)
# ⚠️ try this: print("Grade: " + grade)  → TypeError!
# fix:         print("Grade: " + str(grade))

# Step 3 — YOUR TURN: print name and hobby using commas
# print(name, "loves", hobby + "!")

# Bonus — f-string preview
# print(f"{name} is in grade {grade}")
""",
        "codeTests": [
            ("w1-l4-commas", "Uses print with commas", 'assert "," in user_code', True),
            ("w1-l4-names", "Uses name and hobby variables", 'assert "name" in user_code and "hobby" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 3 — Loops (w3-l1, w3-l2, w3-l3 only; w3-l4 already rich)
    # ──────────────────────────────────────────────

    "w3-l1": {
        "body": """
A **`while` loop** repeats a block of code **as long as a condition is True**.

```
count = 1
while count <= 5:
    print("Count is", count)
    count += 1
print("Done!")
```

## Anatomy of a while loop

```
while <condition>:
    <indented body — runs each time>
```

1. Python checks the condition.
2. If True → run the body, then go back to step 1.
3. If False → skip the body and continue after the loop.

## Trace table — follow count step by step

| Check | count | count <= 5? | prints |
|-------|-------|-------------|--------|
| 1 | 1 | True | Count is 1 |
| 2 | 2 | True | Count is 2 |
| 3 | 3 | True | Count is 3 |
| 4 | 4 | True | Count is 4 |
| 5 | 5 | True | Count is 5 |
| 6 | 6 | False | (loop stops) |

## The `+=` shortcut

`count += 1` is the same as `count = count + 1`. It adds 1 and saves the result.

## Common bugs

| Bug | What happens |
|-----|-------------|
| Forgetting `count += 1` | Infinite loop — count stays 1 forever |
| Wrong indent on body | `IndentationError` or loop skips body |
| `while count = 5:` | `SyntaxError` — use `==`, not `=` |
| `while count < 5:` (not `<=`) | Prints 1–4, misses 5 |

⚠️ If your program seems frozen, press **Ctrl+C** to stop an infinite loop.
""",
        "teacherScript": "Before Run, trace on paper: write count=1, draw an arrow back, write count=2, etc. Ask: what is the LAST value of count when the loop finally stops? (6, because 6 <= 5 is False). Common mistake: <= vs <.",
        "practiceSteps": [
            "Read Learn — fill in the trace table for count 1 through 6 on paper.",
            "Run the starter — does 'Done!' print after the loop? (yes, it should).",
            "Change 5 to 10 — predict how many lines print, then Run and check.",
            "Complete the YOUR TURN line: print('Done!') after the loop.",
            "Try removing count += 1, run once, then immediately press Ctrl+C — see what infinite looks like.",
        ],
        "starterCode": """
# Step 1 — basic while loop
count = 1
while count <= 5:
    print("Count is", count)
    count += 1

# YOUR TURN: print("Done!") after the loop (no indent — outside the loop)

# Step 2 — countdown (challenge)
# n = 5
# while n > 0:
#     print(n)
#     n -= 1
# print("Blast off!")
""",
        "codeTests": [
            ("w3-l1-while", "Uses while loop", 'assert "while" in user_code', True),
            ("w3-l1-increment", "Increments counter inside loop", 'assert "+= 1" in user_code or "= count + 1" in user_code or "= n - 1" in user_code or "+= 1" in user_code', True),
        ],
    },

    "w3-l2": {
        "body": """
A **`for` loop** repeats a fixed number of times, or visits every item in a collection.

## `for` with `range()`

```
for i in range(5):
    print("Round", i + 1)
```

`range(5)` produces: `0, 1, 2, 3, 4` — **five** values, starting at 0.

| i | prints |
|---|--------|
| 0 | Round 1 |
| 1 | Round 2 |
| 2 | Round 3 |
| 3 | Round 4 |
| 4 | Round 5 |

## `range(start, stop)` — control the start

```
for i in range(1, 6):
    print(i)    # 1 2 3 4 5
```

Stop is **exclusive** — `range(1, 6)` goes 1 through 5, not 6.

## `for` over a list

```
colors = ["red", "green", "blue"]
for c in colors:
    print("I like", c)
```

Each round, `c` is the next item in the list.

## `while` vs `for` — when to use which

| Situation | Use |
|-----------|-----|
| Repeat a known number of times | `for` |
| Loop until something happens | `while` |
| Visit every item in a list | `for` |
| Wait for the user to type "done" | `while` |

## Common bugs

- `range(4)` → 0,1,2,3 (four items) — off-by-one if you expected 1–4
- Forgetting the colon `:` after `for i in range(...):`
- Indent error inside the loop body
- Changing `i` inside the loop — `i` resets each round anyway
""",
        "teacherScript": "Draw range(3) as boxes: [0, 1, 2]. Ask: how do we make it print 1, 2, 3 instead? (range(1,4) or i+1). Contrast with while: for is cleaner when you know the count.",
        "practiceSteps": [
            "Read Learn — on paper, write what range(3) produces (0, 1, 2) and range(1,4) produces (1, 2, 3).",
            "Run the starter — count the output lines. Does it match range(3)?",
            "Complete the YOUR TURN line: print 'Buzz!' inside the loop.",
            "Change range(3) to range(1, 11) and print each number — predict 10 lines first.",
            "Add a for loop that visits a list of 3 colors and prints each one.",
        ],
        "starterCode": """
# Step 1 — for with range (starts at 0)
for i in range(3):
    print("Round", i + 1)
    # YOUR TURN: print("Buzz!")

# Step 2 — range(start, stop)
print()
for i in range(1, 6):
    print(i)     # prints 1 through 5

# Step 3 — for over a list
print()
colors = ["red", "green", "blue"]
for c in colors:
    # YOUR TURN: print("I like", c)
    pass
""",
        "codeTests": [
            ("w3-l2-for", "Uses a for loop", 'assert "for" in user_code', True),
            ("w3-l2-range", "Uses range()", 'assert "range(" in user_code', True),
        ],
    },

    "w3-l3": {
        "body": """
**Mini project: Multiplication Table**

You will use a single `for` loop to print a complete times table.

## What it looks like

```
7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
...
7 x 10 = 70
```

## Building it

**Step 1 — pick a number:**
```
n = 7
```

**Step 2 — loop from 1 to 10:**
```
for i in range(1, 11):
    ...
```

`range(1, 11)` gives 1, 2, 3, …, 10.

**Step 3 — print each row:**
```
print(n, "x", i, "=", n * i)
```

## Full solution trace (n=7, first 3 rows)

| i | n * i | prints |
|---|-------|--------|
| 1 | 7 | `7 x 1 = 7` |
| 2 | 14 | `7 x 2 = 14` |
| 3 | 21 | `7 x 3 = 21` |

## Stretch goals

- Print two tables side by side (n=3 and n=7)
- Ask the user for `n` with `int(input(...))`
- Use an f-string: `print(f"{n} × {i} = {n*i}")`

## Common bugs

- `range(1, 10)` only goes to 9 — must be `range(1, 11)` for 1–10
- Typing `n * i` inside the string without `=` sign format: check your commas
""",
        "teacherScript": "Ask Soha to trace n=7, i=3 on paper before Run. Goal: she writes '7 x 3 = 21' without running. Then let her change n and predict the new last row.",
        "practiceSteps": [
            "Read Learn — trace n=7, i=1 and n=7, i=10 on paper. What prints each time?",
            "Run the starter — does it print 10 lines for n=7?",
            "Complete the YOUR TURN print line inside the loop.",
            "Change n to your favorite number — how does the output change?",
            "Stretch: add int(input()) to let the user pick n at runtime.",
        ],
        "starterCode": """
# Multiplication Table mini project

n = 7

for i in range(1, 11):
    # YOUR TURN: print(n, "x", i, "=", n * i)
    pass

# Stretch: ask the user for n
# n = int(input("Enter a number: "))
# for i in range(1, 11):
#     print(f"{n} x {i} = {n * i}")
""",
        "codeTests": [
            ("w3-l3-for", "Uses for loop with range(1, 11)", 'assert "for" in user_code and "range" in user_code', True),
            ("w3-l3-multiply", "Multiplies n * i", 'assert "n * i" in user_code or "n*i" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 4 — Functions
    # ──────────────────────────────────────────────

    "w4-l1": {
        "body": """
A **function** is a reusable block of code you name and call whenever needed.
Think of it as a custom LEGO piece you design once, then snap in anywhere.

## Defining a function

```
def greet(name):
    print("Hello,", name, "!")
```

- `def` — starts the definition
- `greet` — the function's name
- `(name)` — **parameter**: a variable that receives the caller's value
- Indented body — runs when the function is called

## Calling a function

```
greet("Soha")     # Hello, Soha !
greet("Python")   # Hello, Python !
```

Each call runs the body fresh with the new value of `name`.

## Anatomy trace — greet("Soha")

| Step | What Python does |
|------|-----------------|
| Sees `greet("Soha")` | Jumps into def greet |
| `name = "Soha"` | parameter gets the value |
| `print("Hello,", name, "!")` | prints Hello, Soha ! |
| Body ends | returns to the next line after the call |

## Why use functions?

- **Don't Repeat Yourself** — call once instead of copying 10 lines
- **Easier to test** — one function = one thing to check
- **Easier to read** — `greet("Soha")` tells you exactly what happens

## Common bugs

| Bug | Error |
|-----|-------|
| Forgetting `:` after `def greet(name)` | `SyntaxError` |
| Body not indented | `IndentationError` |
| Calling before defining | `NameError: greet is not defined` |
| Wrong number of arguments | `TypeError: greet() takes 1 argument` |
""",
        "teacherScript": "Show the def/call as a machine: greet() is the machine, 'Soha' is the input, the print is the output. Call greet() with two different names to prove the body runs fresh each time. Ask: what if we called greet() with no argument?",
        "practiceSteps": [
            "Read Learn — trace greet('Soha') on paper: write name='Soha', then the print output.",
            "Run the starter — does it print two greetings?",
            "Complete the YOUR TURN line inside greet() so it prints 'Hello, Soha !'.",
            "Add a third call: greet('Science Bowl') — what prints?",
            "Run auto-checks. Fix any IndentationError by aligning the body under def.",
        ],
        "starterCode": """
# Step 1 — define a function
def greet(name):
    # YOUR TURN: print("Hello,", name, "!")
    pass

# Step 2 — call it (definition must come first!)
greet("Soha")
greet("Python")

# Step 3 — add a second function with two parameters
# def introduce(name, subject):
#     print(name, "loves", subject)

# introduce("Soha", "Science")
""",
        "codeTests": [
            ("w4-l1-def", "Defines greet() function", 'assert "def greet" in user_code', True),
            ("w4-l1-call", "Calls greet at least once", 'assert "greet(" in user_code', True),
        ],
    },

    "w4-l2": {
        "body": """
Some functions **do** something (like `greet` printing text).
Others **calculate** and **send back** a result with `return`.

## `return` — giving back a value

```
def add(a, b):
    return a + b

total = add(3, 7)
print("Sum:", total)   # Sum: 10
```

`return` sends the value back to wherever the function was called.
You can store it, print it, or use it directly.

## Anatomy trace — add(3, 7)

| Step | What Python does |
|------|-----------------|
| Calls `add(3, 7)` | a=3, b=7 |
| `return a + b` | computes 10, sends it back |
| `total = ...` | stores 10 in total |
| `print("Sum:", total)` | prints Sum: 10 |

## Return vs print — what's the difference?

```
def bad_add(a, b):
    print(a + b)        # prints but returns None

def good_add(a, b):
    return a + b        # returns value — caller decides what to do

result = good_add(4, 5)
print("Double:", result * 2)   # works!

result = bad_add(4, 5)
print("Double:", result * 2)   # ❌ None * 2 crashes
```

## Multiple return points

```
def letter_grade(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    else:
        return "C"

print(letter_grade(85))   # B
```

## Common bugs

- Forgetting `return` → function returns `None` silently
- Using the result before storing it: `add(3,7) * 2` works, but store for readability
- `return` inside a loop exits the function on the first round
""",
        "teacherScript": "Draw two boxes: one is bad_add (prints but returns nothing useful), one is good_add (hands back a value). Ask: if I want to multiply the result by 2, which version do I need? Let Soha try to use bad_add's result to see the None error.",
        "practiceSteps": [
            "Read Learn — trace add(3, 7): write a=3, b=7, then 3+7=10, then total=10.",
            "Run the starter — read the output and match each line to a call.",
            "Complete the YOUR TURN line: print the result of add().",
            "Write a rectangle_area(width, height) function that returns width * height.",
            "Test letter_grade(95), letter_grade(85), letter_grade(70) — predict each grade.",
        ],
        "starterCode": """
# Step 1 — return a value
def add(a, b):
    return a + b

total = add(3, 7)
# YOUR TURN: print("Sum:", total)

# Step 2 — use the return value in more calculations
print("Double the sum:", add(3, 7) * 2)

# Step 3 — function with if/else and return
def letter_grade(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    else:
        return "C"

# YOUR TURN: print(letter_grade(85))
# YOUR TURN: print(letter_grade(92))
""",
        "codeTests": [
            ("w4-l2-return", "Uses return keyword", 'assert "return" in user_code', True),
            ("w4-l2-call", "Calls the function and uses the result", 'assert "add(" in user_code or "letter_grade(" in user_code', True),
        ],
    },

    "w4-l3": {
        "body": """
**Mini project: Calculator functions**

Real programs organize code into functions so each piece does one job.
Today you will write `add`, `subtract`, `multiply`, and optionally `divide`.

## Design plan

| Function | Parameters | Returns | Example |
|----------|------------|---------|---------|
| `add(a, b)` | two numbers | sum | `add(3, 4)` → 7 |
| `subtract(a, b)` | two numbers | difference | `subtract(10, 4)` → 6 |
| `multiply(a, b)` | two numbers | product | `multiply(6, 7)` → 42 |
| `divide(a, b)` | two numbers | quotient or error | `divide(8, 0)` → "Error" |

## Safe divide — handling zero

```
def divide(a, b):
    if b == 0:
        return "Error: cannot divide by zero"
    return a / b
```

This is your first taste of **defensive programming** — anticipate bad input.

## Running the full calculator

```
print(add(10, 5))        # 15
print(subtract(10, 5))   # 5
print(multiply(6, 7))    # 42
print(divide(8, 2))      # 4.0
print(divide(8, 0))      # Error: cannot divide by zero
```

## Common bugs

- Forgetting `return` → every result is `None`
- `multiply(6, 7)` but function is named `Multiply` (capital M) → `NameError`
- `divide(8, 0)` without a zero-check → `ZeroDivisionError`
""",
        "teacherScript": "Ask Soha to write divide on her own after seeing the pattern in add and subtract. Let her hit the ZeroDivisionError first, then guide the fix with the if b == 0 check. This is real error handling they'll see formally in Week 12.",
        "practiceSteps": [
            "Read Learn — on paper write what each function should return for add(3,4), subtract(10,4), multiply(6,7).",
            "Run the starter — multiply already works. Does the output make sense?",
            "Complete the YOUR TURN: print multiply(6, 7).",
            "Add subtract(a, b) and add(a, b) functions following the same pattern.",
            "Bonus: write divide(a, b) that returns an error message when b is 0.",
        ],
        "starterCode": """
# Step 1 — multiply function (already done)
def multiply(a, b):
    return a * b

# YOUR TURN: print(multiply(6, 7))

# Step 2 — YOUR TURN: write add(a, b)
# def add(a, b):
#     return a + b

# Step 3 — YOUR TURN: write subtract(a, b)
# def subtract(a, b):
#     return a - b

# Step 4 — challenge: safe divide
# def divide(a, b):
#     if b == 0:
#         return "Error: divide by zero"
#     return a / b

# print(divide(10, 2))
# print(divide(5, 0))
""",
        "codeTests": [
            ("w4-l3-multiply", "Defines multiply function", 'assert "def multiply" in user_code', True),
            ("w4-l3-return", "Uses return in functions", 'assert "return" in user_code', True),
        ],
    },

    "w4-l4": {
        "body": """
Programs that remember things between runs need to **save to a file**.
Python makes it simple with `open()` and the `with` statement.

## Three file modes

| Mode | Symbol | Does |
|------|--------|------|
| Write | `"w"` | Creates or **overwrites** the file |
| Append | `"a"` | Adds to the **end** — never erases |
| Read | `"r"` | Reads contents (default) |

## Writing a file

```
with open("notes.txt", "w") as f:
    f.write("Line 1 from Soha\\n")
```

- `with` automatically closes the file when the block ends
- `\\n` is the newline character — moves to the next line on disk

## Appending to a file

```
with open("notes.txt", "a") as f:
    f.write("Line 2 added later\\n")
```

## Reading a file

```
with open("notes.txt") as f:
    content = f.read()
    print(content)
```

## Full trace — what is in notes.txt after all three blocks?

```
Line 1 from Soha
Line 2 added later
```

## `readlines()` — one item per line

```
with open("notes.txt") as f:
    lines = f.readlines()
    for line in lines:
        print(line.strip())    # strip() removes \\n at end
```

## Common bugs

- Forgetting `\\n` → all text runs together on one line
- Using `"w"` to add more text → **erases** the file first! Use `"a"` to append
- `FileNotFoundError` on read → file path is wrong or you never created the file
- Forgetting `as f:` → `SyntaxError`
""",
        "teacherScript": "After the code runs, open notes.txt in TextEdit together so Soha sees the file on disk. Ask: what mode would you use if you want to keep adding daily notes without losing old ones? (a for append). Compare write vs append with a real-world analogy: 'w' is whiteout, 'a' is a pen.",
        "practiceSteps": [
            "Read Learn — in the table, cover the 'Does' column and recall what each mode does.",
            "Run the starter — do you see 'Line 1' and 'Line 2' printed?",
            "Complete the YOUR TURN: print(f.read()) inside the read block.",
            "Append a third line with your own text using mode 'a'.",
            "Change the write block to mode 'a' — what happens to Line 1? (it disappears)",
        ],
        "starterCode": """
# Step 1 — write (creates or overwrites the file)
with open("notes.txt", "w") as f:
    f.write("Line 1 from Soha\\n")

# Step 2 — append (adds to the end)
with open("notes.txt", "a") as f:
    f.write("Line 2 appended\\n")

# Step 3 — read and print
with open("notes.txt") as f:
    # YOUR TURN: print(f.read())

# Step 4 — readlines (challenge)
# with open("notes.txt") as f:
#     for line in f.readlines():
#         print(line.strip())
""",
        "codeTests": [
            ("w4-l4-write", "Opens file in write or append mode", 'assert \'"w"\' in user_code or \'"a"\' in user_code', True),
            ("w4-l4-read", "Opens file for reading", 'assert "open(" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 5 — First Games
    # ──────────────────────────────────────────────

    "w5-l1": {
        "body": """
Games need **surprise** — the same input should not always produce the same result.
Python's `random` module provides that unpredictability.

## Import first, then use

```
import random

dice = random.randint(1, 6)
print("You rolled", dice)
```

`random.randint(a, b)` picks a whole number between `a` and `b` **inclusive** — both endpoints can appear.

## Other useful random tools

| Function | Returns | Example |
|----------|---------|---------|
| `random.randint(1, 10)` | int 1–10 | `7` |
| `random.choice(my_list)` | one item from a list | `"rock"` |
| `random.random()` | float 0.0–1.0 | `0.6231` |

## Trace — rolling two dice

```
die1 = random.randint(1, 6)
die2 = random.randint(1, 6)
total = die1 + die2
print(f"Rolled {die1} + {die2} = {total}")
```

Run this five times — total is different each time!

## `random.choice` preview (used in Rock Paper Scissors)

```
choices = ["rock", "paper", "scissors"]
computer = random.choice(choices)
print("Computer chose:", computer)
```

## Common bugs

- Forgetting `import random` → `NameError: name 'random' is not defined`
- `random.randint(1, 6)` not `random.randInt` (capital I → AttributeError)
- Using `random.randint(1,6)` without parens → SyntaxError
""",
        "teacherScript": "Run random.randint(1,6) five times live and note each result — show that outcomes are truly different. Ask: could we get 7? (No — both endpoints, 1 and 6, are included; 7 is out of range). Compare to rolling a physical die.",
        "practiceSteps": [
            "Read Learn — in the table, cover the 'Returns' column and recall each function.",
            "Run the starter — what dice value do you get? Run again — is it different?",
            "Complete the YOUR TURN: print('You rolled', dice).",
            "Add die2 = random.randint(1,6) and print the total of both dice.",
            "Bonus: use random.choice(['rock','paper','scissors']) and print the result.",
        ],
        "starterCode": """
# Step 1 — import random (always at the top)
import random

# Step 2 — roll one die
dice = random.randint(1, 6)
# YOUR TURN: print("You rolled", dice)

# Step 3 — roll two dice and add them
# die1 = random.randint(1, 6)
# die2 = random.randint(1, 6)
# print(f"Rolled {die1} + {die2} = {die1 + die2}")

# Step 4 — random.choice (preview for RPS)
# choices = ["rock", "paper", "scissors"]
# print("Computer chose:", random.choice(choices))
""",
        "codeTests": [
            ("w5-l1-import", "Imports random", 'assert "import random" in user_code', True),
            ("w5-l1-randint", "Uses random.randint", 'assert "randint" in user_code', True),
        ],
    },

    "w5-l2": {
        "body": """
**Game 1: Guess the Number**

The computer picks a secret number from 1–100.
You keep guessing until you get it right.

## How it works

```
import random

secret = random.randint(1, 100)
guesses = 0

while True:
    guess = int(input("Your guess: "))
    guesses += 1
    if guess < secret:
        print("Too low!")
    elif guess > secret:
        print("Too high!")
    else:
        print(f"You got it in {guesses} tries!")
        break
```

## Key patterns

| Pattern | Purpose |
|---------|---------|
| `while True: ... break` | Keep looping until player wins |
| `guesses += 1` | Count attempts |
| `if / elif / else` | Give a hint each round |
| `int(input(...))` | Convert string → int for comparison |

## Trace — secret = 50, guess sequence: 25, 75, 50

| Guess | compare | prints |
|-------|---------|--------|
| 25 | 25 < 50 | Too low! |
| 75 | 75 > 50 | Too high! |
| 50 | 50 == 50 | You got it in 3 tries! (break) |

## Stretch goals

- Max 7 guesses — add `if guesses >= 7: print("Game over!"); break`
- Narrow the range to 1–10 for a quick demo

## Common bugs

- `guess = input(...)` without `int()` → compares string to int → always "Too low!" or "Too high!" even when correct
- `break` outside the `else` → exits after every guess
""",
        "teacherScript": "Walk through one round together — teacher plays the game while Soha traces the loop on paper. Ask: without the break, what happens when you guess correctly? (Loops forever). Goal: connect while True + break to the Pizza Shop pattern from w2-l5.",
        "practiceSteps": [
            "Read Learn — trace secret=50, guess=25. Write: 25<50? Yes → Too low!",
            "Run the full starter (it's in the Games tab). Play one real game.",
            "After winning, read the code — find the break and explain why it's in the else.",
            "Add a guesses counter and print 'You got it in N tries!' at the end.",
            "Stretch: add a max-guesses limit so the game ends after 7 wrong guesses.",
        ],
        "starterCode": """
# Guess the Number — complete this game!
import random

secret  = random.randint(1, 100)
guesses = 0

print("I'm thinking of a number from 1 to 100!")

while True:
    guess = int(input("Your guess: "))
    guesses += 1

    if guess < secret:
        print("Too low!")
    elif guess > secret:
        print("Too high!")
    else:
        # YOUR TURN: print a win message using guesses
        print(f"You got it in {guesses} tries!")
        break

# Stretch: add a max guesses limit
# if guesses >= 7:
#     print("Game over! The number was", secret)
#     break
""",
        "codeTests": [
            ("w5-l2-random", "Uses random.randint and secret", 'assert "randint" in user_code and "secret" in user_code', True),
            ("w5-l2-loop", "Has while loop and break", 'assert "while" in user_code and "break" in user_code', True),
        ],
    },

    "w5-l3": {
        "body": """
**Game 2: Rock Paper Scissors**

Best-of-3 rounds against the computer using `random.choice`.

## Rules

| Player | Computer | Winner |
|--------|----------|--------|
| rock | scissors | Player |
| scissors | paper | Player |
| paper | rock | Player |
| same | same | Tie |

## Code structure

```
import random

choices = ["rock", "paper", "scissors"]
player_score = 0
computer_score = 0

for round_num in range(1, 4):
    player   = input("Rock, paper, or scissors? ").lower()
    computer = random.choice(choices)
    print(f"Computer chose {computer}")

    if player == computer:
        print("Tie!")
    elif (player == "rock"     and computer == "scissors") or \\
         (player == "paper"    and computer == "rock")     or \\
         (player == "scissors" and computer == "paper"):
        print("You win this round!")
        player_score += 1
    else:
        print("Computer wins this round!")
        computer_score += 1

print(f"Final: You {player_score} — Computer {computer_score}")
```

## Trace — round 1: player=rock, computer=scissors

| Condition checked | Result |
|------------------|--------|
| `player == computer`? rock == scissors? | False |
| `rock and scissors`? | True → You win! |

## Key patterns

- `.lower()` — converts player input so "Rock" and "rock" both work
- `or` in elif — three winning combos chained with `or`
- `range(1, 4)` — exactly 3 rounds

## Common bugs

- Not calling `.lower()` → "Rock" ≠ "rock" → wrong branch
- Forgetting to update `player_score` or `computer_score` inside the correct branch
- Line continuation: the backslash must be the last character on the line (no space after)
""",
        "teacherScript": "Before coding, play one physical round on paper — trace each condition. Ask: what is .lower() for? What if the player types 'ROCK'? Then connect the elif chain to the real game rules.",
        "practiceSteps": [
            "Read Learn — fill in the rules table for all three winning combos.",
            "Run the starter (from Games tab) and play all 3 rounds.",
            "Find the line that updates player_score and explain when it runs.",
            "Add .lower() if it's missing — type 'ROCK' to test.",
            "Stretch: add input validation — reject anything that isn't rock/paper/scissors.",
        ],
        "starterCode": """
# Rock Paper Scissors — best of 3
import random

choices        = ["rock", "paper", "scissors"]
player_score   = 0
computer_score = 0

for round_num in range(1, 4):
    print(f"\\n--- Round {round_num} ---")
    player   = input("Rock, paper, or scissors? ").lower()
    computer = random.choice(choices)
    print(f"Computer chose {computer}")

    if player == computer:
        print("Tie!")
    elif (player == "rock"     and computer == "scissors") or \\
         (player == "paper"    and computer == "rock")     or \\
         (player == "scissors" and computer == "paper"):
        print("You win this round!")
        player_score += 1
    else:
        print("Computer wins this round!")
        computer_score += 1

# YOUR TURN: print the final scores
print(f"\\nFinal: You {player_score} — Computer {computer_score}")
""",
        "codeTests": [
            ("w5-l3-choices", "Defines choices list and score vars", 'assert "choices" in user_code and "player_score" in user_code', True),
            ("w5-l3-loop", "Uses for loop for 3 rounds", 'assert "for" in user_code and "range" in user_code', True),
        ],
    },

    "w5-l4": {
        "body": """
A **tuple** is like a list — but **immutable** (it cannot change after creation).

## Creating a tuple

```
point = (3, 4)
print(point[0])   # 3
print(point[1])   # 4
```

Parentheses, items separated by commas.  Access by index, same as lists.

## List vs Tuple — when to use which

| | List `[]` | Tuple `()` |
|--|-----------|------------|
| Can change? | Yes — append, remove | No — fixed forever |
| Use for | Menu items, scores | Coordinates, RGB colors |
| Example | `["cheese", "pepperoni"]` | `(255, 128, 0)` |

## Unpacking — assign multiple variables at once

```
x, y = (3, 4)
print("x:", x)   # 3
print("y:", y)   # 4
```

This is how pygame returns mouse position: `x, y = pygame.mouse.get_pos()`

## Tuples in a list (useful for quizzes!)

```
questions = [
    ("What is 2+2?", "4"),
    ("Python creator?", "Guido"),
]
for q, answer in questions:
    print(q, "→", answer)
```

## Common bugs

- `point[0] = 5` → `TypeError: 'tuple' object does not support item assignment`
- Forgetting the comma: `single = (42)` is just an int; `single = (42,)` is a tuple
- Unpacking the wrong number of variables: `x, y = (3, 4, 5)` → `ValueError`
""",
        "teacherScript": "Compare to coordinates on a math graph: (x, y) doesn't change — it's a fixed location. Show the TypeError when trying to modify a tuple element. Connect to pygame: pygame.Rect positions are often tuples.",
        "practiceSteps": [
            "Read Learn — what is one situation where you'd choose tuple over list?",
            "Run the starter — print x and y from point using unpacking.",
            "Complete the YOUR TURN: print('x:', point[0], 'y:', point[1]).",
            "Try point[0] = 99 and run — read the TypeError message.",
            "Create a list of 3 (question, answer) tuples and loop through them.",
        ],
        "starterCode": """
# Step 1 — create a tuple
point = (3, 4)
# YOUR TURN: print("x:", point[0], "y:", point[1])

# Step 2 — unpacking
x, y = point
print("Unpacked — x:", x, "y:", y)

# Step 3 — RGB color tuple
red_color = (255, 0, 0)
print("Red channel:", red_color[0])

# Step 4 — tuples in a list (question/answer pairs)
qa = [("Capital of France?", "Paris"), ("2 + 2?", "4")]
for question, answer in qa:
    # YOUR TURN: print(question, "→", answer)
    pass

# Step 5 — try modifying (will crash — that's the lesson!)
# point[0] = 99   # uncomment to see TypeError
""",
        "codeTests": [
            ("w5-l4-tuple", "Creates a tuple", 'assert "(" in user_code and "point" in user_code', True),
            ("w5-l4-index", "Accesses tuple by index or unpacking", 'assert "point[0]" in user_code or "x, y" in user_code', True),
        ],
    },

    "w5-l5": {
        "body": """
Two power-ups that make functions flexible: **default parameters** and **`*args`**.

## Default parameters

```
def greet(name, greeting="Hello"):
    print(greeting + ",", name)

greet("Soha")           # Hello, Soha    ← uses default
greet("Soha", "Hi")    # Hi, Soha       ← overrides default
```

If the caller doesn't supply `greeting`, Python uses `"Hello"`.
Default parameters must come **after** non-default ones.

## `*args` — collect any number of arguments

```
def total(*numbers):
    return sum(numbers)

print(total(1, 2, 3))       # 6
print(total(10, 20))        # 30
print(total(5))             # 5
```

`*numbers` collects all positional arguments into a **tuple** named `numbers`.

## Trace — total(1, 2, 3)

| Step | numbers | sum(numbers) |
|------|---------|-------------|
| call | (1, 2, 3) | 6 |
| return | — | 6 |

## Combining both

```
def report(*scores, label="Score"):
    avg = sum(scores) / len(scores)
    print(f"{label}: {avg:.1f}")

report(80, 90, 85)                  # Score: 85.0
report(70, 95, label="Science Bowl") # Science Bowl: 82.5
```

## Common bugs

- Default parameter before non-default: `def greet(greeting="Hi", name)` → `SyntaxError`
- Calling `total()` with no arguments → `sum(())` → 0 (fine) but `len(scores)` in avg crashes (ZeroDivisionError)
- Confusing `*args` (tuple) with `args` (regular variable name)
""",
        "teacherScript": "Call total() with 2, then 3, then 5 arguments to show flexibility. Explain: the * star collects everything extra into a tuple. Ask Soha to predict the output of report(80, 90, 85) before Run.",
        "practiceSteps": [
            "Read Learn — trace greet('Soha') vs greet('Soha', 'Hi') — which greeting shows each time?",
            "Run the starter — which greet call uses the default?",
            "Complete the YOUR TURN: print(total(1, 2, 3)).",
            "Write a new function biggest(*nums) that returns max(nums).",
            "Bonus: call report() with your actual quiz scores and label='NSB Score'.",
        ],
        "starterCode": """
# Step 1 — default parameter
def greet(name, greeting="Hello"):
    print(greeting + ",", name)

greet("Soha")           # uses default greeting
greet("Soha", "Hi")    # overrides greeting

# Step 2 — *args collects any number of arguments
def total(*numbers):
    return sum(numbers)

# YOUR TURN: print(total(1, 2, 3))
# YOUR TURN: print(total(10, 20))

# Step 3 — combine both (challenge)
# def report(*scores, label="Score"):
#     avg = sum(scores) / len(scores)
#     print(f"{label}: {avg:.1f}")

# report(80, 90, 85)
# report(70, 95, label="Science Bowl")
""",
        "codeTests": [
            ("w5-l5-default", "Uses default parameter in a function", 'assert "greeting=" in user_code or "greeting =" in user_code', True),
            ("w5-l5-args", "Uses *args pattern", 'assert "*numbers" in user_code or "*nums" in user_code or "*scores" in user_code or "*args" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 6 — Lists & Quiz Game
    # ──────────────────────────────────────────────

    "w6-l1": {
        "body": """
A **list** stores multiple values in a single variable, in order.

```
fruits = ["apple", "banana", "cherry"]
```

## Accessing items — index starts at 0

```
print(fruits[0])    # apple   ← first
print(fruits[1])    # banana
print(fruits[-1])   # cherry  ← last (negative index counts from end)
```

| Index | 0 | 1 | 2 | -1 |
|-------|---|---|---|----|
| Value | apple | banana | cherry | cherry |

## Adding and removing items

```
fruits.append("date")       # add to end
fruits.remove("banana")     # remove first match
fruits.insert(0, "avocado") # insert at position 0
```

## Useful list operations

```
print(len(fruits))          # count of items
print("apple" in fruits)    # True if apple is in the list
fruits.sort()               # sort alphabetically (in place)
print(fruits[0:2])          # slice: first two items
```

## Why lists matter for games

- **Quiz**: list of questions
- **Score tracker**: list of past scores
- **Inventory**: items the player collected
- **Coins**: positions of coins in Coin Collector

## Common bugs

- `fruits[3]` when list has 3 items → `IndexError: list index out of range` (indices 0,1,2 only)
- `fruits.Append(...)` (capital A) → `AttributeError`
- Using `=` to copy: `other = fruits` — they share the same list! Use `other = fruits[:]` to copy
""",
        "teacherScript": "Draw three boxes with indices 0,1,2 labeling fruits. Ask: what index is 'cherry'? (2). What is fruits[-1]? (cherry). Connect to Science Bowl quiz: each question is a list item.",
        "practiceSteps": [
            "Read Learn — on paper write the index for each fruit (apple=0, banana=1, cherry=2).",
            "Run the starter — what does fruits[-1] print?",
            "Add a fourth fruit with .append() and print the full list.",
            "Remove 'banana' with .remove() and print the list again.",
            "Print len(fruits) before and after adding — see how it changes.",
        ],
        "starterCode": """
# Step 1 — create a list
fruits = ["apple", "banana", "cherry"]
print(fruits[0])      # first item
print(fruits[-1])     # last item
print(len(fruits))    # count

# Step 2 — add and remove
fruits.append("date")
print(fruits)

# Step 3 — YOUR TURN: remove "banana" and print the list
# fruits.remove("banana")
# print(fruits)

# Step 4 — slice (first two items)
print(fruits[0:2])

# Step 5 — check membership
# YOUR TURN: print("apple" in fruits)
""",
        "codeTests": [
            ("w6-l1-list", "Creates a list and uses append", 'assert "[" in user_code and "append" in user_code', True),
            ("w6-l1-index", "Accesses list by index", 'assert "[0]" in user_code or "[-1]" in user_code', True),
        ],
    },

    "w6-l2": {
        "body": """
`for item in my_list:` visits **every element**, one per round.

## Basic pattern

```
colors = ["red", "green", "blue"]
for c in colors:
    print("I like", c)
```

Output:
```
I like red
I like green
I like blue
```

## `enumerate` — get index AND value

```
for i, c in enumerate(colors):
    print(i, ":", c)
```

Output:
```
0 : red
1 : green
2 : blue
```

## Looping with `range(len(...))`

```
for i in range(len(colors)):
    print(f"Color {i}: {colors[i]}")
```

Same result — use `for item in list` when you don't need the index; use `enumerate` when you do.

## Building a new list from a loop

```
scores = [70, 85, 90, 88]
bonuses = []
for s in scores:
    bonuses.append(s + 5)
print(bonuses)   # [75, 90, 95, 93]
```

## Trace — scores loop (first 2 rounds)

| Round | s | bonuses |
|-------|---|---------|
| 1 | 70 | [75] |
| 2 | 85 | [75, 90] |

## Common bugs

- Modifying the list you're iterating over → skip items or errors — copy first: `for x in scores[:]:`
- `for item in colors` without `:` → `SyntaxError`
- Indentation wrong → body runs only once (outside loop) or `IndentationError`
""",
        "teacherScript": "Draw a loop arrow: list → first item → body → back to list → second item. Ask: how many times does the body run if there are 5 colors? (5). Connect enumerate to the quiz: we need i so we can display 'Question 1, 2, 3...'",
        "practiceSteps": [
            "Read Learn — trace the colors loop: write 'I like red', then 'I like green', then 'I like blue'.",
            "Run the starter — complete the YOUR TURN print inside the loop.",
            "Add enumerate: print the index and color together.",
            "Build a bonuses list by looping over scores and appending each score + 5.",
            "Change the list to 5 Science Bowl subjects and print each one.",
        ],
        "starterCode": """
# Step 1 — for loop over a list
colors = ["red", "green", "blue"]
for c in colors:
    # YOUR TURN: print("I like", c)
    pass

# Step 2 — enumerate (index + value)
print()
for i, c in enumerate(colors):
    print(i, ":", c)

# Step 3 — build a new list from a loop
scores  = [70, 85, 90, 88]
bonuses = []
for s in scores:
    bonuses.append(s + 5)
print("Bonuses:", bonuses)

# Step 4 — YOUR TURN: print only scores >= 85
# for s in scores:
#     if s >= 85:
#         print("High score:", s)
""",
        "codeTests": [
            ("w6-l2-for-list", "Uses for loop over a list", 'assert "for" in user_code and "in" in user_code', True),
            ("w6-l2-body", "Has code inside the loop body", 'assert "print" in user_code or "append" in user_code', True),
        ],
    },

    "w6-l3": {
        "body": """
**Game 3: Science Quiz Game**

Science Bowl–style multiple-choice quiz — 5 toss-ups, a running score, final result.

## Data structure — list of tuples

```
questions = [
    ("What gas do plants release during photosynthesis?",
     ["Oxygen", "Carbon dioxide", "Nitrogen"], 0),
    ...
]
```

Each item is `(question_text, [options], correct_index)`.

## Game loop

```
score = 0
for q, options, correct in questions:
    print("\\n" + q)
    for i, opt in enumerate(options):
        print(f"  {i}. {opt}")
    answer = int(input("Answer number: "))
    if answer == correct:
        print("Correct! ✓")
        score += 1
    else:
        print(f"Nope — answer was {options[correct]}")

print(f"\\nYou scored {score} / {len(questions)}")
```

## Trace — question 1, player answers 0

| Step | What happens |
|------|-------------|
| `q, options, correct = questions[0]` | Unpack first tuple |
| Print question | "What gas do plants release...?" |
| Print options 0,1,2 | "0. Oxygen 1. Carbon dioxide 2. Nitrogen" |
| `answer = int(input(...))` | Player types 0 |
| `0 == 0` | True → "Correct!" score → 1 |

## Adding your own NSB questions

```
("Which layer of the atmosphere contains the ozone layer?",
 ["Troposphere", "Stratosphere", "Mesosphere"], 1),
```

## Common bugs

- `int(input(...))` — if player types a letter → `ValueError`; handle with try/except later
- `correct_index` out of range → `IndexError`; make sure your index matches the options list position
- Forgetting `\\n` before the question → all questions run together without spacing
""",
        "teacherScript": "Connect to Science Bowl prep — Soha already knows these topics. Ask her to add 2 real NSB practice questions from her DOE materials. Celebrate every correct answer. After the game, show how to change the scoring to percentage.",
        "practiceSteps": [
            "Read Learn — unpack one question tuple on paper: what is q? what is options? what is correct?",
            "Run the starter (from Games tab) and answer all 5 questions.",
            "Add 2 Science Bowl questions you know from practice.",
            "Change the final print to show percentage: f'{score/len(questions)*100:.0f}%'.",
            "Stretch: shuffle questions with random.shuffle(questions) before the loop.",
        ],
        "starterCode": """
# Science Bowl–style quiz game
questions = [
    ("What gas do plants release during photosynthesis?",
     ["Oxygen", "Carbon dioxide", "Nitrogen"], 0),
    ("H2O is the chemical formula for?",
     ["Salt", "Water", "Hydrogen gas"], 1),
    ("Speed equals distance divided by?",
     ["Time", "Mass", "Volume"], 0),
    ("What organelle is the powerhouse of the cell?",
     ["Nucleus", "Mitochondria", "Ribosome"], 1),
    ("Which planet is known as the Red Planet?",
     ["Venus", "Mars", "Jupiter"], 1),
]

score = 0
for q, options, correct in questions:
    print("\\n" + q)
    for i, opt in enumerate(options):
        print(f"  {i}. {opt}")
    answer = int(input("Answer number: "))
    if answer == correct:
        print("Correct!")
        score += 1
    else:
        # YOUR TURN: print which answer was correct
        print(f"Nope — it was {options[correct]}")

# YOUR TURN: print final score
print(f"\\nYou scored {score} / {len(questions)}")
""",
        "codeTests": [
            ("w6-l3-questions", "At least 5 questions defined", 'assert user_code.count("(") >= 5 and "questions" in user_code', True),
            ("w6-l3-score", "Tracks score in a loop", 'assert "score" in user_code and "for" in user_code', True),
        ],
    },

    "w6-l4": {
        "body": """
**Tkinter** lets you build real desktop windows — buttons, labels, text boxes — without a browser.

## Minimal window

```
import tkinter as tk

root = tk.Tk()
root.title("Hello GUI")
root.geometry("300x200")   # width x height in pixels

root.mainloop()            # keeps the window open
```

⚠️ `mainloop()` blocks — the program stays here until you close the window.
Use **Open in Terminal** to run Tkinter programs, not the in-app Run button.

## Adding widgets

```
# Label — displays text
tk.Label(root, text="Hi from Soha!").pack(pady=10)

# Button — clickable
def on_click():
    print("Button clicked!")

tk.Button(root, text="Click me", command=on_click).pack()
```

- `.pack()` places the widget in the window
- `pady=10` adds 10 pixels of padding above/below
- `command=on_click` — note: **no parentheses** after function name

## Widget reference

| Widget | Purpose | Example |
|--------|---------|---------|
| `tk.Label` | Show text | `tk.Label(root, text="Hi")` |
| `tk.Button` | Click action | `tk.Button(root, text="Go", command=fn)` |
| `tk.Entry` | Text input | `tk.Entry(root)` |
| `tk.Text` | Multi-line | `tk.Text(root, height=5)` |

## Common bugs

- `command=on_click()` with parentheses → calls function immediately, doesn't wait for click
- Running inside the app playground (not Terminal) → window may not appear
- Forgetting `root.mainloop()` → window flashes and closes instantly
""",
        "teacherScript": "First button click is a milestone — celebrate it! Ask: what happens if we write command=on_click() with parentheses? (Run it and see: the function fires immediately instead of on click). Show that .pack() order determines top-to-bottom layout.",
        "practiceSteps": [
            "Read Learn — what does mainloop() do? Why run in Terminal for Tkinter?",
            "Run the starter in Terminal (Open in Terminal from Playground).",
            "Complete the YOUR TURN Button line so clicking prints 'Clicked!'.",
            "Add a second Label with today's date (you can hardcode it as a string).",
            "Bonus: add a Quit button with command=root.destroy.",
        ],
        "starterCode": """
# Tkinter window — run with Open in Terminal
import tkinter as tk

root = tk.Tk()
root.title("Hello GUI")
root.geometry("300x200")

# Label
tk.Label(root, text="Hi from Soha!", font=("Arial", 16)).pack(pady=20)

# YOUR TURN: add a button that prints when clicked
# def on_click():
#     print("Button clicked!")
# tk.Button(root, text="Click me", command=on_click).pack()

# Quit button
tk.Button(root, text="Quit", command=root.destroy).pack(pady=10)

root.mainloop()
""",
        "codeTests": [
            ("w6-l4-tk", "Imports tkinter and creates root", 'assert "tkinter" in user_code and "Tk()" in user_code', True),
            ("w6-l4-mainloop", "Calls mainloop", 'assert "mainloop" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 7 — Maps & pygame intro
    # ──────────────────────────────────────────────

    "w7-l1": {
        "body": """
Every game needs to track **where** things are.
On a screen, positions use a coordinate system — but it flips from what you learned in math class.

## Screen coordinates

```
(0, 0) ──── x increases →
  |
  y increases ↓
```

- `(0, 0)` is the **top-left** corner
- `x` increases going **right**
- `y` increases going **down** (opposite of a math graph!)

## Text version — tracking position

```
x, y = 0, 0
print("Start at", x, y)   # 0 0

x += 1   # move right
print("Moved right:", x, y)   # 1 0

y += 1   # move down
print("Moved down:", x, y)    # 1 1
```

## Boundary checking

```
size = 3
if x < size - 1:
    x += 1    # can move right
else:
    print("Wall!")   # at the edge
```

## Grid display — 2D list

```
grid = [
    [".", ".", "T"],
    [".", "#", "."],
    ["P", ".", "."],
]
for row in grid:
    print(" ".join(row))
```

Output:
```
. . T
. # .
P . .
```

`P` = player at (0,2), `T` = treasure at (2,0), `#` = wall.

## Common bugs

- Confusing row (y) and column (x) in a 2D list: `grid[y][x]` not `grid[x][y]`
- Moving beyond the boundary: always check before updating position
- `y` going down feels backwards — draw the grid before you code
""",
        "teacherScript": "Draw a 3x3 grid on paper. Label x=0,1,2 across the top and y=0,1,2 down the side. Put P at (0,0) and move it right twice — what are the new coordinates? Ask: what is grid[1][2]? (the middle-right cell).",
        "practiceSteps": [
            "Read Learn — draw the screen coordinate system on paper (0,0 top-left, y down).",
            "Run the starter — what is the output after x += 1?",
            "Complete the YOUR TURN: print('Moved right:', x, y).",
            "Add boundary checking: only increase x if x < 5.",
            "Print a simple 3x3 grid using a 2D list and a for loop.",
        ],
        "starterCode": """
# Step 1 — track x,y position
x, y = 0, 0
print("Start at", x, y)

x += 1   # move right
# YOUR TURN: print("Moved right:", x, y)

y += 1   # move down
print("Moved down:", x, y)

# Step 2 — boundary check
size = 5
if x < size - 1:
    x += 1
    print("Moved right to:", x)
else:
    print("At the right wall!")

# Step 3 — 2D grid display
grid = [[".", ".", "T"], [".", "#", "."], ["P", ".", "."]]
for row in grid:
    print(" ".join(row))
""",
        "codeTests": [
            ("w7-l1-xy", "Tracks x and y variables", 'assert "x" in user_code and "y" in user_code', True),
            ("w7-l1-boundary", "Checks boundary before moving", 'assert "if x" in user_code or "if y" in user_code', True),
        ],
    },

    "w7-l2": {
        "body": """
**pygame** is the library that powers 2D games in Python — windows, graphics, keyboard, and more.

## Install once

```
pip3 install pygame
```

Run this in Terminal **one time**. After that, just `import pygame`.

## Minimal pygame window

```
import pygame
pygame.init()

screen = pygame.display.set_mode((400, 300))
pygame.display.set_caption("My Game")
clock  = pygame.time.Clock()

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((30, 30, 80))              # dark blue background
    pygame.draw.rect(screen, (255,100,100), (50, 70, 40, 40))  # red square
    pygame.display.flip()
    clock.tick(30)                          # 30 frames per second

pygame.quit()
```

## Key pygame building blocks

| Code | Purpose |
|------|---------|
| `pygame.init()` | Start all pygame modules |
| `pygame.display.set_mode((w,h))` | Create window |
| `screen.fill((r,g,b))` | Paint background |
| `pygame.draw.rect(screen, color, rect)` | Draw rectangle |
| `pygame.event.get()` | Read keyboard/mouse events |
| `pygame.display.flip()` | Show the frame |
| `clock.tick(30)` | Limit to 30 FPS |
| `pygame.quit()` | Clean up |

## rect format

`(x, y, width, height)` — top-left corner, then size.
```
pygame.draw.rect(screen, (255, 215, 0), (50, 70, 40, 40))
```
Draws a 40×40 gold square with top-left at (50, 70).

## Common bugs

- Forgetting `pygame.display.flip()` → window is blank
- No event loop → window freezes and won't close
- `pygame.QUIT` event not handled → can't close the window
- Running inside app playground → use Open in Terminal for pygame
""",
        "teacherScript": "Run the starter together. Celebrate the window appearing! Ask: what is clock.tick(30) for? (limits to 30 FPS so the loop doesn't go faster than needed). Change the rect color live to show RGB.",
        "practiceSteps": [
            "Install pygame: pip3 install pygame in Terminal first.",
            "Run the starter via Open in Terminal — does a window appear with a red square?",
            "Complete the YOUR TURN: add the screen = pygame.display.set_mode(...) line.",
            "Change the rect color to gold (255, 215, 0) and position it to (100, 100).",
            "Add a second rect in a different color — draw both on screen.",
        ],
        "starterCode": """
# pygame window — run with Open in Terminal
# pip3 install pygame  (run once in Terminal first)
import pygame
pygame.init()

# YOUR TURN: screen = pygame.display.set_mode((400, 300))
screen = pygame.display.set_mode((400, 300))
pygame.display.set_caption("Soha's Game")
clock = pygame.time.Clock()

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((30, 30, 80))   # dark background
    pygame.draw.rect(screen, (255, 100, 100), (50, 70, 40, 40))
    # YOUR TURN: add a second rectangle in gold (255, 215, 0)

    pygame.display.flip()
    clock.tick(30)

pygame.quit()
""",
        "codeTests": [
            ("w7-l2-pygame", "Imports and inits pygame", 'assert "import pygame" in user_code and "pygame.init()" in user_code', True),
            ("w7-l2-loop", "Has game loop and event handling", 'assert "while" in user_code and "pygame.QUIT" in user_code', True),
        ],
    },

    "w7-l3": {
        "body": """
**Game 4: Treasure Hunt (text)**

Navigate a grid by typing N/S/E/W until you find the treasure.
This is the same coordinate logic from w7-l1, now in a real game loop.

## Game state

```
player_x, player_y = 0, 0
treasure_x, treasure_y = 2, 2
size = 3
```

## Movement rules

| Command | Changes |
|---------|---------|
| `n` | `player_y -= 1` (up on screen) |
| `s` | `player_y += 1` (down) |
| `e` | `player_x += 1` (right) |
| `w` | `player_x -= 1` (left) |

Always **check the boundary** before moving.

## Full game structure

```
while (player_x, player_y) != (treasure_x, treasure_y):
    move = input("Move? ").lower()
    if move == "n" and player_y > 0:
        player_y -= 1
    elif move == "s" and player_y < size - 1:
        player_y += 1
    elif move == "e" and player_x < size - 1:
        player_x += 1
    elif move == "w" and player_x > 0:
        player_x -= 1
    else:
        print("Can't go that way!")
    print(f"Position: ({player_x}, {player_y})")

print("You found the treasure!")
```

## Trace — path from (0,0) to (2,2): e, s, e, s

| Move | player_x | player_y | at treasure? |
|------|----------|----------|-------------|
| start | 0 | 0 | No |
| e | 1 | 0 | No |
| s | 1 | 1 | No |
| e | 2 | 1 | No |
| s | 2 | 2 | Yes → win! |

## Stretch goals

- Add one trap cell `(1, 1)` that sends the player back to `(0, 0)`
- Track number of moves and print at the end
- Display the grid after each move with P and T marked

## Common bugs

- `player_y > 0` — not `>= 0` — you need room to move, not already at the edge
- `player_y < size - 1` — not `< size` — grid is 0 to size-1
""",
        "teacherScript": "Draw the 3x3 grid on paper, place P at (0,0) and T at (2,2). Move P step by step with N/S/E/W — practice on paper before coding. Ask: what does 'and player_y > 0' prevent? (Going above row 0).",
        "practiceSteps": [
            "Read Learn — trace the path e,s,e,s on the grid table. Does it reach (2,2)?",
            "Run the starter (from Games tab) — play a game from (0,0) to (2,2).",
            "Add a move counter — print 'Moves: N' after the game ends.",
            "Add a trap at (1,1): if player_x == 1 and player_y == 1, reset to (0,0).",
            "Stretch: print the grid after each move with 'P' and 'T' marked.",
        ],
        "starterCode": """
# Treasure Hunt — text grid game
player_x, player_y = 0, 0
treasure_x, treasure_y = 2, 2
size  = 3
moves = 0

print("Find the treasure! Commands: n s e w")

while (player_x, player_y) != (treasure_x, treasure_y):
    move = input("Move? ").lower()
    if move == "n" and player_y > 0:
        player_y -= 1
    elif move == "s" and player_y < size - 1:
        player_y += 1
    elif move == "e" and player_x < size - 1:
        player_x += 1
    elif move == "w" and player_x > 0:
        player_x -= 1
    else:
        print("Can't go that way!")
    moves += 1
    print(f"Position: ({player_x}, {player_y})")

# YOUR TURN: print a win message with moves count
print("You found the treasure!")
print("Moves taken:", moves)
""",
        "codeTests": [
            ("w7-l3-coords", "Tracks player and treasure coords", 'assert ("player_x" in user_code or "player" in user_code) and "treasure" in user_code', True),
            ("w7-l3-while", "Uses while loop for game", 'assert "while" in user_code', True),
        ],
    },

    "w7-l4": {
        "body": """
**matplotlib** turns lists of numbers into visual charts.

## Install once

```
pip3 install matplotlib
```

## Basic line plot

```
import matplotlib.pyplot as plt

scores = [70, 85, 90, 88, 92]
days   = [1, 2, 3, 4, 5]

plt.plot(days, scores, marker="o")
plt.title("My Quiz Scores")
plt.xlabel("Day")
plt.ylabel("Score")
plt.ylim(0, 100)
plt.show()
```

`plt.show()` opens a window — run in Terminal or Open in Terminal.

## Chart types

| Function | Chart |
|----------|-------|
| `plt.plot(x, y)` | Line chart |
| `plt.bar(x, y)` | Bar chart |
| `plt.scatter(x, y)` | Scatter plot |

## Science Bowl score tracker

```
sessions = ["W1", "W2", "W3", "W4", "W5"]
scores   = [72,   80,   85,   88,   93]

plt.plot(sessions, scores, marker="o", color="green", linewidth=2)
plt.title("Soha — Science Bowl Practice")
plt.ylabel("Score (%)")
plt.ylim(50, 100)
plt.show()
```

## Markers

| Marker | Shape |
|--------|-------|
| `"o"` | Circle |
| `"s"` | Square |
| `"^"` | Triangle |
| `"*"` | Star |

## Common bugs

- `plt.show()` inside app playground → no visible output; run in Terminal
- Lists of different lengths for x and y → `ValueError`
- Forgetting `plt.show()` → chart is prepared but never displayed
- `plt.plot(scores)` without `days` → x-axis is 0,1,2,... automatically (ok for quick preview)
""",
        "teacherScript": "Connect to Science Bowl: plot Soha's real practice quiz scores from past weeks. Ask: what story does the graph tell? (improving over time). Show how changing ylim(0,100) vs ylim(50,100) affects how dramatic the improvement looks.",
        "practiceSteps": [
            "Install matplotlib: pip3 install matplotlib in Terminal.",
            "Run the starter in Terminal (Open in Terminal) — does a chart window appear?",
            "Complete the YOUR TURN: plt.plot(days, scores, marker='o').",
            "Change the data to your own quiz scores (make up 5 sessions) and replot.",
            "Try plt.bar() instead of plt.plot() — what does the chart look like now?",
        ],
        "starterCode": """
# Plotting with matplotlib — run with Open in Terminal
# pip3 install matplotlib
import matplotlib.pyplot as plt

scores = [70, 85, 90, 88, 92]
days   = [1, 2, 3, 4, 5]

# YOUR TURN: plt.plot(days, scores, marker="o")
plt.plot(days, scores, marker="o", color="royalblue", linewidth=2)

plt.title("My Quiz Scores")
plt.xlabel("Day")
plt.ylabel("Score")
plt.ylim(0, 100)

# Add a horizontal line at 90 (A grade)
plt.axhline(y=90, color="green", linestyle="--", label="A grade")
plt.legend()

plt.show()

# Try bar chart:
# plt.bar(days, scores, color="teal")
# plt.show()
""",
        "codeTests": [
            ("w7-l4-matplotlib", "Imports matplotlib.pyplot", 'assert "matplotlib" in user_code and "import" in user_code', True),
            ("w7-l4-plot", "Calls plt.plot or plt.bar", 'assert "plt.plot" in user_code or "plt.bar" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 8 — Final Challenge (Coin Collector)
    # ──────────────────────────────────────────────

    "w8-l1": {
        "body": """
**Before you write one line of code — plan.**

Five minutes of planning saves an hour of debugging.
Game projects have multiple moving parts; sketch them out first.

## Your Coin Collector plan

Three things must work together:

| Requirement | Details |
|-------------|---------|
| **3 coins** | Fixed positions, collected on contact |
| **Timer** | 30-second countdown; Game Over if it hits zero |
| **Sound** | Play a sound when each coin is collected |

## Planning template

**Game state — what does the program need to remember?**
- Player position (x, y)
- List of coin positions
- Score (coins collected)
- Time remaining
- Running flag (True/False)

**Each frame the game must:**
1. Check for QUIT event
2. Read arrow-key input → move player
3. Check coin collisions → remove coin, score += 1, play sound
4. Subtract time from timer
5. Draw background, player, coins, score, timer
6. Flip display

**Win/lose conditions:**
- Win: score == 3 (all coins collected)
- Lose: time_left <= 0

## Sketch on paper

Draw a 400×300 rectangle. Mark:
- Player: blue square at (50, 130)
- Coin 1: gold circle at (120, 60)
- Coin 2: gold circle at (250, 140)
- Coin 3: gold circle at (180, 220)

## Common planning mistakes

- Starting with sound before movement works
- Trying to add all features at once → one bug hides another
- Not testing each piece separately
""",
        "teacherScript": "Ask Soha to close Playground and sketch on paper for 5 minutes before opening code. The plan should include: player position, coins list, timer variable, and win condition. Save the sketch — compare to finished code at the end.",
        "practiceSteps": [
            "Read Learn — list the three Final Challenge requirements from memory.",
            "Sketch the 400x300 game window on paper — mark player and 3 coin positions.",
            "Write the game state variables on paper: player, coins, score, time_left.",
            "Run the starter — read the printed plan. Add one more specific detail about YOUR game.",
            "Answer the quick check: name the three Final Challenge requirements.",
        ],
        "starterCode": """
# Game plan — describe your Coin Collector before coding
print("=== My Coin Collector Plan ===")
print()
print("Game state:")
print("  player = starting position (50, 130)")
print("  coins  = [(120,60), (250,140), (180,220)]")
print("  score  = 0")
print("  time_left = 30 seconds")
print()
print("Each frame:")
print("  1. Check QUIT event")
print("  2. Read arrow keys → move player")
print("  3. Check coin collisions → score += 1, play sound")
print("  4. Subtract time")
print("  5. Draw everything")
print()
print("Win:  score == 3")
print("Lose: time_left <= 0")
print()
# YOUR TURN: add one more specific detail about YOUR version
# print("My addition: ___")
""",
        "codeTests": [
            ("w8-l1-plan", "Describes game plan with print", 'assert user_code.count("print") >= 5', True),
        ],
    },

    "w8-l2": {
        "body": """
**Build the core loop: player movement + coin collision + score.**

Get this working **before** adding sound and timer.
One feature at a time is the professional way to build games.

## Player movement with pygame.Rect

```
player = pygame.Rect(50, 130, 30, 30)   # x, y, width, height

keys = pygame.key.get_pressed()
if keys[pygame.K_LEFT]:  player.x -= 4
if keys[pygame.K_RIGHT]: player.x += 4
if keys[pygame.K_UP]:    player.y -= 4
if keys[pygame.K_DOWN]:  player.y += 4
```

`pygame.Rect` knows its own position and size — perfect for collision.

## Three coins as a list of Rects

```
coins = [
    pygame.Rect(120, 60,  20, 20),
    pygame.Rect(250, 140, 20, 20),
    pygame.Rect(180, 220, 20, 20),
]
```

## Collision detection

```
for coin in coins[:]:           # copy so we can remove safely
    if player.colliderect(coin):
        coins.remove(coin)
        score += 1
```

`coins[:]` is a copy — removing from the copy doesn't skip items.

## Drawing each frame

```
screen.fill((30, 30, 50))       # dark background
pygame.draw.rect(screen, (100, 200, 255), player)    # blue player
for coin in coins:
    pygame.draw.ellipse(screen, (255, 215, 0), coin) # gold coins
label = font.render(f"Score: {score}/3", True, (255,255,255))
screen.blit(label, (10, 10))
pygame.display.flip()
clock.tick(30)
```

## Core loop trace (one frame)

| Step | Action |
|------|--------|
| Events | Check QUIT |
| Input | Arrow key → player moves 4 px |
| Collision | player overlaps coin? → remove, score++ |
| Draw | background, player, coins, score |
| Flip | show frame |
| Tick | wait for next 1/30s |

## Common bugs

- `for coin in coins:` while removing → use `coins[:]`
- Player moves off screen — add boundary clamps: `player.clamp_ip(screen.get_rect())`
- `colliderect` not `collide_rect` (no underscore in the middle)
""",
        "teacherScript": "Build in stages: (1) movement only, (2) add coins, (3) add collision. Test movement for 2 minutes before touching coins. Celebrate the first coin disappearing on contact!",
        "practiceSteps": [
            "Read Learn — trace one frame: events → input → collision → draw → flip.",
            "Run the starter (Games tab) — can you move the player with arrow keys?",
            "Watch a coin disappear when you touch it — verify score increments.",
            "Add player.clamp_ip(screen.get_rect()) to prevent moving off-screen.",
            "Test: collect all 3 coins — what happens when coins list is empty?",
        ],
        "starterCode": """
# Coin Collector — core loop (no sound or timer yet)
# pip3 install pygame  (run once in Terminal)
import pygame, sys
pygame.init()

screen = pygame.display.set_mode((400, 300))
pygame.display.set_caption("Coin Collector")
clock  = pygame.time.Clock()
font   = pygame.font.SysFont(None, 28)

player = pygame.Rect(50, 130, 30, 30)
coins  = [pygame.Rect(120,60,20,20), pygame.Rect(250,140,20,20), pygame.Rect(180,220,20,20)]
score  = 0

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Movement
    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:  player.x -= 4
    if keys[pygame.K_RIGHT]: player.x += 4
    if keys[pygame.K_UP]:    player.y -= 4
    if keys[pygame.K_DOWN]:  player.y += 4
    player.clamp_ip(screen.get_rect())   # stay inside window

    # Collision
    for coin in coins[:]:
        if player.colliderect(coin):
            coins.remove(coin)
            score += 1

    # Draw
    screen.fill((30, 30, 50))
    pygame.draw.rect(screen, (100, 200, 255), player)
    for coin in coins:
        pygame.draw.ellipse(screen, (255, 215, 0), coin)
    # YOUR TURN: render and blit the score label
    label = font.render(f"Score: {score}/3", True, (255,255,255))
    screen.blit(label, (10, 10))

    pygame.display.flip()
    clock.tick(30)

    if score == 3:
        print("All coins collected!")
        running = False

pygame.quit()
""",
        "codeTests": [
            ("w8-l2-pygame", "Uses pygame with player Rect", 'assert "pygame" in user_code and "Rect" in user_code', True),
            ("w8-l2-collision", "Uses colliderect for collision", 'assert "colliderect" in user_code', True),
        ],
    },

    "w8-l3": {
        "body": """
**Add sound, 3 coins, and a timer — then check off all three Final Challenge requirements.**

All three must work **together** in one program.

## Timer

```
time_left = 30.0

# each frame:
time_left -= 1/30   # 30 frames per second → 1 second per 30 ticks
if time_left <= 0:
    running = False
```

Display it on screen:
```
t_label = font.render(f"Time: {int(time_left)}", True, (255,255,255))
screen.blit(t_label, (280, 10))
```

## Sound

```
pygame.mixer.init()
coin_sound = pygame.mixer.Sound("coin.wav")

# inside collision:
coin_sound.play()
```

If you don't have a `.wav` file, create a simple beep:
```
import numpy as np
sample_rate = 22050
t = np.linspace(0, 0.1, int(sample_rate * 0.1))
wave = (np.sin(2 * np.pi * 880 * t) * 32767).astype(np.int16)
wave_stereo = np.column_stack([wave, wave])
sound = pygame.sndarray.make_sound(wave_stereo)
```

Or download any free `.wav` file and place it next to your script.

## Win / lose conditions

```
if score == 3:
    screen.fill((0, 100, 0))
    msg = font.render("You Win!", True, (255,255,0))
    screen.blit(msg, (150, 130))
    pygame.display.flip()
    pygame.time.wait(2000)
    running = False

if time_left <= 0:
    screen.fill((100, 0, 0))
    msg = font.render("Time's Up!", True, (255,255,255))
    screen.blit(msg, (140, 130))
    pygame.display.flip()
    pygame.time.wait(2000)
    running = False
```

## Final Challenge checklist

- [ ] Sound plays when collecting a coin
- [ ] All 3 coins are on screen at start
- [ ] Timer counts down and triggers Game Over at 0

## Common bugs

- `coin_sound.play()` before `pygame.mixer.init()` → no sound or crash
- `time_left -= 1/30` in a 60-FPS loop → timer runs twice as fast; match to `clock.tick(N)`
- Forgetting `pygame.display.flip()` after win/lose screen → blank window
""",
        "teacherScript": "Add features in order: timer first (easy), then win/lose screens, then sound last. Take a screen recording when all three work — this is the portfolio piece for Session 8. Celebrate with a high-five!",
        "practiceSteps": [
            "Add the timer to your working w8-l2 code — verify it counts down in the top-right corner.",
            "Add the win screen (green background, 'You Win!') when score == 3.",
            "Add the lose screen (red background, 'Time's Up!') when time_left <= 0.",
            "Add coin_sound.play() inside the collision block (with a .wav file or the numpy beep).",
            "Check off all three Final Boss checkboxes when everything works together.",
        ],
        "starterCode": """
# Coin Collector — FINAL VERSION with sound, 3 coins, timer
# pip3 install pygame numpy
import pygame, sys
pygame.init()
pygame.mixer.init()

screen = pygame.display.set_mode((400, 300))
pygame.display.set_caption("Coin Collector — Final")
clock  = pygame.time.Clock()
font   = pygame.font.SysFont(None, 28)

# Sound (numpy beep — no .wav file needed)
try:
    import numpy as np
    sr = 22050
    t  = (np.sin(2*np.pi*880*np.linspace(0,0.1,int(sr*0.1)))*32767).astype(np.int16)
    coin_sound = pygame.sndarray.make_sound(np.column_stack([t, t]))
except Exception:
    coin_sound = None   # silent if numpy unavailable

player    = pygame.Rect(50, 130, 30, 30)
coins     = [pygame.Rect(120,60,20,20), pygame.Rect(250,140,20,20), pygame.Rect(180,220,20,20)]
score     = 0
time_left = 30.0
running   = True

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:  player.x -= 4
    if keys[pygame.K_RIGHT]: player.x += 4
    if keys[pygame.K_UP]:    player.y -= 4
    if keys[pygame.K_DOWN]:  player.y += 4
    player.clamp_ip(screen.get_rect())

    for coin in coins[:]:
        if player.colliderect(coin):
            coins.remove(coin)
            score += 1
            if coin_sound:
                coin_sound.play()   # ← YOUR TURN: plays when coin collected

    time_left -= 1/30

    screen.fill((30, 30, 50))
    pygame.draw.rect(screen, (100, 200, 255), player)
    for coin in coins:
        pygame.draw.ellipse(screen, (255, 215, 0), coin)
    screen.blit(font.render(f"Coins: {score}/3", True, (255,255,255)), (10, 10))
    screen.blit(font.render(f"Time: {int(time_left)}", True, (255,200,100)), (280, 10))
    pygame.display.flip()
    clock.tick(30)

    if score == 3:
        screen.fill((0, 100, 0))
        screen.blit(font.render("You Win!", True, (255,255,0)), (150, 130))
        pygame.display.flip()
        pygame.time.wait(2000)
        running = False

    if time_left <= 0:
        screen.fill((100, 0, 0))
        screen.blit(font.render("Time's Up!", True, (255,255,255)), (140, 130))
        pygame.display.flip()
        pygame.time.wait(2000)
        running = False

pygame.quit()
""",
        "codeTests": [
            ("w8-l3-full", "Has pygame, 3 coins, timer, and collision", 'assert "pygame" in user_code and "time_left" in user_code and user_code.count("Rect") >= 3', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 9 — Web Development (Flask)
    # ──────────────────────────────────────────────

    "w9-l1": {
        "body": """
Every website you visit is powered by a **web server** — a program that listens for browser requests and sends back HTML pages.

**Flask** lets you build that server in Python, running on your own Mac.

## How it works

```
Browser → HTTP request → Flask (Python) → HTML response → Browser displays page
```

1. You run `python3 app.py` in Terminal
2. Flask starts a server on port 5000
3. You open `http://127.0.0.1:5000` in Safari
4. Flask sends back HTML; Safari renders it

## Install Flask once

```
pip3 install flask
```

Run in Terminal. After that, just `from flask import Flask`.

## Port numbers

| URL | Where it goes |
|-----|--------------|
| `http://127.0.0.1:5000` | Your Mac, port 5000 |
| `http://localhost:5000` | Same thing |
| `https://google.com` | Google's server, port 443 |

## Compare to apps you know

| App | Where it runs |
|-----|--------------|
| Science Bowl Coach | Native Mac app |
| Your Flask Todo | Web server on your Mac |
| google.com | Server somewhere else in the world |

## HTTP basics

- **GET** — browser asks for a page (clicking a link)
- **POST** — browser submits a form (adding a task)

## Common bugs

- Running Flask with the in-app Run button → won't start; use Terminal
- Port already in use → restart Terminal or use `debug=False` then re-run
- Forgetting `if __name__ == "__main__": app.run()` → Flask never starts
""",
        "teacherScript": "Open a browser, type 127.0.0.1:5000, and show 'connection refused' before the server is running. Then start Flask in Terminal, refresh — page appears. This makes the request/response cycle concrete. Compare to Science Bowl Coach (native app, no server needed).",
        "practiceSteps": [
            "Read Learn — draw the request/response cycle: Browser → Flask → HTML → Browser.",
            "Install Flask: pip3 install flask in Terminal.",
            "Run the starter in Playground — read the printed explanation of the cycle.",
            "Complete the YOUR TURN print line.",
            "Look up what port 5000 is used for — why 5000 and not 80?",
        ],
        "starterCode": """
# Web development — understand the request/response cycle
print("=== How Flask Web Apps Work ===")
print()
print("1. You run: python3 todo_app.py   (in Terminal)")
print("2. Flask starts a server on port 5000")
print("3. Open Safari → http://127.0.0.1:5000")
print("4. Flask sends back HTML → Safari renders it")
print()
print("Request types:")
print("  GET  — browser asks for a page (link click)")
print("  POST — browser submits a form (add task)")
print()
# YOUR TURN: print("pip3 install flask  ← run once in Terminal")
print("pip3 install flask  ← run once in Terminal")
print()
print("Native app vs web app:")
print("  Science Bowl Coach = native (no server)")
print("  Todo app = web server on YOUR Mac")
""",
        "codeTests": [
            ("w9-l1-understand", "Prints web cycle explanation", 'assert user_code.count("print") >= 5', True),
        ],
    },

    "w9-l2": {
        "body": """
**Flask routes** map URLs to Python functions.
Each `@app.route` decorator tells Flask: "when someone visits this URL, call this function."

## Minimal Flask app

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Hello from Soha!</h1><p>My first web page.</p>"

if __name__ == "__main__":
    app.run(debug=True)
```

Save as `todo_app.py` → run `python3 todo_app.py` in Terminal → open `http://127.0.0.1:5000`.

## Anatomy

| Part | Purpose |
|------|---------|
| `Flask(__name__)` | Create the app |
| `@app.route("/")` | Map URL `/` to the next function |
| `def home():` | The function that handles the request |
| `return "..."` | The HTML sent back to the browser |
| `app.run(debug=True)` | Start server; auto-reload on code changes |

## Multiple routes

```python
@app.route("/about")
def about():
    return "<h1>About Soha</h1><p>Building a web app!</p>"
```

Visit `http://127.0.0.1:5000/about` to see it.

## Returning a proper HTML page

```python
@app.route("/")
def home():
    return '''
    <html>
    <body style="font-family:sans-serif; background:#1a1a2e; color:white;">
        <h1>Soha Todo List</h1>
        <ul><li>Learn Flask</li><li>Build a web app</li></ul>
    </body>
    </html>
    '''
```

## Common bugs

- Running in-app Playground Run button → Flask won't start; use Terminal
- Visiting the URL before `app.run()` executes → "Connection refused"
- Changing the code while server runs without `debug=True` → stale page; restart server
- Missing `return` in the route function → Flask returns `None` → `TypeError`
""",
        "teacherScript": "Type the URL live in Safari while Flask is running — see the page appear. Then add an /about route live and visit it. Ask: what does @app.route('/') do? What would happen with @app.route('/secret')?",
        "practiceSteps": [
            "Read Learn — what does @app.route('/') do?",
            "Complete the YOUR TURN: add app.run(debug=True) at the bottom.",
            "Save as todo_app.py and run python3 todo_app.py in Terminal.",
            "Open Safari → 127.0.0.1:5000 — see your page!",
            "Add a second route /about that returns your name and grade as HTML.",
        ],
        "starterCode": """
# First Flask route — SAVE as todo_app.py, run in Terminal
# pip3 install flask
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return '''
    <html>
    <body style="font-family:sans-serif;background:#1a1a2e;color:white;padding:20px;">
        <h1>Hello from Soha!</h1>
        <p>My first web page.</p>
    </body>
    </html>
    '''

@app.route("/about")
def about():
    # YOUR TURN: return your own HTML here
    return "<h1>About Soha</h1><p>Learning Flask!</p>"

if __name__ == "__main__":
    # YOUR TURN: app.run(debug=True)
    app.run(debug=True)
""",
        "codeTests": [
            ("w9-l2-flask", "Imports Flask and creates app", 'assert "from flask import Flask" in user_code and "Flask(__name__)" in user_code', True),
            ("w9-l2-route", "Has at least one route", 'assert "@app.route" in user_code', True),
        ],
    },

    "w9-l3": {
        "body": """
**Extend your Todo app** with new routes and features.

After Session 9 (live2) you have a working add route.
Now add **delete**, **clear all**, and polish the HTML.

## Delete one task — route with a variable

```python
from flask import Flask, request, redirect

todos = []

@app.route("/delete/<int:index>")
def delete(index):
    if 0 <= index < len(todos):
        todos.pop(index)
    return redirect("/")
```

In the HTML, a delete link for task 0 looks like:
```html
<a href="/delete/0">Delete</a>
```

## Clear all tasks

```python
@app.route("/clear")
def clear():
    todos.clear()
    return redirect("/")
```

## Better home route with a task counter

```python
@app.route("/")
def home():
    task_items = "".join(
        f'<li>{t} <a href="/delete/{i}">✕</a></li>'
        for i, t in enumerate(todos)
    )
    return f'''
    <html><body style="font-family:sans-serif;">
    <h1>Soha Todo List ({len(todos)} tasks)</h1>
    <ul>{task_items}</ul>
    <form method="POST" action="/add">
        <input name="task" placeholder="New task">
        <button>Add</button>
    </form>
    <a href="/clear">Clear all</a>
    </body></html>
    '''
```

## Form + POST route

```python
from flask import request

@app.route("/add", methods=["POST"])
def add():
    task = request.form.get("task", "").strip()
    if task:
        todos.append(task)
    return redirect("/")
```

## Common bugs

- `todos` must be declared at the module level (not inside a function) so all routes share the same list
- `redirect("/")` returns a response — always `return` it
- URL parameter type mismatch: `/delete/<int:index>` but link sends a string → `404`
- `todos.pop(index)` when index is out of range → `IndexError`; check bounds first
""",
        "teacherScript": "Build delete first, then clear. Show the link URL in Safari's status bar so Soha sees /delete/0. Ask: what happens to indices after deleting item 0? (Everything shifts down — a good problem to discuss).",
        "practiceSteps": [
            "Read Learn — what does redirect('/') do?",
            "Add /clear route that empties todos and redirects home.",
            "Add /delete/<int:index> route with bounds checking.",
            "Add delete links next to each task in the home() HTML.",
            "Polish: add CSS to style the page (background color, font, spacing).",
        ],
        "starterCode": """
# Todo app extensions — SAVE as todo_app.py, run in Terminal
# pip3 install flask
from flask import Flask, request, redirect

app   = Flask(__name__)
todos = []   # shared list — lives at module level

@app.route("/")
def home():
    task_items = "".join(
        f'<li>{t} <a href="/delete/{i}">✕</a></li>'
        for i, t in enumerate(todos)
    )
    return f'''
    <html>
    <body style="font-family:sans-serif;background:#1a1a2e;color:white;padding:20px;">
    <h1>Soha Todo ({len(todos)} tasks)</h1>
    <ul>{task_items if task_items else "<li>No tasks yet!</li>"}</ul>
    <form method="POST" action="/add">
        <input name="task" placeholder="New task" style="padding:6px;border-radius:4px;">
        <button style="padding:6px 12px;">Add</button>
    </form>
    <br><a href="/clear" style="color:#ff6b6b;">Clear all tasks</a>
    </body></html>
    '''

@app.route("/add", methods=["POST"])
def add():
    task = request.form.get("task", "").strip()
    if task:
        todos.append(task)
    return redirect("/")

@app.route("/delete/<int:index>")
def delete(index):
    # YOUR TURN: check bounds, then todos.pop(index)
    if 0 <= index < len(todos):
        todos.pop(index)
    return redirect("/")

@app.route("/clear")
def clear():
    # YOUR TURN: todos.clear() and redirect
    todos.clear()
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)
""",
        "codeTests": [
            ("w9-l3-routes", "Has multiple Flask routes", 'assert user_code.count("@app.route") >= 3', True),
            ("w9-l3-redirect", "Uses redirect", 'assert "redirect" in user_code', True),
        ],
    },

    # ──────────────────────────────────────────────
    # WEEK 10 — Graduation & Presentations
    # ──────────────────────────────────────────────

    "w10-l1": {
        "body": """
Your Todo app works — now make it **presentation-ready**.
Good demos are polished, tested, and fail gracefully.

## Polish checklist

| Area | What to do |
|------|-----------|
| Styling | Add CSS for colors, font, spacing |
| Functionality | Test every button — add, delete, clear |
| Edge cases | Empty input, very long task names |
| Error handling | What if someone visits /delete/999? |

## Add inline CSS

```python
@app.route("/")
def home():
    return '''
    <html>
    <head>
    <style>
    body { font-family: sans-serif; background: #1a1a2e; color: white; padding: 30px; }
    h1   { color: #e94560; }
    li   { margin: 8px 0; }
    input { padding: 8px; border-radius: 6px; border: none; width: 200px; }
    button { padding: 8px 16px; background: #e94560; color: white; border: none; border-radius: 6px; cursor: pointer; }
    a    { color: #ff6b6b; text-decoration: none; margin-left: 8px; }
    </style>
    </head>
    <body>...</body>
    </html>
    '''
```

## Edge case handling

```python
@app.route("/add", methods=["POST"])
def add():
    task = request.form.get("task", "").strip()
    if not task:
        return redirect("/")        # ignore empty submissions
    if len(task) > 100:
        task = task[:100]           # cap very long tasks
    todos.append(task)
    return redirect("/")
```

## Demo rehearsal script

1. **30 sec intro**: "I built a Todo app in Python using Flask"
2. **60 sec demo**: Show the page → add 2 tasks → delete one → clear all
3. **30 sec reflection**: "One thing I learned was... One thing I'd add is..."

## Test before you demo

- Open a new browser tab in **Private/Incognito** mode — fresh state
- Test with an empty task (should do nothing)
- Test with a very long task name
- Test /delete/0 when the list is empty

## Common bugs (demo day)

- Port 5000 already in use → restart Terminal
- Forgot to run the server → "Connection refused"
- Todos list is empty because Flask restarted → data was in memory, not saved to disk
""",
        "teacherScript": "Walk through the demo script timing: 30/60/30 seconds. Ask Soha to rehearse once without looking at notes. Common issue on demo day: the server isn't running — remind her to start Terminal first. Celebrate: she built a real web app!",
        "practiceSteps": [
            "Read Learn — what are the three phases of a 2-minute demo?",
            "Add the CSS styles to your home() route — run and refresh in Safari.",
            "Test every button: add, delete, clear. Does empty-input submit anything?",
            "Add edge case handling: ignore empty tasks, cap task length at 100 chars.",
            "Rehearse your 2-minute demo once aloud — time yourself.",
        ],
        "starterCode": """
# Todo app — polish and presentation-ready
# SAVE as todo_app.py → python3 todo_app.py in Terminal
from flask import Flask, request, redirect

app   = Flask(__name__)
todos = []

CSS = '''
<style>
body   { font-family: sans-serif; background: #1a1a2e; color: white; padding: 30px; max-width: 500px; }
h1     { color: #e94560; }
li     { margin: 8px 0; font-size: 1.1em; }
input  { padding: 8px; border-radius: 6px; border: none; width: 220px; }
button { padding: 8px 16px; background: #e94560; color: white; border: none; border-radius: 6px; cursor: pointer; margin-left: 6px; }
a      { color: #ff6b6b; text-decoration: none; margin-left: 10px; font-size: 0.9em; }
.clear { display: block; margin-top: 20px; color: #888; }
</style>
'''

@app.route("/")
def home():
    items = "".join(
        f'<li>{t} <a href="/delete/{i}">✕</a></li>'
        for i, t in enumerate(todos)
    ) or "<li style='color:#888'>No tasks — add one below!</li>"
    return f'''<html><head>{CSS}</head><body>
    <h1>Soha Todo ({len(todos)} tasks)</h1>
    <ul>{items}</ul>
    <form method="POST" action="/add">
        <input name="task" placeholder="What\'s next?" maxlength="100">
        <button>Add</button>
    </form>
    <a href="/clear" class="clear">Clear all tasks</a>
    </body></html>'''

@app.route("/add", methods=["POST"])
def add():
    task = request.form.get("task", "").strip()
    # YOUR TURN: only append if task is not empty
    if task:
        todos.append(task[:100])
    return redirect("/")

@app.route("/delete/<int:index>")
def delete(index):
    if 0 <= index < len(todos):
        todos.pop(index)
    return redirect("/")

@app.route("/clear")
def clear():
    todos.clear()
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)
""",
        "codeTests": [
            ("w10-l1-css", "Has styling in the app", 'assert "style" in user_code or "CSS" in user_code', True),
            ("w10-l1-edge", "Handles empty input", 'assert "strip" in user_code or "if task" in user_code', True),
        ],
    },

    "w10-l3": {
        "body": """
**You did it. 10 weeks, 4 games, and a web app.**

This lesson is about looking back, capturing what you built, and knowing where to go next.

## Your Python Portfolio

| Project | Skills used |
|---------|------------|
| **About Me program** | print, variables, strings |
| **Pizza Shop** | input, if/else, dict, while, break |
| **Guess the Number** | random, while, int(input) |
| **Rock Paper Scissors** | for, random.choice, scoring |
| **Science Quiz** | lists, tuples, enumerate |
| **Treasure Hunt** | coordinates, grid, game loop |
| **Coin Collector** | pygame, rects, collision, sound, timer |
| **Tkinter Calendar** | GUI, buttons, labels |
| **Todo App (Flask)** | routes, POST, HTML, redirect |

## How to export and save

1. **Progress tab** → Export Progress JSON → save to Documents
2. **Screenshot each project** while running (Cmd+Shift+3)
3. **Save .py files** to a `SohaPython/` folder in Documents

## What you can build next

- **SwiftUI apps** — native iPhone and Mac apps (same Mac, different language)
- **AI tools** — prompt engineering, Hugging Face, Cursor Agent
- **More Flask** — user accounts, databases, real domains
- **Level 2 courses** — error handling, OOP, Caesar Cipher, APIs, pandas, ML

## Key concepts you now own

```python
# Variables and types
name    = "Soha"
score   = 95
point   = (3, 4)        # tuple
menu    = {"cheese": 8}  # dict
scores  = [85, 90, 92]  # list

# Control flow
if score >= 90: ...
for item in scores: ...
while True: ... break

# Functions
def greet(name, msg="Hello"):
    return f"{msg}, {name}!"

# Files, Flask, pygame — you've touched them all
```

## Reflection questions

1. What was the hardest bug you fixed?
2. Which project are you most proud of?
3. What do you want to build next?
""",
        "teacherScript": "Celebrate! Print the portfolio table and ask Soha to circle the project she is most proud of. Export progress JSON together. Take a screenshot of the Coin Collector running and the Todo app in Safari — save to a 'Soha Python Portfolio' folder.",
        "practiceSteps": [
            "Read Learn — which project used the most new skills?",
            "Run the starter — edit it to include YOUR real portfolio (your actual project names).",
            "Export progress JSON from the Progress tab.",
            "Take a screenshot of your Coin Collector and Todo app — save to Desktop.",
            "Write 3 sentences: what was hardest, what you're most proud of, what you want next.",
        ],
        "starterCode": """
# Portfolio summary — YOUR 10-week journey
print("=== Soha Python Portfolio ===")
print()
print("Projects I built:")
print("  1. About Me program   (print, variables)")
print("  2. Pizza Shop         (input, dict, while, break)")
print("  3. Guess the Number   (random, while loop)")
print("  4. Rock Paper Scissors (for, random.choice)")
print("  5. Science Quiz       (lists, tuples, enumerate)")
print("  6. Treasure Hunt      (coordinates, grid)")
print("  7. Coin Collector     (pygame, collision, sound, timer)")
print("  8. Tkinter Calendar   (GUI, buttons)")
print("  9. Todo App           (Flask, routes, HTML, POST)")
print()

# YOUR TURN: add your own line
# print("  My favorite: ___")

print("=== What's Next ===")
print("  SwiftUI apps · More Flask · AI tools · Level 2")
print()

# Reflection
reflection = [
    "Hardest bug I fixed: ___",
    "Project I'm most proud of: ___",
    "What I want to build next: ___",
]
for line in reflection:
    print(line)
""",
        "codeTests": [
            ("w10-l3-portfolio", "Lists at least 5 projects", 'assert user_code.count("print") >= 5', True),
        ],
    },

}


def generated_enrichment_for(lesson_id: str) -> dict | None:
    """Return a generated enrichment dict for the given lesson ID, or None."""
    return GENERATED_ENRICHMENTS.get(lesson_id)


if __name__ == "__main__":
    print(f"Loaded {len(GENERATED_ENRICHMENTS)} generated enrichments.")
    for lid in sorted(GENERATED_ENRICHMENTS.keys()):
        e = GENERATED_ENRICHMENTS[lid]
        body_len = len(e.get("body", ""))
        tests    = len(e.get("codeTests", []))
        steps    = len(e.get("practiceSteps", []))
        print(f"  {lid:10s}  body={body_len:4d} chars  steps={steps}  tests={tests}")
