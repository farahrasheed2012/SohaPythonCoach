#!/usr/bin/env python3
"""Hand-authored teaching content that overrides thin auto-generated lessons."""

from __future__ import annotations

from typing import Any, Optional

# lesson_id -> fields to replace in CurriculumSeed LessonStep blocks
ENRICHMENTS: dict[str, dict[str, Any]] = {
    "w2-l1": {
        "body": """
So far your programs only **talked** — `print()` sent text to the screen.

**`input()`** makes the program **listen**. It pauses and waits for the user to type something and press Enter.

```
name = input("What is your name? ")
print("Hi", name)
```

**What happens line by line**
1. Python shows the prompt: `What is your name? `
2. The cursor waits — nothing else runs until you press Enter.
3. Whatever you typed is stored in `name` (always as **text**, even if you type digits).
4. `print("Hi", name)` shows a greeting.

**Numbers from input**  
`input()` always returns a string. For math, convert first:

```
age = int(input("How old are you? "))
print("Next year:", age + 1)
```

If someone types `twelve` instead of `12`, `int()` crashes — you'll learn `try/except` later. For now, type real numbers when asked.

**Your job in Playground:** get a name, greet the user, then try one `int()` example.
""",
        "teacherScript": "Have Soha predict the output before each Run. Ask: what type is the value from input() before int()? (str)",
        "practiceSteps": [
            "Read Learn — trace what happens when Python hits input() (who waits? who types?).",
            "Run the starter. Type your real name at the prompt and press Enter.",
            "Complete the YOUR TURN line — print a greeting that uses name.",
            "Add one line: ask for age with int(input(...)) and print next year's age.",
            "Run auto-checks, then answer the quick check.",
        ],
        "starterCode": """
# Step 1 — run and type YOUR name when prompted
name = input("What is your name? ")

# Step 2 — YOUR TURN: print a greeting using name
# print("Hi", name + "!")

# Step 3 — optional: ask age as a number and print next year
# age = int(input("How old are you? "))
# print("Next year you will be", age + 1)
""",
        "codeTests": [
            ("w2-l1-input", "Uses input()", 'assert "input(" in user_code', True),
            ("w2-l1-greet", "Prints a greeting with name", 'assert "print" in user_code and "name" in user_code', True),
        ],
    },
    "w2-l2": {
        "body": """
Programs can **decide** which lines to run.

**`if`** runs a block only when the condition is **True**:

```
if score >= 90:
    print("A")
```

**`else`** runs when the if-condition was **False**:

```
if score >= 60:
    print("Pass")
else:
    print("Keep studying")
```

**`elif`** = "else if" — check another condition when the first one failed:

```
if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    print("Keep going")
```

Only **one** branch runs — the first condition that is True.

**Important: `==` vs `=`**  
- `=` **assigns** a value: `score = 85`  
- `==` **compares** two values: `score == 90` → True or False  

Using `if score = 90:` is a syntax error — Python expects a True/False question after `if`.

**Paper trace before you code**  
Try `score = 85` — which line prints? (B)  
Try `score = 92` — which line prints? (A)
""",
        "teacherScript": "Trace score=85 and score=92 on paper before Run. Common mistake: using = instead of == in conditions.",
        "practiceSteps": [
            "Read Learn — trace score=85 on paper: which branch runs?",
            "Run the starter. Enter 85 at the prompt — does output match your prediction?",
            "Run again with 92 — predict first, then check.",
            "Complete the YOUR TURN else branch for scores below 80.",
            "Run auto-checks, then answer the quick check.",
        ],
        "starterCode": """
# Paper trace first: if score is 85, what prints?
score = int(input("Quiz score (0-100): "))

if score >= 90:
    print("A — amazing!")
elif score >= 80:
    print("B — great job!")
else:
    # YOUR TURN: print an encouraging message for scores under 80
    pass
""",
        "codeTests": [
            ("w2-l2-if", "Uses if and elif", 'assert "if " in user_code and "elif" in user_code', True),
            ("w2-l2-else", "Has an else branch", 'assert "else:" in user_code', True),
        ],
    },
    "w2-l3": {
        "body": """
**Mini project: Password Gate**

Real apps check **who you are** before showing private info. Same pattern as a quiz grade check — but with text instead of numbers.

```
password = input("Enter password: ")
if password == "python":
    print("Access granted!")
else:
    print("Wrong password.")
```

**Why `==` here?**  
You are not storing a new password — you are asking: "Does what they typed **equal** the secret?"

**Trace two runs**
| User types | Condition | Output |
|------------|-----------|--------|
| python | True | Access granted! |
| pizza | False | Wrong password |

**Level up**  
Add a message when the input is empty (`password == ""`) — "Please type something."

This is the same idea as the Pizza Shop capstone later: keep asking until the user is done.
""",
        "teacherScript": "Let Soha pick her own secret word (not python) after the first working version. Discuss: why never print the real password in code comments.",
        "tryItPrompt": "Add a message when password is empty (\"\").",
        "practiceSteps": [
            "Read Learn — fill in the trace table for python vs pizza.",
            "Run the starter. Type python — predict output, then check.",
            "Run again with a wrong password.",
            "Complete the YOUR TURN else line.",
            "Bonus: add elif password == \"\" with a helpful message.",
        ],
        "starterCode": """
# Mini project — Password Gate
password = input("Enter password: ")

if password == "python":
    print("Access granted!")
    print("Secret message: Welcome to the club!")
else:
    # YOUR TURN: print "Wrong password."
    pass

# Bonus (optional):
# elif password == "":
#     print("Please type something.")
""",
        "codeTests": [
            ("w2-l3-if", "Checks password with if", 'assert "if password" in user_code or "if " in user_code', True),
            ("w2-l3-else", "Handles wrong password", 'assert "else:" in user_code', True),
        ],
    },
    "w2-l4": {
        "body": """
The Pizza Shop capstone needs two data types:

**List** — an ordered collection (your order slip):

```
order = []
order.append("cheese")
order.append("pepperoni")
print(order)          # ["cheese", "pepperoni"]
print(order[0])       # first item — index 0
```

**Dictionary** — label → value (the menu with prices):

```
menu = {"cheese": 8, "pepperoni": 10}
print(menu["cheese"])   # 8
```

**Putting them together**  
`order[0]` is the pizza name → look up price with `menu[order[0]]`.

```
total = menu[order[0]] + menu[order[1]]
```

**`.append(x)`** adds one item to the end of a list.  
**`key in dict`** checks if a pizza is on the menu — you'll use this in the capstone loop.

Try adding `"veggie": 9` to the menu, append it to order, print the price.
""",
        "teacherScript": "Draw the menu dict and order list on paper before coding. Ask: why is a dict better than two separate variables for prices?",
        "tryItPrompt": "Add veggie pizza for $9 and append it to order.",
        "practiceSteps": [
            "Read Learn — on paper, write menu dict with 3 pizzas and an empty order list.",
            "Run the starter — predict order and price before Run.",
            "Add veggie: 9 to menu and order.append(\"veggie\").",
            "Print price of the last pizza in order using menu[...].",
            "Run auto-checks, then answer the quick check.",
        ],
        "starterCode": """
# Step 1 — menu (name → price) and empty order list
menu = {"cheese": 8, "pepperoni": 10}
order = []

# Step 2 — add pizzas to the order
order.append("cheese")
# YOUR TURN: order.append("pepperoni")

print("Order:", order)
print("First pizza price:", menu[order[0]])

# Step 3 — YOUR TURN: add veggie for $9, append to order, print its price
# menu["veggie"] = 9
# order.append("veggie")
# print("Veggie price:", menu[order[-1]])
""",
        "codeTests": [
            ("w2-l4-dict", "Uses a dictionary menu", 'assert "menu" in user_code and "{" in user_code', True),
            ("w2-l4-append", "Uses append on a list", 'assert "append" in user_code', True),
        ],
    },
    "w2-l5": {
        "body": """
**Session 2 prep:** the Pizza Shop keeps taking orders until the customer types **done**. That needs a loop.

## Two kinds of `while`

**1. While a condition is true** (you saw this in Week 3 too):

```
count = 0
while count < 3:
    print("Round", count + 1)
    count += 1
```

Python checks `count < 3` **before** each round. When count hits 3, the loop stops.

**2. `while True:` — loop until you say stop**

```
while True:
  ...
  if choice == "done":
      break
```

`True` is always true — so the loop would run **forever** unless something inside uses **`break`** to exit immediately.

| Keyword | What it does |
|---------|----------------|
| `while True:` | Start a loop that could run forever |
| `break` | Exit the loop **right now** |
| `continue` | Skip to the next loop round (optional) |

## Menu loop pattern (Pizza Shop uses this)

```
while True:
    choice = input("Pick a pizza or done: ")
    if choice == "done":
        break
    print("You picked:", choice)
print("Order finished!")
```

**Trace on paper** — inputs: `cheese`, `pepperoni`, `done`

| Round | choice | What happens |
|-------|--------|--------------|
| 1 | cheese | print "You picked: cheese", loop again |
| 2 | pepperoni | print "You picked: pepperoni", loop again |
| 3 | done | `break` — skip to "Order finished!" |

**Common bugs**
- Forgetting `break` → infinite loop (program never ends)
- Checking `if choice = "done"` — use `==` not `=`
- `break` outside the `if` — would exit on first round

Work through **Step 1** (counter loop review), then **Step 2** (`while True` + `break`) in Playground before the Session capstone.
""",
        "teacherScript": "Trace cheese → pepperoni → done on paper before coding. Connect directly to live2 Pizza Shop: same loop, plus menu dict and order list from w2-l4.",
        "practiceSteps": [
            "Read Learn — complete the trace table for cheese, pepperoni, done.",
            "Run Step 1 only — predict 3 rounds, then Run and check.",
            "Run Step 2 — type hi, then pizza, then done. Watch break stop the loop.",
            "Change the prompt to say Pick a pizza or done (like the real capstone).",
            "Run auto-checks — your code must use while True and break.",
        ],
        "starterCode": """
# Step 1 — while with a counter (review)
count = 0
while count < 3:
    print("Round", count + 1)
    count += 1
print("Counter loop finished")

# Step 2 — while True + break (menu pattern preview)
print()
print("--- Menu loop demo (type done to exit) ---")
while True:
    choice = input("Pick hi, pizza, or done: ")
    if choice == "done":
        break
    print("You picked:", choice)

print("Order finished! break exited the loop.")
""",
        "codeTests": [
            ("w2-l5-while-true", "Uses while True", 'assert "while True" in user_code', True),
            ("w2-l5-break", "Uses break to exit loop", 'assert "break" in user_code', True),
        ],
    },
}


# Weeks 1, 3–10 (hand-authored w2 + generated remainder)
try:
    from generated_enrichments_w1_w10 import GENERATED_ENRICHMENTS
except ImportError:
    GENERATED_ENRICHMENTS = {}

# Hand-crafted w2 overrides generated if keys ever overlap
ALL_ENRICHMENTS: dict[str, dict[str, Any]] = {**GENERATED_ENRICHMENTS, **ENRICHMENTS}

# Already fully authored in CurriculumSeed — do not auto-replace
SKIP_ENRICHMENT_IDS = frozenset({"w3-l4"})


def enrichment_for(lesson_id: str) -> Optional[dict[str, Any]]:
    if lesson_id in SKIP_ENRICHMENT_IDS:
        return None
    return ALL_ENRICHMENTS.get(lesson_id)
