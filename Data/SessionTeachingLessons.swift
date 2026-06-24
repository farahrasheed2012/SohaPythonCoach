import Foundation

/// Auto-generated teach-before-session lessons for weeks 11–50.
/// Regenerate: python3 Scripts/generate_session_teaching.py
enum SessionTeachingLessons {
    static let week11: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w11-l1",
                title: "if / elif / else refresher",
                body: """
**Today's focus:** if / elif / else refresher

### The idea

Decisions pick different code paths.

```
if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    print("Keep going")
```

Only **one** branch runs.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions.


### Paper trace (do this first)

Pick two test values (one True branch, one False). Write what prints for each **before** you Run.


### Common mistakes

- Using `=` instead of `==` inside conditions


### Session prep
Finish this lesson before starting the Week 11 capstone project.


### Check your understanding
Quick check: *Which keyword adds another test after if?* — think before peeking at hints.


### Coach note
Trace score=85 on paper before Run.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Trace score=85 on paper before Run.",
                practiceSteps: [
                    "Read **Learn** for \"if / elif / else refresher\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 11 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# if / elif / else refresher — work through each step below
score = 85
if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    # YOUR TURN: print("C")
""",
                challengeQuestion: "Which keyword adds another test after if?",
                challengeAnswer: "elif",
                                codeTests: [
                    CodeTest(
                        id: "w11-l1-uses-if",
                        label: "Uses if",
                        assertionScript: """
                        assert "if " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w11-l1-uses-elif",
                        label: "Uses elif",
                        assertionScript: """
                        assert "elif " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w11-l2",
                title: "Functions refresher",
                body: """
**Today's focus:** Functions refresher

### The idea

`def` names a reusable block. `return` sends a value back.

```
def double(n):
    return n * 2

print(double(5))
```


### Why it matters

Functions keep code organized — write once, call many times.


### Paper trace (do this first)

Pick sample arguments. Trace into the function and write the return value.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 11 capstone project.


### Check your understanding
Quick check: *What keyword starts a function?* — think before peeking at hints.


### Coach note
Change double to triple.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Change double to triple.",
                practiceSteps: [
                    "Read **Learn** for \"Functions refresher\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 11 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Functions refresher — work through each step below
def greet(name):
    # YOUR TURN: print("Hello,", name)

greet("Soha")
""",
                challengeQuestion: "What keyword starts a function?",
                challengeAnswer: "def",
                                codeTests: [
                    CodeTest(
                        id: "w11-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w11-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w11-l3",
                title: "Loops refresher",
                body: """
**Today's focus:** Loops refresher

### The idea

`for item in collection:` visits each item.

`while condition:` repeats until the condition is False.


### Why it matters

Loops power menus, games, and anything that repeats.


### Example to study
```
for n in range(1, 4):
    print(n)
```


### Paper trace (do this first)

How many times will the loop run? Write each expected output line on paper.


### Common mistakes

- Infinite loop — forgetting to update the counter or add `break`
- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 11 capstone project.


### Check your understanding
Quick check: *How many times does range(1, 4) run?* — think before peeking at hints.


### Coach note
Write a loop that prints 1,2,3.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Write a loop that prints 1,2,3.",
                practiceSteps: [
                    "Read **Learn** for \"Loops refresher\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 11 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Loops refresher — work through each step below
for n in range(1, 4):
    # YOUR TURN: print(n)
""",
                challengeQuestion: "How many times does range(1, 4) run?",
                challengeAnswer: "3",
                                codeTests: [
                    CodeTest(
                        id: "w11-l3-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w11-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week12: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w12-l1",
                title: "When programs crash",
                body: """
**Today's focus:** When programs crash

### The idea

A **traceback** shows where Python stopped. Read from the bottom line up.


### Why it matters

Handling errors keeps programs friendly when something goes wrong.


### Example to study
```
print("Before")
# int("not a number")  # uncomment to see traceback
print("After")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 12 capstone project.


### Coach note
Run broken code on purpose: `int("abc")`.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Run broken code on purpose: `int(\"abc\")`.",
                practiceSteps: [
                    "Read **Learn** for \"When programs crash\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 12 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# When programs crash — work through each step below
print("Before")
# int("not a number")  # uncomment to see traceback
# YOUR TURN: print("After")
""",
                                codeTests: [
                    CodeTest(
                        id: "w12-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w12-l2",
                title: "try / except / finally",
                body: """
**Today's focus:** try / except / finally

### The idea

`try:` runs risky code.
`except:` handles a specific error.
`finally:` always runs at the end.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions. Handling errors keeps programs friendly when something goes wrong.


### Example to study
```
try:
    x = int("42")
    print(x + 1)
except ValueError:
    print("Not a number!")
finally:
    print("Done.")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Using `=` instead of `==` inside conditions


### Session prep
Finish this lesson before starting the Week 12 capstone project.


### Check your understanding
Quick check: *Which keyword handles errors?* — think before peeking at hints.


### Coach note
Wrap int(input()) in try/except.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Wrap int(input()) in try/except.",
                practiceSteps: [
                    "Read **Learn** for \"try / except / finally\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 12 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# try / except / finally — work through each step below
try:
    x = int("42")
    print(x + 1)
except ValueError:
    print("Not a number!")
finally:
    # YOUR TURN: print("Done.")
""",
                challengeQuestion: "Which keyword handles errors?",
                challengeAnswer: "except",
                                codeTests: [
                    CodeTest(
                        id: "w12-l2-uses-try-except",
                        label: "Uses try/except",
                        assertionScript: """
                        assert "try:" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w12-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w12-l3",
                title: "Caesar cipher on paper",
                body: """
**Today's focus:** Caesar cipher on paper

### The idea

Shift each letter forward in the alphabet. A→D with shift 3.

HELLO + 3 → KHOOR


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions.


### Example to study
```
def shift_letter(ch, n):
    if not ch.isalpha():
        return ch
    base = ord("A") if ch.isupper() else ord("a")
    return chr((ord(ch) - base + n) % 26 + base)

print(shift_letter("A", 3))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Using `=` instead of `==` inside conditions
- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 12 capstone project.


### Check your understanding
Quick check: *What does % 26 do in a cipher?* — think before peeking at hints.


### Coach note
Encode SOHA with shift 3 on paper first.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Encode SOHA with shift 3 on paper first.",
                practiceSteps: [
                    "Read **Learn** for \"Caesar cipher on paper\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 12 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Caesar cipher on paper — work through each step below
def shift_letter(ch, n):
    if not ch.isalpha():
        return ch
    base = ord("A") if ch.isupper() else ord("a")
    return chr((ord(ch) - base + n) % 26 + base)

# YOUR TURN: print(shift_letter("A", 3))
""",
                challengeQuestion: "What does % 26 do in a cipher?",
                challengeAnswer: "wrap",
                                codeTests: [
                    CodeTest(
                        id: "w12-l3-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w12-l3-uses-if",
                        label: "Uses if",
                        assertionScript: """
                        assert "if " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week13: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w13-l1",
                title: "Classes & objects",
                body: """
**Today's focus:** Classes & objects

### The idea

A **class** is a blueprint. An **object** is one instance.

`class Dog:` … `buddy = Dog()`


### Why it matters

Classes model real things: players, cards, weather data.


### Example to study
```
class Dog:
    def __init__(self, name):
        self.name = name
    def speak(self):
        print(self.name, "says woof!")

d = Dog("Buddy")
d.speak()
```


### Paper trace (do this first)

Draw a box labeled with the class name. List each attribute and method inside.


### Common mistakes

- Forgetting `self.` when accessing attributes inside methods


### Session prep
Finish this lesson before starting the Week 13 capstone project.


### Check your understanding
Quick check: *What creates an object from a class?* — think before peeking at hints.


### Coach note
Draw: Student has name, grade.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Draw: Student has name, grade.",
                practiceSteps: [
                    "Read **Learn** for \"Classes & objects\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 13 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Classes & objects — work through each step below
class Dog:
    def __init__(self, name):
        self.name = name
    def speak(self):
        print(self.name, "says woof!")

# YOUR TURN: d = Dog("Buddy")
d.speak()
""",
                challengeQuestion: "What creates an object from a class?",
                challengeAnswer: "class",
                                codeTests: [
                    CodeTest(
                        id: "w13-l1-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w13-l1-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w13-l2",
                title: "__init__ and self",
                body: """
**Today's focus:** __init__ and self

### The idea

`__init__` runs when the object is created.
`self` refers to **this** object.


### Why it matters

Classes model real things: players, cards, weather data.


### Example to study
```
class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

s = Student("Soha", 7)
print(s.name, s.grade)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 13 capstone project.


### Check your understanding
Quick check: *What method runs on creation?* — think before peeking at hints.


### Coach note
Add a grade attribute.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Add a grade attribute.",
                practiceSteps: [
                    "Read **Learn** for \"__init__ and self\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 13 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# __init__ and self — work through each step below
class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

s = Student("Soha", 7)
# YOUR TURN: print(s.name, s.grade)
""",
                challengeQuestion: "What method runs on creation?",
                challengeAnswer: "__init__",
                                codeTests: [
                    CodeTest(
                        id: "w13-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w13-l2-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w13-l3",
                title: "Lists inside objects",
                body: """
**Today's focus:** Lists inside objects

### The idea

Objects can hold lists: courses, scores, inventory.


### Why it matters

Classes model real things: players, cards, weather data. Lists store collections: questions, scores, inventory items.


### Example to study
```
class Student:
    def __init__(self, name):
        self.name = name
        self.courses = []
    def enroll(self, course):
        self.courses.append(course)

s = Student("Soha")
s.enroll("Python")
print(s.courses)
```


### Paper trace (do this first)

Draw a box labeled with the class name. List each attribute and method inside.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 13 capstone project.


### Coach note
Add enroll() that appends to a list.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Add enroll() that appends to a list.",
                practiceSteps: [
                    "Read **Learn** for \"Lists inside objects\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 13 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Lists inside objects — work through each step below
class Student:
    def __init__(self, name):
        self.name = name
        self.courses = []
    def enroll(self, course):
        self.courses.append(course)

s = Student("Soha")
s.enroll("Python")
# YOUR TURN: print(s.courses)
""",
                                codeTests: [
                    CodeTest(
                        id: "w13-l3-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w13-l3-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week14: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w14-l1",
                title: "What is an API?",
                body: """
**Today's focus:** What is an API?

### The idea

An **API** lets programs request data over the internet. Many return **JSON** text.


### Why it matters

Functions keep code organized — write once, call many times. Dictionaries map names to values — menus, settings, JSON data. APIs connect your program to live data on the internet.


### Example to study
```
import json
data = {"city": "Houston", "temp": 72}
print(json.dumps(data, indent=2))
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 14 capstone project.


### Check your understanding
Quick check: *What format do APIs often use?* — think before peeking at hints.


### Coach note
Open a JSON example in browser with parent.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Open a JSON example in browser with parent.",
                practiceSteps: [
                    "Read **Learn** for \"What is an API?\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 14 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# What is an API? — work through each step below
import json
data = {"city": "Houston", "temp": 72}
# YOUR TURN: print(json.dumps(data, indent=2))
""",
                challengeQuestion: "What format do APIs often use?",
                challengeAnswer: "JSON",
                                codeTests: [
                    CodeTest(
                        id: "w14-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w14-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w14-l2",
                title: "Tkinter window basics",
                body: """
**Today's focus:** Tkinter window basics

### The idea

`tk.Tk()` opens a window.
`Label` shows text.
`Button` runs a function when clicked.


### Why it matters

Functions keep code organized — write once, call many times. GUIs let anyone use your program without reading code.


### Example to study
```
import tkinter as tk
root = tk.Tk()
root.title("Hello GUI")
tk.Label(root, text="Hi Soha!").pack()
tk.Button(root, text="Click me", command=lambda: print("Clicked!")).pack()
root.mainloop()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting `return` when you need a value back
- Wrong mode: `"w"` overwrites; use `"a"` to append
- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 14 capstone project.


### Check your understanding
Quick check: *Which library makes GUI windows?* — think before peeking at hints.


### Coach note
Change window title to your name.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Change window title to your name.",
                practiceSteps: [
                    "Read **Learn** for \"Tkinter window basics\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 14 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Tkinter window basics — work through each step below
import tkinter as tk
root = tk.Tk()
root.title("Hello GUI")
tk.Label(root, text="Hi Soha!").pack()
# YOUR TURN: tk.Button(root, text="Click me", command=lambda: print("Clicked!")).pack()
root.mainloop()
""",
                challengeQuestion: "Which library makes GUI windows?",
                challengeAnswer: "tkinter",
                                codeTests: [
                    CodeTest(
                        id: "w14-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w14-l2-uses-tkinter",
                        label: "Uses Tkinter",
                        assertionScript: """
                        assert "tk." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w14-l3",
                title: "Plan the weather app",
                body: """
**Today's focus:** Plan the weather app

### The idea

Sketch: city entry, Get Weather button, result label.


### Why it matters

GUIs let anyone use your program without reading code. Handling errors keeps programs friendly when something goes wrong. Planning before coding saves hours of debugging.


### Example to study
```
print("Weather app plan:")
print("1. Entry for city")
print("2. Button to fetch")
print("3. Label for temp + conditions")
```


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 14 capstone project.


### Coach note
Draw the layout on paper.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Draw the layout on paper.",
                practiceSteps: [
                    "Read **Learn** for \"Plan the weather app\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 14 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Plan the weather app — work through each step below
print("Weather app plan:")
print("1. Entry for city")
print("2. Button to fetch")
# YOUR TURN: print("3. Label for temp + conditions")
""",
                                codeTests: [
                    CodeTest(
                        id: "w14-l3-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w14-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week15: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w15-l1",
                title: "requests.get",
                body: """
**Today's focus:** requests.get

### The idea

`requests.get(url)` fetches a web page or API response.
Run in Terminal after `pip3 install requests`.


### Why it matters

APIs connect your program to live data on the internet.


### Example to study
```
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/get")
print(r.status_code)
print(r.json())
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 15 capstone project.


### Check your understanding
Quick check: *What method fetches data?* — think before peeking at hints.


### Coach note
Print response.status_code.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print response.status_code.",
                practiceSteps: [
                    "Read **Learn** for \"requests.get\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 15 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# requests.get — work through each step below
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/get")
print(r.status_code)
# YOUR TURN: print(r.json())
""",
                challengeQuestion: "What method fetches data?",
                challengeAnswer: "GET",
                                codeTests: [
                    CodeTest(
                        id: "w15-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w15-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w15-l2",
                title: "Parse JSON",
                body: """
**Today's focus:** Parse JSON

### The idea

`.json()` turns response text into Python dicts and lists.


### Why it matters

Lists store collections: questions, scores, inventory items. Dictionaries map names to values — menus, settings, JSON data.


### Example to study
```
data = {"main": {"temp": 72}, "weather": [{"description": "clear"}]}
print("Temp:", data["main"]["temp"])
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 15 capstone project.


### Check your understanding
Quick check: *How do you access dict values?* — think before peeking at hints.


### Coach note
Print keys of the JSON object.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print keys of the JSON object.",
                practiceSteps: [
                    "Read **Learn** for \"Parse JSON\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 15 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Parse JSON — work through each step below
data = {"main": {"temp": 72}, "weather": [{"description": "clear"}]}
# YOUR TURN: print("Temp:", data["main"]["temp"])
""",
                challengeQuestion: "How do you access dict values?",
                challengeAnswer: "brackets",
                                codeTests: [
                    CodeTest(
                        id: "w15-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w15-l3",
                title: "Wire GUI to API",
                body: """
**Today's focus:** Wire GUI to API

### The idea

Button command calls fetch function; label shows result.


### Why it matters

Functions keep code organized — write once, call many times. GUIs let anyone use your program without reading code. APIs connect your program to live data on the internet.


### Example to study
```
print("Connect fetch_weather() to your Tkinter button.")
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- Forgetting `return` when you need a value back
- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 15 capstone project.


### Coach note
Use placeholder until API key added.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Use placeholder until API key added.",
                practiceSteps: [
                    "Read **Learn** for \"Wire GUI to API\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 15 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Wire GUI to API — work through each step below
# YOUR TURN: print("Connect fetch_weather() to your Tkinter button.")
""",
                                codeTests: [
                    CodeTest(
                        id: "w15-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week16: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w16-l1",
                title: "List comprehensions",
                body: """
**Today's focus:** List comprehensions

### The idea

Build lists in one line: `[x*2 for x in range(5)]`


### Why it matters

Loops power menus, games, and anything that repeats. Lists store collections: questions, scores, inventory items.


### Example to study
```
squares = [n*n for n in range(1, 6)]
print(squares)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 16 capstone project.


### Check your understanding
Quick check: *What keyword builds a list inline?* — think before peeking at hints.


### Coach note
Make a list of squares 1–5.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Make a list of squares 1–5.",
                practiceSteps: [
                    "Read **Learn** for \"List comprehensions\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 16 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# List comprehensions — work through each step below
squares = [n*n for n in range(1, 6)]
# YOUR TURN: print(squares)
""",
                challengeQuestion: "What keyword builds a list inline?",
                challengeAnswer: "for",
                                codeTests: [
                    CodeTest(
                        id: "w16-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w16-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w16-l2",
                title: "Pandas DataFrame",
                body: """
**Today's focus:** Pandas DataFrame

### The idea

A table with named columns. `pip3 install pandas`.


### Why it matters

Pandas handles tables — scores, weather, science data.


### Example to study
```
# pip3 install pandas
import pandas as pd
df = pd.DataFrame({"name": ["Soha"], "score": [92]})
print(df)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 16 capstone project.


### Check your understanding
Quick check: *What library uses DataFrame?* — think before peeking at hints.


### Coach note
Print average of score column.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print average of score column.",
                practiceSteps: [
                    "Read **Learn** for \"Pandas DataFrame\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 16 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Pandas DataFrame — work through each step below
# pip3 install pandas
import pandas as pd
df = pd.DataFrame({"name": ["Soha"], "score": [92]})
# YOUR TURN: print(df)
""",
                challengeQuestion: "What library uses DataFrame?",
                challengeAnswer: "pandas",
                                codeTests: [
                    CodeTest(
                        id: "w16-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w16-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w16-l3",
                title: "CSV save & load",
                body: """
**Today's focus:** CSV save & load

### The idea

`.to_csv()` and `pd.read_csv()` persist tables.


### Why it matters

Files save work between runs — notes, saves, CSV exports.


### Example to study
```
import pandas as pd
df = pd.DataFrame({"week": [1,2], "score": [80,90]})
df.to_csv("scores.csv", index=False)
print(pd.read_csv("scores.csv"))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 16 capstone project.


### Check your understanding
Quick check: *What file format stores tables?* — think before peeking at hints.


### Coach note
Save scores.csv and reload.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Save scores.csv and reload.",
                practiceSteps: [
                    "Read **Learn** for \"CSV save & load\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 16 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# CSV save & load — work through each step below
import pandas as pd
df = pd.DataFrame({"week": [1,2], "score": [80,90]})
df.to_csv("scores.csv", index=False)
# YOUR TURN: print(pd.read_csv("scores.csv"))
""",
                challengeQuestion: "What file format stores tables?",
                challengeAnswer: "CSV",
                                codeTests: [
                    CodeTest(
                        id: "w16-l3-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w16-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week17: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w17-l1",
                title: "Matplotlib first plot",
                body: """
**Today's focus:** Matplotlib first plot

### The idea

`pip3 install matplotlib`. Plot points with `plt.plot`.


### Why it matters

Graphs reveal patterns numbers alone hide.


### Example to study
```
# pip3 install matplotlib
import matplotlib.pyplot as plt
plt.plot([1,2,3], [70,85,90], marker="o")
plt.title("My Scores")
plt.show()
```


### Paper trace (do this first)

Sketch the x/y axes and where each point goes before plt.show().


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 17 capstone project.


### Check your understanding
Quick check: *Which library draws graphs?* — think before peeking at hints.


### Coach note
Change title to your name.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Change title to your name.",
                practiceSteps: [
                    "Read **Learn** for \"Matplotlib first plot\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 17 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Matplotlib first plot — work through each step below
# pip3 install matplotlib
import matplotlib.pyplot as plt
# YOUR TURN: plt.plot([1,2,3], [70,85,90], marker="o")
plt.title("My Scores")
plt.show()
""",
                challengeQuestion: "Which library draws graphs?",
                challengeAnswer: "matplotlib",
                                codeTests: [
                    CodeTest(
                        id: "w17-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w17-l1-uses-matplotlib",
                        label: "Uses matplotlib",
                        assertionScript: """
                        assert "plt." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w17-l2",
                title: "Labels and axes",
                body: """
**Today's focus:** Labels and axes

### The idea

`xlabel`, `ylabel`, `ylim` make graphs readable.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
import matplotlib.pyplot as plt
weeks = [1,2,3]
scores = [72, 88, 91]
plt.plot(weeks, scores, marker="o")
plt.xlabel("Week")
plt.ylabel("Score")
plt.ylim(0, 100)
plt.show()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 17 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Set y-axis 0–100.",
                practiceSteps: [
                    "Read **Learn** for \"Labels and axes\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 17 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Labels and axes — work through each step below
import matplotlib.pyplot as plt
weeks = [1,2,3]
scores = [72, 88, 91]
# YOUR TURN: plt.plot(weeks, scores, marker="o")
plt.xlabel("Week")
plt.ylabel("Score")
plt.ylim(0, 100)
plt.show()
""",
                                codeTests: [
                    CodeTest(
                        id: "w17-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w17-l2-uses-matplotlib",
                        label: "Uses matplotlib",
                        assertionScript: """
                        assert "plt." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w17-l3",
                title: "Data science workflow",
                body: """
**Today's focus:** Data science workflow

### The idea

Ask a question → collect data → visualize → decide.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("Question: Are my scores improving?")
print("Data: weekly quiz scores")
print("Chart: line plot")
print("Decision: keep studying weak topics")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 17 capstone project.


### Check your understanding
Quick check: *First step in data science?* — think before peeking at hints.


### Coach note
Write one question about your quiz scores.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Write one question about your quiz scores.",
                practiceSteps: [
                    "Read **Learn** for \"Data science workflow\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 17 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Data science workflow — work through each step below
print("Question: Are my scores improving?")
print("Data: weekly quiz scores")
print("Chart: line plot")
# YOUR TURN: print("Decision: keep studying weak topics")
""",
                challengeQuestion: "First step in data science?",
                challengeAnswer: "ask questions",
                                codeTests: [
                    CodeTest(
                        id: "w17-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week18: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w18-l1",
                title: "Lambda functions",
                body: """
**Today's focus:** Lambda functions

### The idea

Short one-line functions: `lambda x: x * 2`


### Why it matters

Functions keep code organized — write once, call many times.


### Example to study
```
double = lambda x: x * 2
print(double(7))
```


### Paper trace (do this first)

Pick sample arguments. Trace into the function and write the return value.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 18 capstone project.


### Check your understanding
Quick check: *What keyword makes a lambda?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Lambda that adds 10.",
                practiceSteps: [
                    "Read **Learn** for \"Lambda functions\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 18 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Lambda functions — work through each step below
double = lambda x: x * 2
# YOUR TURN: print(double(7))
""",
                challengeQuestion: "What keyword makes a lambda?",
                challengeAnswer: "lambda",
                                codeTests: [
                    CodeTest(
                        id: "w18-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w18-l2",
                title: "Default parameters",
                body: """
**Today's focus:** Default parameters

### The idea

Parameters can have defaults: `def f(name, greeting="Hi"):`


### Why it matters

Functions keep code organized — write once, call many times.


### Example to study
```
def greet(name, msg="Hello"):
    print(msg + ",", name)

greet("Soha")
greet("Soha", "Hi")
```


### Paper trace (do this first)

Pick sample arguments. Trace into the function and write the return value.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 18 capstone project.


### Coach note
Call with and without second arg.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Call with and without second arg.",
                practiceSteps: [
                    "Read **Learn** for \"Default parameters\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 18 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Default parameters — work through each step below
def greet(name, msg="Hello"):
    # YOUR TURN: print(msg + ",", name)

greet("Soha")
greet("Soha", "Hi")
""",
                                codeTests: [
                    CodeTest(
                        id: "w18-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w18-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w18-l3",
                title: "*args and **kwargs",
                body: """
**Today's focus:** *args and **kwargs

### The idea

`*args` collects extra positional args.
`**kwargs` collects keyword args.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
def demo(*args, **kwargs):
    print("args:", args)
    print("kwargs:", kwargs)

demo(1, 2, topic="Python")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 18 capstone project.


### Check your understanding
Quick check: *What collects keyword args?* — think before peeking at hints.


### Coach note
Print args and kwargs in a demo function.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print args and kwargs in a demo function.",
                practiceSteps: [
                    "Read **Learn** for \"*args and **kwargs\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 18 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# *args and **kwargs — work through each step below
def demo(*args, **kwargs):
    print("args:", args)
    print("kwargs:", kwargs)

# YOUR TURN: demo(1, 2, topic="Python")
""",
                challengeQuestion: "What collects keyword args?",
                challengeAnswer: "**kwargs",
                                codeTests: [
                    CodeTest(
                        id: "w18-l3-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w18-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week19: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w19-l1",
                title: "What is machine learning?",
                body: """
**Today's focus:** What is machine learning?

### The idea

Find patterns in data to predict labels for new examples.


### Why it matters

Loops power menus, games, and anything that repeats. Dictionaries map names to values — menus, settings, JSON data. Machine learning finds patterns in data to make predictions.


### Example to study
```
print("Features: tempo, energy")
print("Label: genre (pop/rock)")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4
- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 19 capstone project.


### Coach note
Name one feature and one label.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Name one feature and one label.",
                practiceSteps: [
                    "Read **Learn** for \"What is machine learning?\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 19 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# What is machine learning? — work through each step below
print("Features: tempo, energy")
# YOUR TURN: print("Label: genre (pop/rock)")
""",
                                codeTests: [
                    CodeTest(
                        id: "w19-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w19-l2",
                title: "scikit-learn basics",
                body: """
**Today's focus:** scikit-learn basics

### The idea

`pip3 install scikit-learn`. `model.fit(X, y)` trains.


### Why it matters

Machine learning finds patterns in data to make predictions.


### Example to study
```
# pip3 install scikit-learn
from sklearn.tree import DecisionTreeClassifier
X = [[1, 0], [0, 1]]
y = [0, 1]
m = DecisionTreeClassifier()
m.fit(X, y)
print("Trained!")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 19 capstone project.


### Check your understanding
Quick check: *What method trains the model?* — think before peeking at hints.


### Coach note
Print training data shapes.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print training data shapes.",
                practiceSteps: [
                    "Read **Learn** for \"scikit-learn basics\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 19 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# scikit-learn basics — work through each step below
# pip3 install scikit-learn
from sklearn.tree import DecisionTreeClassifier
X = [[1, 0], [0, 1]]
y = [0, 1]
m = DecisionTreeClassifier()
m.fit(X, y)
# YOUR TURN: print("Trained!")
""",
                challengeQuestion: "What method trains the model?",
                challengeAnswer: "fit",
                                codeTests: [
                    CodeTest(
                        id: "w19-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w19-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w19-l3",
                title: "Predict & demo prep",
                body: """
**Today's focus:** Predict & demo prep

### The idea

`.predict()` guesses for new data. Rehearse a 90-second demo.


### Why it matters

Loops power menus, games, and anything that repeats. Dictionaries map names to values — menus, settings, JSON data. Planning before coding saves hours of debugging.


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4
- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 19 capstone project.


### Coach note
from sklearn.tree import DecisionTreeClassifier
X = [[120, 0.8], [90, 0.5]]
y = [1, 0]
m = DecisionTreeClassifier(max_depth=2)
m.fit(X, y)
print(m.predict([[100, 0.6]]))


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "from sklearn.tree import DecisionTreeClassifier\nX = [[120, 0.8], [90, 0.5]]\ny = [1, 0]\nm = DecisionTreeClassifier(max_depth=2)\nm.fit(X, y)\nprint(m.predict([[100, 0.6]]))",
                practiceSteps: [
                    "Read **Learn** for \"Predict & demo prep\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 19 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week20: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w20-l1",
                title: "Pick your showcase project",
                body: """
**Today's focus:** Pick your showcase project

### The idea

Weather app, graph project, or music ML — choose one to demo.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("My project:")
print("Problem it solves:")
print("Coolest feature:")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 20 capstone project.


### Coach note
Write 3 sentences about your project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Write 3 sentences about your project.",
                practiceSteps: [
                    "Read **Learn** for \"Pick your showcase project\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 20 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Pick your showcase project — work through each step below
print("My project:")
print("Problem it solves:")
# YOUR TURN: print("Coolest feature:")
""",
                                codeTests: [
                    CodeTest(
                        id: "w20-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w20-l2",
                title: "Rehearse the demo",
                body: """
**Today's focus:** Rehearse the demo

### The idea

Intro (30s) → demo (60s) → lesson learned (30s).


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("Demo checklist:")
print("[ ] Opens without errors")
print("[ ] Shows main feature")
print("[ ] I explain one line of code")
```


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 20 capstone project.


### Check your understanding
Quick check: *How long is the demo?* — think before peeking at hints.


### Coach note
Practice out loud twice.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Practice out loud twice.",
                practiceSteps: [
                    "Read **Learn** for \"Rehearse the demo\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 20 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Rehearse the demo — work through each step below
print("Demo checklist:")
print("[ ] Opens without errors")
print("[ ] Shows main feature")
# YOUR TURN: print("[ ] I explain one line of code")
""",
                challengeQuestion: "How long is the demo?",
                challengeAnswer: "2 minutes",
                                codeTests: [
                    CodeTest(
                        id: "w20-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w20-l3",
                title: "Export progress",
                body: """
**Today's focus:** Export progress

### The idea

Back up JSON from Progress tab before presenting.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data.


### Example to study
```
print("Level 2 complete! Skills: OOP, APIs, pandas, ML")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4
- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 20 capstone project.


### Coach note
Progress tab → Export.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Progress tab → Export.",
                practiceSteps: [
                    "Read **Learn** for \"Export progress\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 20 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Export progress — work through each step below
# YOUR TURN: print("Level 2 complete! Skills: OOP, APIs, pandas, ML")
""",
                                codeTests: [
                    CodeTest(
                        id: "w20-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week21: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w21-l1",
                title: "Tkinter widgets",
                body: """
**Today's focus:** Tkinter widgets

### The idea

Label, Button, Text — each `.pack()` goes in the window.


### Why it matters

GUIs let anyone use your program without reading code.


### Example to study
```
import tkinter as tk
root = tk.Tk()
tk.Label(root, text="Editor").pack()
text = tk.Text(root, height=10, width=40)
text.pack()
root.mainloop()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 21 capstone project.


### Check your understanding
Quick check: *Which widget holds multiple lines?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Add a second label.",
                practiceSteps: [
                    "Read **Learn** for \"Tkinter widgets\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 21 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Tkinter widgets — work through each step below
import tkinter as tk
root = tk.Tk()
tk.Label(root, text="Editor").pack()
# YOUR TURN: text = tk.Text(root, height=10, width=40)
text.pack()
root.mainloop()
""",
                challengeQuestion: "Which widget holds multiple lines?",
                challengeAnswer: "Text",
                                codeTests: [
                    CodeTest(
                        id: "w21-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w21-l1-uses-tkinter",
                        label: "Uses Tkinter",
                        assertionScript: """
                        assert "tk." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w21-l2",
                title: "File open & save",
                body: """
**Today's focus:** File open & save

### The idea

`open(path)` reads/writes text files. Use filedialog to pick paths.


### Why it matters

Files save work between runs — notes, saves, CSV exports.


### Example to study
```
with open("hello.txt", "w") as f:
    f.write("Hello from Soha!")
with open("hello.txt") as f:
    print(f.read())
```


### Paper trace (do this first)

After Run, what should be on disk? Draw the file contents before and after.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 21 capstone project.


### Coach note
Save hello.txt from Text widget.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Save hello.txt from Text widget.",
                practiceSteps: [
                    "Read **Learn** for \"File open & save\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 21 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# File open & save — work through each step below
with open("hello.txt", "w") as f:
    f.write("Hello from Soha!")
with open("hello.txt") as f:
    # YOUR TURN: print(f.read())
""",
                                codeTests: [
                    CodeTest(
                        id: "w21-l2-uses-file-open",
                        label: "Uses file open",
                        assertionScript: """
                        assert "open(" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w21-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w21-l3",
                title: "Connect GUI to files",
                body: """
**Today's focus:** Connect GUI to files

### The idea

Save button writes Text content; Open button loads file.


### Why it matters

Files save work between runs — notes, saves, CSV exports. GUIs let anyone use your program without reading code.


### Example to study
```
print("open_file() reads into Text")
print("save_file() writes from Text")
```


### Paper trace (do this first)

After Run, what should be on disk? Draw the file contents before and after.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append
- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 21 capstone project.


### Coach note
Sketch Open/Save buttons.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Sketch Open/Save buttons.",
                practiceSteps: [
                    "Read **Learn** for \"Connect GUI to files\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 21 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Connect GUI to files — work through each step below
print("open_file() reads into Text")
# YOUR TURN: print("save_file() writes from Text")
""",
                                codeTests: [
                    CodeTest(
                        id: "w21-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week22: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w22-l1",
                title: "Game board as a list",
                body: """
**Today's focus:** Game board as a list

### The idea

9 squares → list of length 9. Index 0–8 maps to grid.


### Why it matters

Lists store collections: questions, scores, inventory items. Game loops combine input, update, and draw every frame.


### Example to study
```
board = ["X", "", "O", "", "X", "", "", "", "O"]
for i, cell in enumerate(board):
    print(i, cell)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 22 capstone project.


### Check your understanding
Quick check: *How many squares on the board?* — think before peeking at hints.


### Coach note
Print board positions.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print board positions.",
                practiceSteps: [
                    "Read **Learn** for \"Game board as a list\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 22 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Game board as a list — work through each step below
board = ["X", "", "O", "", "X", "", "", "", "O"]
for i, cell in enumerate(board):
    # YOUR TURN: print(i, cell)
""",
                challengeQuestion: "How many squares on the board?",
                challengeAnswer: "9",
                                codeTests: [
                    CodeTest(
                        id: "w22-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w22-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w22-l2",
                title: "Win detection",
                body: """
**Today's focus:** Win detection

### The idea

Check rows, columns, diagonals for three matching.


### Why it matters

Loops power menus, games, and anything that repeats.


### Example to study
```
wins = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
board = ["X"]*3 + [""]*6
print(any(board[a]==board[b]==board[c]!="" for a,b,c in wins))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 22 capstone project.


### Coach note
Test one winning line.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Test one winning line.",
                practiceSteps: [
                    "Read **Learn** for \"Win detection\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 22 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Win detection — work through each step below
wins = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
board = ["X"]*3 + [""]*6
# YOUR TURN: print(any(board[a]==board[b]==board[c]!="" for a,b,c in wins))
""",
                                codeTests: [
                    CodeTest(
                        id: "w22-l2-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w22-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w22-l3",
                title: "Tkinter button grid",
                body: """
**Today's focus:** Tkinter button grid

### The idea

`.grid(row=, column=)` places buttons in rows/columns.


### Why it matters

GUIs let anyone use your program without reading code.


### Example to study
```
import tkinter as tk
root = tk.Tk()
for i in range(9):
    tk.Button(root, text=str(i), width=4).grid(row=i//3, column=i%3)
root.mainloop()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 22 capstone project.


### Coach note
Make one button print its index.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Make one button print its index.",
                practiceSteps: [
                    "Read **Learn** for \"Tkinter button grid\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 22 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Tkinter button grid — work through each step below
import tkinter as tk
root = tk.Tk()
for i in range(9):
    # YOUR TURN: tk.Button(root, text=str(i), width=4).grid(row=i//3, column=i%3)
root.mainloop()
""",
                                codeTests: [
                    CodeTest(
                        id: "w22-l3-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w22-l3-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week23: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w23-l1",
                title: "Caesar shift review",
                body: """
**Today's focus:** Caesar shift review

### The idea

Reuse shift function from Level 2.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions. Functions keep code organized — write once, call many times.


### Example to study
```
def encrypt(text, shift):
    out = ""
    for ch in text:
        if ch.isalpha():
            b = ord("A") if ch.isupper() else ord("a")
            out += chr((ord(ch)-b+shift)%26+b)
        else:
            out += ch
    return out
print(encrypt("HI", 1))
```


### Paper trace (do this first)

Pick two test values (one True branch, one False). Write what prints for each **before** you Run.


### Common mistakes

- Using `=` instead of `==` inside conditions
- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 23 capstone project.


### Coach note
Encrypt ABC with shift 1.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Encrypt ABC with shift 1.",
                practiceSteps: [
                    "Read **Learn** for \"Caesar shift review\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 23 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Caesar shift review — work through each step below
def encrypt(text, shift):
    out = ""
    for ch in text:
        if ch.isalpha():
            b = ord("A") if ch.isupper() else ord("a")
            out += chr((ord(ch)-b+shift)%26+b)
        else:
            out += ch
    return out
# YOUR TURN: print(encrypt("HI", 1))
""",
                                codeTests: [
                    CodeTest(
                        id: "w23-l1-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w23-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w23-l2",
                title: "Entry & Label widgets",
                body: """
**Today's focus:** Entry & Label widgets

### The idea

Entry gets user text. Label shows output.


### Why it matters

Handling errors keeps programs friendly when something goes wrong.


### Example to study
```
import tkinter as tk
root = tk.Tk()
e = tk.Entry(root)
e.pack()
l = tk.Label(root, text="")
l.pack()
tk.Button(root, text="Show", command=lambda: l.config(text=e.get())).pack()
root.mainloop()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 23 capstone project.


### Coach note
Show entered text in a label.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Show entered text in a label.",
                practiceSteps: [
                    "Read **Learn** for \"Entry & Label widgets\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 23 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Entry & Label widgets — work through each step below
import tkinter as tk
root = tk.Tk()
e = tk.Entry(root)
e.pack()
l = tk.Label(root, text="")
l.pack()
# YOUR TURN: tk.Button(root, text="Show", command=lambda: l.config(text=e.get())).pack()
root.mainloop()
""",
                                codeTests: [
                    CodeTest(
                        id: "w23-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w23-l2-uses-tkinter",
                        label: "Uses Tkinter",
                        assertionScript: """
                        assert "tk." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w23-l3",
                title: "Error messages in GUI",
                body: """
**Today's focus:** Error messages in GUI

### The idea

Use try/except; show friendly text in Label.


### Why it matters

GUIs let anyone use your program without reading code. Handling errors keeps programs friendly when something goes wrong.


### Example to study
```
print("except ValueError: show Please enter a number")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 23 capstone project.


### Coach note
Handle invalid shift.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Handle invalid shift.",
                practiceSteps: [
                    "Read **Learn** for \"Error messages in GUI\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 23 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Error messages in GUI — work through each step below
# YOUR TURN: print("except ValueError: show Please enter a number")
""",
                                codeTests: [
                    CodeTest(
                        id: "w23-l3-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week24: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w24-l1",
                title: "os.listdir & paths",
                body: """
**Today's focus:** os.listdir & paths

### The idea

`os.path.join` builds safe paths. `listdir` lists folder contents.


### Why it matters

Lists store collections: questions, scores, inventory items.


### Example to study
```
import os
for name in os.listdir("."):
    print(name)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 24 capstone project.


### Coach note
List files in current folder.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "List files in current folder.",
                practiceSteps: [
                    "Read **Learn** for \"os.listdir & paths\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 24 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# os.listdir & paths — work through each step below
import os
for name in os.listdir("."):
    # YOUR TURN: print(name)
""",
                                codeTests: [
                    CodeTest(
                        id: "w24-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w24-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w24-l2",
                title: "Recursion idea",
                body: """
**Today's focus:** Recursion idea

### The idea

A function that calls itself needs a **base case** to stop.


### Why it matters

Functions keep code organized — write once, call many times.


### Example to study
```
def countdown(n):
    if n <= 0:
        print("Done!")
        return
    print(n)
    countdown(n-1)

countdown(3)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 24 capstone project.


### Check your understanding
Quick check: *What stops recursion?* — think before peeking at hints.


### Coach note
Count down recursively.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Count down recursively.",
                practiceSteps: [
                    "Read **Learn** for \"Recursion idea\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 24 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Recursion idea — work through each step below
def countdown(n):
    if n <= 0:
        print("Done!")
        return
    # YOUR TURN: print(n)
    countdown(n-1)

countdown(3)
""",
                challengeQuestion: "What stops recursion?",
                challengeAnswer: "base case",
                                codeTests: [
                    CodeTest(
                        id: "w24-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w24-l2-uses-if",
                        label: "Uses if",
                        assertionScript: """
                        assert "if " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w24-l3",
                title: "Organize by extension",
                body: """
**Today's focus:** Organize by extension

### The idea

Make subfolders per file type — on paper first.


### Why it matters

Files save work between runs — notes, saves, CSV exports.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 24 capstone project.


### Coach note
print("For each file: get extension → move to folder/")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"For each file: get extension → move to folder/\")",
                practiceSteps: [
                    "Read **Learn** for \"Organize by extension\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 24 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week25: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w25-l1",
                title: "HTTP & JSON review",
                body: """
**Today's focus:** HTTP & JSON review

### The idea

GET request → JSON response → parse in Python.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data. APIs connect your program to live data on the internet.


### Example to study
```
import json
sample = '{"temp": 72, "city": "Houston"}'
data = json.loads(sample)
print(data["city"], data["temp"])
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 25 capstone project.


### Coach note
Print one field from sample JSON.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Print one field from sample JSON.",
                practiceSteps: [
                    "Read **Learn** for \"HTTP & JSON review\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 25 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# HTTP & JSON review — work through each step below
import json
sample = '{"temp": 72, "city": "Houston"}'
data = json.loads(sample)
# YOUR TURN: print(data["city"], data["temp"])
""",
                                codeTests: [
                    CodeTest(
                        id: "w25-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w25-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w25-l2",
                title: "requests in practice",
                body: """
**Today's focus:** requests in practice

### The idea

Fetch a public API or sample endpoint.


### Why it matters

APIs connect your program to live data on the internet.


### Example to study
```
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/json")
print(r.json())
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 25 capstone project.


### Coach note
pip3 install requests


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "pip3 install requests",
                practiceSteps: [
                    "Read **Learn** for \"requests in practice\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 25 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# requests in practice — work through each step below
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/json")
# YOUR TURN: print(r.json())
""",
                                codeTests: [
                    CodeTest(
                        id: "w25-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w25-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w25-l3",
                title: "Display in app",
                body: """
**Today's focus:** Display in app

### The idea

Show fetched data in GUI or print formatted.


### Why it matters

GUIs let anyone use your program without reading code.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4
- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 25 capstone project.


### Coach note
print("Format: City: X, Temp: Y F")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Format: City: X, Temp: Y F\")",
                practiceSteps: [
                    "Read **Learn** for \"Display in app\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 25 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week26: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w26-l1",
                title: "JSON module",
                body: """
**Today's focus:** JSON module

### The idea

`json.dump` saves Python data; `json.load` reads it.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data.


### Example to study
```
import json
data = {"score": 10, "level": 2}
with open("save.json", "w") as f:
    json.dump(data, f)
with open("save.json") as f:
    print(json.load(f))
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 26 capstone project.


### Check your understanding
Quick check: *Which module handles JSON?* — think before peeking at hints.


### Coach note
Save and load a dict.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Save and load a dict.",
                practiceSteps: [
                    "Read **Learn** for \"JSON module\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 26 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# JSON module — work through each step below
import json
data = {"score": 10, "level": 2}
with open("save.json", "w") as f:
    json.dump(data, f)
with open("save.json") as f:
    # YOUR TURN: print(json.load(f))
""",
                challengeQuestion: "Which module handles JSON?",
                challengeAnswer: "json",
                                codeTests: [
                    CodeTest(
                        id: "w26-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w26-l1-uses-file-open",
                        label: "Uses file open",
                        assertionScript: """
                        assert "open(" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w26-l2",
                title: "Game state dict",
                body: """
**Today's focus:** Game state dict

### The idea

Store score, level, player position in one dict.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data. Game loops combine input, update, and draw every frame.


### Example to study
```
state = {"score": 0, "coins": 3, "x": 100, "y": 200}
print(state)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 26 capstone project.


### Coach note
Design your save dict keys.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Design your save dict keys.",
                practiceSteps: [
                    "Read **Learn** for \"Game state dict\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 26 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Game state dict — work through each step below
state = {"score": 0, "coins": 3, "x": 100, "y": 200}
# YOUR TURN: print(state)
""",
                                codeTests: [
                    CodeTest(
                        id: "w26-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w26-l3",
                title: "Load on startup",
                body: """
**Today's focus:** Load on startup

### The idea

If save file exists, load it; else start fresh.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions. Files save work between runs — notes, saves, CSV exports.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Using `=` instead of `==` inside conditions
- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 26 capstone project.


### Coach note
import os
print("if os.path.exists(save.json): load else new game")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "import os\nprint(\"if os.path.exists(save.json): load else new game\")",
                practiceSteps: [
                    "Read **Learn** for \"Load on startup\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 26 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week27: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w27-l1",
                title: "pygame loop review",
                body: """
**Today's focus:** pygame loop review

### The idea

while running: handle events → update → draw → flip.


### Why it matters

Loops power menus, games, and anything that repeats. Game loops combine input, update, and draw every frame.


### Example to study
```
print("1. events 2. update 3. draw 4. flip")
```


### Paper trace (do this first)

How many times will the loop run? Write each expected output line on paper.


### Common mistakes

- Infinite loop — forgetting to update the counter or add `break`


### Session prep
Finish this lesson before starting the Week 27 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "List the four steps.",
                practiceSteps: [
                    "Read **Learn** for \"pygame loop review\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 27 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# pygame loop review — work through each step below
# YOUR TURN: print("1. events 2. update 3. draw 4. flip")
""",
                                codeTests: [
                    CodeTest(
                        id: "w27-l1-uses-pygame",
                        label: "Uses pygame",
                        assertionScript: """
                        assert "pygame" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w27-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w27-l2",
                title: "Sprites & collision",
                body: """
**Today's focus:** Sprites & collision

### The idea

Rectangles check overlap with `.colliderect`.


### Why it matters

Game loops combine input, update, and draw every frame.


### Example to study
```
import pygame
pygame.init()
s = pygame.display.set_mode((200,100))
pygame.draw.rect(s,(255,0,0),(10,10,30,30))
pygame.draw.rect(s,(0,255,0),(35,10,30,30))
pygame.display.flip()
input("Enter")
pygame.quit()
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 27 capstone project.


### Coach note
Draw two rects in pygame.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Draw two rects in pygame.",
                practiceSteps: [
                    "Read **Learn** for \"Sprites & collision\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 27 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Sprites & collision — work through each step below
import pygame
pygame.init()
# YOUR TURN: s = pygame.display.set_mode((200,100))
pygame.draw.rect(s,(255,0,0),(10,10,30,30))
pygame.draw.rect(s,(0,255,0),(35,10,30,30))
pygame.display.flip()
input("Enter")
pygame.quit()
""",
                                codeTests: [
                    CodeTest(
                        id: "w27-l2-uses-input",
                        label: "Uses input()",
                        assertionScript: """
                        assert "input(" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w27-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w27-l3",
                title: "Polish checklist",
                body: """
**Today's focus:** Polish checklist

### The idea

Sound, score, game over screen.


### Why it matters

Lists store collections: questions, scores, inventory items. Game loops combine input, update, and draw every frame.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 27 capstone project.


### Coach note
print("Polish: sound effect on coin, score label, restart")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Polish: sound effect on coin, score label, restart\")",
                practiceSteps: [
                    "Read **Learn** for \"Polish checklist\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 27 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week28: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w28-l1",
                title: "Split into modules",
                body: """
**Today's focus:** Split into modules

### The idea

Move helpers to `utils.py` and `import utils`.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("game.py — main loop")
print("models.py — Player, Coin classes")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 28 capstone project.


### Coach note
Plan two files for your project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Plan two files for your project.",
                practiceSteps: [
                    "Read **Learn** for \"Split into modules\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 28 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Split into modules — work through each step below
print("game.py — main loop")
# YOUR TURN: print("models.py — Player, Coin classes")
""",
                                codeTests: [
                    CodeTest(
                        id: "w28-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w28-l2",
                title: "Class per game object",
                body: """
**Today's focus:** Class per game object

### The idea

Player class, Coin class — each knows how to draw/update.


### Why it matters

Classes model real things: players, cards, weather data. Game loops combine input, update, and draw every frame.


### Example to study
```
class Player:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def move(self, dx, dy):
        self.x += dx
        self.y += dy
```


### Paper trace (do this first)

Draw a box labeled with the class name. List each attribute and method inside.


### Common mistakes

- Forgetting `self.` when accessing attributes inside methods


### Session prep
Finish this lesson before starting the Week 28 capstone project.


### Coach note
Sketch Player attributes.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Sketch Player attributes.",
                practiceSteps: [
                    "Read **Learn** for \"Class per game object\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 28 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Class per game object — work through each step below
class Player:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def move(self, dx, dy):
        self.x += dx
        # YOUR TURN: self.y += dy
""",
                                codeTests: [
                    CodeTest(
                        id: "w28-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w28-l2-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w28-l3",
                title: "Refactor one feature",
                body: """
**Today's focus:** Refactor one feature

### The idea

Pick one messy function; move to a class method.


### Why it matters

Functions keep code organized — write once, call many times. Classes model real things: players, cards, weather data.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting `return` when you need a value back
- Forgetting `self.` when accessing attributes inside methods


### Session prep
Finish this lesson before starting the Week 28 capstone project.


### Coach note
print("Before: one big file. After: classes + small functions.")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Before: one big file. After: classes + small functions.\")",
                practiceSteps: [
                    "Read **Learn** for \"Refactor one feature\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 28 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week29: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w29-l1",
                title: "Capstone planning",
                body: """
**Today's focus:** Capstone planning

### The idea

MVP = smallest version that works. Extras come later.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("Milestone 1: core feature")
print("Milestone 2: save/load")
print("Milestone 3: polish UI")
```


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 29 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Write 3 milestones.",
                practiceSteps: [
                    "Read **Learn** for \"Capstone planning\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 29 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Capstone planning — work through each step below
print("Milestone 1: core feature")
print("Milestone 2: save/load")
# YOUR TURN: print("Milestone 3: polish UI")
""",
                                codeTests: [
                    CodeTest(
                        id: "w29-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w29-l2",
                title: "Design doc",
                body: """
**Today's focus:** Design doc

### The idea

One page: goal, features, file list.


### Why it matters

Lists store collections: questions, scores, inventory items. Files save work between runs — notes, saves, CSV exports.


### Example to study
```
print("Project title:")
print("Must have:")
print("Nice to have:")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 29 capstone project.


### Coach note
Bullet your features.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Bullet your features.",
                practiceSteps: [
                    "Read **Learn** for \"Design doc\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 29 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Design doc — work through each step below
print("Project title:")
print("Must have:")
# YOUR TURN: print("Nice to have:")
""",
                                codeTests: [
                    CodeTest(
                        id: "w29-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w29-l3",
                title: "Start MVP",
                body: """
**Today's focus:** Start MVP

### The idea

Get one feature running end-to-end today.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 29 capstone project.


### Coach note
print("Today: one working feature, no extras")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Today: one working feature, no extras\")",
                practiceSteps: [
                    "Read **Learn** for \"Start MVP\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 29 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week30: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w30-l1",
                title: "Demo rehearsal",
                body: """
**Today's focus:** Demo rehearsal

### The idea

2 minutes: intro, live demo, one bug you fixed.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("[ ] Demo rehearsed")
print("[ ] Backup screen recording")
```


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 30 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Practice twice.",
                practiceSteps: [
                    "Read **Learn** for \"Demo rehearsal\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 30 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Demo rehearsal — work through each step below
print("[ ] Demo rehearsed")
# YOUR TURN: print("[ ] Backup screen recording")
""",
                                codeTests: [
                    CodeTest(
                        id: "w30-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w30-l2",
                title: "Peer feedback notes",
                body: """
**Today's focus:** Peer feedback notes

### The idea

Write one thing to improve and one win.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 30 capstone project.


### Coach note
print("Win:")
print("Improve:")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Win:\")\nprint(\"Improve:\")",
                practiceSteps: [
                    "Read **Learn** for \"Peer feedback notes\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 30 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w30-l3",
                title: "Level 3 graduation",
                body: """
**Today's focus:** Level 3 graduation

### The idea

Export progress; screenshot best project.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 30 capstone project.


### Coach note
print("Level 3 complete!")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Level 3 complete!\")",
                practiceSteps: [
                    "Read **Learn** for \"Level 3 graduation\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 30 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week31: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w31-l1",
                title: "Three paradigms",
                body: """
**Today's focus:** Three paradigms

### The idea

Procedural: step-by-step. OOP: objects. Functional: map/filter on data.


### Why it matters

Functions keep code organized — write once, call many times. Classes model real things: players, cards, weather data.


### Example to study
```
print("Procedural: functions in order")
print("OOP: classes")
print("Functional: map/filter")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 31 capstone project.


### Coach note
Name the three styles.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Name the three styles.",
                practiceSteps: [
                    "Read **Learn** for \"Three paradigms\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 31 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Three paradigms — work through each step below
print("Procedural: functions in order")
print("OOP: classes")
# YOUR TURN: print("Functional: map/filter")
""",
                                codeTests: [
                    CodeTest(
                        id: "w31-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w31-l2",
                title: "Calculator with functions",
                body: """
**Today's focus:** Calculator with functions

### The idea

add, subtract as plain functions.


### Why it matters

Functions keep code organized — write once, call many times.


### Example to study
```
def add(a,b): return a+b
def sub(a,b): return a-b
print(add(5,3))
```


### Paper trace (do this first)

Pick sample arguments. Trace into the function and write the return value.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 31 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Add multiply.",
                practiceSteps: [
                    "Read **Learn** for \"Calculator with functions\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 31 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Calculator with functions — work through each step below
def add(a,b): return a+b
def sub(a,b): return a-b
# YOUR TURN: print(add(5,3))
""",
                                codeTests: [
                    CodeTest(
                        id: "w31-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w31-l2-uses-return",
                        label: "Uses return",
                        assertionScript: """
                        assert "return" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w31-l3",
                title: "Same calc with a class",
                body: """
**Today's focus:** Same calc with a class

### The idea

Calculator class holds history list.


### Why it matters

Classes model real things: players, cards, weather data. Lists store collections: questions, scores, inventory items.


### Example to study
```
class Calc:
    def __init__(self):
        self.history = []
    def add(self,a,b):
        r=a+b
        self.history.append(f"{a}+{b}={r}")
        return r
```


### Paper trace (do this first)

Draw a box labeled with the class name. List each attribute and method inside.


### Common mistakes

- Forgetting `self.` when accessing attributes inside methods


### Session prep
Finish this lesson before starting the Week 31 capstone project.


### Coach note
Add history.append each op.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Add history.append each op.",
                practiceSteps: [
                    "Read **Learn** for \"Same calc with a class\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 31 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Same calc with a class — work through each step below
class Calc:
    def __init__(self):
        self.history = []
    def add(self,a,b):
        r=a+b
        self.history.append(f"{a}+{b}={r}")
        # YOUR TURN: return r
""",
                                codeTests: [
                    CodeTest(
                        id: "w31-l3-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w31-l3-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
    ]

    static let week32: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w32-l1",
                title: "Room class",
                body: """
**Today's focus:** Room class

### The idea

Each room has name, description, exits dict.


### Why it matters

Classes model real things: players, cards, weather data. Dictionaries map names to values — menus, settings, JSON data.


### Example to study
```
class Room:
    def __init__(self, name, desc):
        self.name = name
        self.desc = desc
        self.exits = {}

kitchen = Room("Kitchen", "A small kitchen.")
print(kitchen.desc)
```


### Paper trace (do this first)

Draw a box labeled with the class name. List each attribute and method inside.


### Common mistakes

- Forgetting `self.` when accessing attributes inside methods
- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 32 capstone project.


### Coach note
Draw 3 rooms on paper.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Draw 3 rooms on paper.",
                practiceSteps: [
                    "Read **Learn** for \"Room class\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 32 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Room class — work through each step below
class Room:
    def __init__(self, name, desc):
        self.name = name
        self.desc = desc
        self.exits = {}

kitchen = Room("Kitchen", "A small kitchen.")
# YOUR TURN: print(kitchen.desc)
""",
                                codeTests: [
                    CodeTest(
                        id: "w32-l1-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w32-l1-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w32-l2",
                title: "Linking rooms",
                body: """
**Today's focus:** Linking rooms

### The idea

`room.exits["north"] = other_room`


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
class Room:
    def __init__(self, name):
        self.name = name
        self.exits = {}
a = Room("Hall")
b = Room("Garden")
a.exits["south"] = b
print(a.exits["south"].name)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 32 capstone project.


### Check your understanding
Quick check: *What connects rooms?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Connect two rooms.",
                practiceSteps: [
                    "Read **Learn** for \"Linking rooms\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 32 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Linking rooms — work through each step below
class Room:
    def __init__(self, name):
        self.name = name
        self.exits = {}
a = Room("Hall")
b = Room("Garden")
a.exits["south"] = b
# YOUR TURN: print(a.exits["south"].name)
""",
                challengeQuestion: "What connects rooms?",
                challengeAnswer: "exits",
                                codeTests: [
                    CodeTest(
                        id: "w32-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w32-l2-defines-a-class",
                        label: "Defines a class",
                        assertionScript: """
                        assert "class " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w32-l3",
                title: "Game loop for adventure",
                body: """
**Today's focus:** Game loop for adventure

### The idea

Print description; read command; move if valid.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions. Loops power menus, games, and anything that repeats. Game loops combine input, update, and draw every frame.


### Paper trace (do this first)

How many times will the loop run? Write each expected output line on paper.


### Common mistakes

- Using `=` instead of `==` inside conditions
- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 32 capstone project.


### Coach note
print("> look — print room desc")
print("> go north — if exit exists")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"> look — print room desc\")\nprint(\"> go north — if exit exists\")",
                practiceSteps: [
                    "Read **Learn** for \"Game loop for adventure\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 32 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week33: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w33-l1",
                title: "map & filter",
                body: """
**Today's focus:** map & filter

### The idea

`map(fn, list)` transforms each item.
`filter(fn, list)` keeps items where fn is True.


### Why it matters

Lists store collections: questions, scores, inventory items.


### Example to study
```
nums = [1,2,3,4]
print(list(map(lambda x: x*2, nums)))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 33 capstone project.


### Coach note
Double a list with map.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Double a list with map.",
                practiceSteps: [
                    "Read **Learn** for \"map & filter\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 33 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# map & filter — work through each step below
nums = [1,2,3,4]
# YOUR TURN: print(list(map(lambda x: x*2, nums)))
""",
                                codeTests: [
                    CodeTest(
                        id: "w33-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w33-l2",
                title: "reduce",
                body: """
**Today's focus:** reduce

### The idea

`functools.reduce` combines list to one value.


### Why it matters

Lists store collections: questions, scores, inventory items.


### Example to study
```
from functools import reduce
print(reduce(lambda a,b: a+b, [1,2,3,4]))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 33 capstone project.


### Check your understanding
Quick check: *Which function combines to one value?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Sum with reduce.",
                practiceSteps: [
                    "Read **Learn** for \"reduce\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 33 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# reduce — work through each step below
from functools import reduce
# YOUR TURN: print(reduce(lambda a,b: a+b, [1,2,3,4]))
""",
                challengeQuestion: "Which function combines to one value?",
                challengeAnswer: "reduce",
                                codeTests: [
                    CodeTest(
                        id: "w33-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w33-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w33-l3",
                title: "Pipeline",
                body: """
**Today's focus:** Pipeline

### The idea

Read → filter → map → print.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 33 capstone project.


### Coach note
data = [1,2,3,4,5,6]
evens = filter(lambda x: x%2==0, data)
print(list(map(lambda x: x*10, evens)))


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "data = [1,2,3,4,5,6]\nevens = filter(lambda x: x%2==0, data)\nprint(list(map(lambda x: x*10, evens)))",
                practiceSteps: [
                    "Read **Learn** for \"Pipeline\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 33 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week34: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w34-l1",
                title: "Bubble sort idea",
                body: """
**Today's focus:** Bubble sort idea

### The idea

Compare neighbors; swap if wrong order; repeat.


### Why it matters

Every game, quiz, and app chooses different behavior based on conditions. Sorting and searching are core CS skills used everywhere.


### Example to study
```
arr = [3,1,2]
for i in range(len(arr)):
    for j in range(len(arr)-1-i):
        if arr[j] > arr[j+1]:
            arr[j], arr[j+1] = arr[j+1], arr[j]
print(arr)
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Using `=` instead of `==` inside conditions


### Session prep
Finish this lesson before starting the Week 34 capstone project.


### Check your understanding
Quick check: *Which sort compares neighbors?* — think before peeking at hints.


### Coach note
Sort [3,1,2] on paper.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Sort [3,1,2] on paper.",
                practiceSteps: [
                    "Read **Learn** for \"Bubble sort idea\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 34 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Bubble sort idea — work through each step below
arr = [3,1,2]
for i in range(len(arr)):
    for j in range(len(arr)-1-i):
        if arr[j] > arr[j+1]:
            arr[j], arr[j+1] = arr[j+1], arr[j]
# YOUR TURN: print(arr)
""",
                challengeQuestion: "Which sort compares neighbors?",
                challengeAnswer: "bubble sort",
                                codeTests: [
                    CodeTest(
                        id: "w34-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w34-l1-uses-if",
                        label: "Uses if",
                        assertionScript: """
                        assert "if " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w34-l2",
                title: "Binary search",
                body: """
**Today's focus:** Binary search

### The idea

Works on **sorted** list. Cut search space in half.


### Why it matters

Lists store collections: questions, scores, inventory items. Sorting and searching are core CS skills used everywhere.


### Example to study
```
def binary_search(arr, target):
    lo, hi = 0, len(arr)-1
    while lo <= hi:
        mid = (lo+hi)//2
        if arr[mid] == target: return mid
        if arr[mid] < target: lo = mid+1
        else: hi = mid-1
    return -1
print(binary_search([1,3,5,7,9], 7))
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 34 capstone project.


### Check your understanding
Quick check: *Requires sorted list?* — think before peeking at hints.


### Coach note
Search for 7 in sorted list.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Search for 7 in sorted list.",
                practiceSteps: [
                    "Read **Learn** for \"Binary search\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 34 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Binary search — work through each step below
def binary_search(arr, target):
    lo, hi = 0, len(arr)-1
    while lo <= hi:
        mid = (lo+hi)//2
        if arr[mid] == target: return mid
        if arr[mid] < target: lo = mid+1
        else: hi = mid-1
    return -1
# YOUR TURN: print(binary_search([1,3,5,7,9], 7))
""",
                challengeQuestion: "Requires sorted list?",
                challengeAnswer: "binary search",
                                codeTests: [
                    CodeTest(
                        id: "w34-l2-defines-a-function",
                        label: "Defines a function",
                        assertionScript: """
                        assert "def " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w34-l2-uses-a-while-loop",
                        label: "Uses a while loop",
                        assertionScript: """
                        assert "while " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w34-l3",
                title: "Big-O intuition",
                body: """
**Today's focus:** Big-O intuition

### The idea

Nested loops → slower on big data. Binary search is faster.


### Why it matters

Loops power menus, games, and anything that repeats. Sorting and searching are core CS skills used everywhere.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 34 capstone project.


### Coach note
print("Bubble: check many pairs")
print("Binary: halve each step")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Bubble: check many pairs\")\nprint(\"Binary: halve each step\")",
                practiceSteps: [
                    "Read **Learn** for \"Big-O intuition\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 34 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week35: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w35-l1",
                title: "Grid as 2D list",
                body: """
**Today's focus:** Grid as 2D list

### The idea

grid[row][col] — 0 often means open, 1 wall.


### Why it matters

Lists store collections: questions, scores, inventory items.


### Example to study
```
grid = [[0]*5 for _ in range(5)]
grid[2][2] = 1
print(grid[2])
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 35 capstone project.


### Coach note
Make a 5x5 grid of zeros.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Make a 5x5 grid of zeros.",
                practiceSteps: [
                    "Read **Learn** for \"Grid as 2D list\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 35 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Grid as 2D list — work through each step below
grid = [[0]*5 for _ in range(5)]
grid[2][2] = 1
# YOUR TURN: print(grid[2])
""",
                                codeTests: [
                    CodeTest(
                        id: "w35-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w35-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w35-l2",
                title: "BFS idea",
                body: """
**Today's focus:** BFS idea

### The idea

Explore neighbors layer by layer — shortest path in unweighted grid.


### Why it matters

Sorting and searching are core CS skills used everywhere.


### Example to study
```
print("Queue: start cell")
print("Add unvisited neighbors")
print("Stop at goal")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 35 capstone project.


### Check your understanding
Quick check: *Shortest path algorithm?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Mark visited cells.",
                practiceSteps: [
                    "Read **Learn** for \"BFS idea\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 35 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# BFS idea — work through each step below
print("Queue: start cell")
print("Add unvisited neighbors")
# YOUR TURN: print("Stop at goal")
""",
                challengeQuestion: "Shortest path algorithm?",
                challengeAnswer: "BFS",
                                codeTests: [
                    CodeTest(
                        id: "w35-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w35-l3",
                title: "Implement on paper",
                body: """
**Today's focus:** Implement on paper

### The idea

Trace BFS from start to goal on a small maze.


### Why it matters

Sorting and searching are core CS skills used everywhere.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 35 capstone project.


### Coach note
print("Maze: S=start, G=goal, #=wall")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Maze: S=start, G=goal, #=wall\")",
                practiceSteps: [
                    "Read **Learn** for \"Implement on paper\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 35 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week36: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w36-l1",
                title: "Train/test split",
                body: """
**Today's focus:** Train/test split

### The idea

Never test on training data only — hold out some rows.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("Train: learn patterns")
print("Test: check on new data")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 36 capstone project.


### Coach note
Split 80/20 on paper.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Split 80/20 on paper.",
                practiceSteps: [
                    "Read **Learn** for \"Train/test split\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 36 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Train/test split — work through each step below
print("Train: learn patterns")
# YOUR TURN: print("Test: check on new data")
""",
                                codeTests: [
                    CodeTest(
                        id: "w36-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w36-l2",
                title: "Features & labels",
                body: """
**Today's focus:** Features & labels

### The idea

X = inputs, y = what you predict.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data.


### Example to study
```
X = [[5, 1], [10, 0]]  # word count, question mark
y = [0, 1]  # subject
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting that `input()` always returns a string
- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 36 capstone project.


### Coach note
Name 2 features for quiz prediction.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Name 2 features for quiz prediction.",
                practiceSteps: [
                    "Read **Learn** for \"Features & labels\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 36 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Features & labels — work through each step below
X = [[5, 1], [10, 0]]  # word count, question mark
# YOUR TURN: y = [0, 1]  # subject
""",
                                codeTests: [
                    CodeTest(
                        id: "w36-l2-has-python-code",
                        label: "Has Python code",
                        assertionScript: """
                        assert len(user_code.strip()) > 10
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w36-l3",
                title: "Accuracy",
                body: """
**Today's focus:** Accuracy

### The idea

`score` method on held-out test set.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 36 capstone project.


### Coach note
# pip3 install scikit-learn
from sklearn.neighbors import KNeighborsClassifier
X=[[1],[2],[3],[10]]
y=[0,0,1,1]
m=KNeighborsClassifier(n_neighbors=1)
m.fit(X[:3], y[:3])
print(m.score(X[3:], y[3:]))


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "# pip3 install scikit-learn\nfrom sklearn.neighbors import KNeighborsClassifier\nX=[[1],[2],[3],[10]]\ny=[0,0,1,1]\nm=KNeighborsClassifier(n_neighbors=1)\nm.fit(X[:3], y[:3])\nprint(m.score(X[3:], y[3:]))",
                practiceSteps: [
                    "Read **Learn** for \"Accuracy\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 36 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week37: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w37-l1",
                title: "Tkinter for results",
                body: """
**Today's focus:** Tkinter for results

### The idea

Show prediction label and confidence in GUI.


### Why it matters

Loops power menus, games, and anything that repeats. Dictionaries map names to values — menus, settings, JSON data. GUIs let anyone use your program without reading code.


### Example to study
```
import tkinter as tk
root=tk.Tk()
tk.Label(root,text="Prediction:").pack()
tk.Label(root,text="(run model)").pack()
root.mainloop()
```


### Paper trace (do this first)

How many times will the loop run? Write each expected output line on paper.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4
- KeyError — accessing a key that does not exist
- Missing `root.mainloop()` — window flashes and closes


### Session prep
Finish this lesson before starting the Week 37 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Sketch layout.",
                practiceSteps: [
                    "Read **Learn** for \"Tkinter for results\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 37 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Tkinter for results — work through each step below
import tkinter as tk
root=tk.Tk()
tk.Label(root,text="Prediction:").pack()
# YOUR TURN: tk.Label(root,text="(run model)").pack()
root.mainloop()
""",
                                codeTests: [
                    CodeTest(
                        id: "w37-l1-uses-a-for-loop",
                        label: "Uses a for loop",
                        assertionScript: """
                        assert "for " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w37-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l2",
                title: "Wire predict button",
                body: """
**Today's focus:** Wire predict button

### The idea

Button runs model.predict on entry features.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data. GUIs let anyone use your program without reading code. Machine learning finds patterns in data to make predictions. Handling errors keeps programs friendly when something goes wrong.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 37 capstone project.


### Coach note
print("on_click: read inputs → predict → update label")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"on_click: read inputs → predict → update label\")",
                practiceSteps: [
                    "Read **Learn** for \"Wire predict button\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 37 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l3",
                title: "UX polish",
                body: """
**Today's focus:** UX polish

### The idea

Clear errors, disable button while loading.


### Why it matters

Loops power menus, games, and anything that repeats. GUIs let anyone use your program without reading code.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Infinite loop — forgetting to update the counter or add `break`


### Session prep
Finish this lesson before starting the Week 37 capstone project.


### Coach note
print("Show Loading... while fetching")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Show Loading... while fetching\")",
                practiceSteps: [
                    "Read **Learn** for \"UX polish\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 37 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week38: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w38-l1",
                title: "Fetch weather CSV/API",
                body: """
**Today's focus:** Fetch weather CSV/API

### The idea

Combine requests + pandas.


### Why it matters

Files save work between runs — notes, saves, CSV exports. APIs connect your program to live data on the internet. Pandas handles tables — scores, weather, science data.


### Example to study
```
import pandas as pd
df = pd.DataFrame({"city":["Houston"],"temp":[72]})
print(df)
```


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 38 capstone project.


### Coach note
pip3 install pandas requests


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "pip3 install pandas requests",
                practiceSteps: [
                    "Read **Learn** for \"Fetch weather CSV/API\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 38 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Fetch weather CSV/API — work through each step below
import pandas as pd
df = pd.DataFrame({"city":["Houston"],"temp":[72]})
# YOUR TURN: print(df)
""",
                                codeTests: [
                    CodeTest(
                        id: "w38-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w38-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w38-l2",
                title: "groupby",
                body: """
**Today's focus:** groupby

### The idea

`df.groupby("city")["temp"].mean()`


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
import pandas as pd
df=pd.DataFrame({"city":["H","H","D"],"temp":[70,75,80]})
print(df.groupby("city")["temp"].mean())
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 38 capstone project.


### Check your understanding
Quick check: *pandas group rows?* — think before peeking at hints.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Group sample data.",
                practiceSteps: [
                    "Read **Learn** for \"groupby\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 38 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# groupby — work through each step below
import pandas as pd
df=pd.DataFrame({"city":["H","H","D"],"temp":[70,75,80]})
# YOUR TURN: print(df.groupby("city")["temp"].mean())
""",
                challengeQuestion: "pandas group rows?",
                challengeAnswer: "groupby",
                                codeTests: [
                    CodeTest(
                        id: "w38-l2-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w38-l2-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w38-l3",
                title: "Plot grouped data",
                body: """
**Today's focus:** Plot grouped data

### The idea

Bar chart of averages.


### Why it matters

Graphs reveal patterns numbers alone hide.


### Paper trace (do this first)

Sketch the x/y axes and where each point goes before plt.show().


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 38 capstone project.


### Coach note
print("plt.bar(cities, avg_temps)")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"plt.bar(cities, avg_temps)\")",
                practiceSteps: [
                    "Read **Learn** for \"Plot grouped data\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 38 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week39: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w39-l1",
                title: "Project plan doc",
                body: """
**Today's focus:** Project plan doc

### The idea

Goal, milestones, files, risks.


### Why it matters

Files save work between runs — notes, saves, CSV exports. Planning before coding saves hours of debugging.


### Example to study
```
print("Capstone title:")
print("Week 1 milestone:")
print("Week 2 milestone:")
```


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 39 capstone project.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Fill one-page plan.",
                practiceSteps: [
                    "Read **Learn** for \"Project plan doc\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 39 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Project plan doc — work through each step below
print("Capstone title:")
print("Week 1 milestone:")
# YOUR TURN: print("Week 2 milestone:")
""",
                                codeTests: [
                    CodeTest(
                        id: "w39-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w39-l2",
                title: "Code review checklist",
                body: """
**Today's focus:** Code review checklist

### The idea

Readable names, no giant functions, comments on tricky parts.


### Why it matters

Functions keep code organized — write once, call many times. Lists store collections: questions, scores, inventory items.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting `return` when you need a value back


### Session prep
Finish this lesson before starting the Week 39 capstone project.


### Coach note
print("[ ] Names clear")
print("[ ] One job per function")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"[ ] Names clear\")\nprint(\"[ ] One job per function\")",
                practiceSteps: [
                    "Read **Learn** for \"Code review checklist\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 39 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w39-l3",
                title: "Start coding MVP",
                body: """
**Today's focus:** Start coding MVP

### The idea

First commit: one file that runs.


### Why it matters

Files save work between runs — notes, saves, CSV exports.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 39 capstone project.


### Coach note
print("Today: skeleton + one feature")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Today: skeleton + one feature\")",
                practiceSteps: [
                    "Read **Learn** for \"Start coding MVP\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 39 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week40: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w40-l1",
                title: "README draft",
                body: """
**Today's focus:** README draft

### The idea

How to run, what it does, screenshot.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("# Project Name")
print("## Run: python3 main.py")
```


### Paper trace (do this first)

After Run, what should be on disk? Draw the file contents before and after.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 40 capstone project.


### Check your understanding
Quick check: *Docs file name?* — think before peeking at hints.


### Coach note
Outline README sections.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "Outline README sections.",
                practiceSteps: [
                    "Read **Learn** for \"README draft\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 40 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# README draft — work through each step below
print("# Project Name")
# YOUR TURN: print("## Run: python3 main.py")
""",
                challengeQuestion: "Docs file name?",
                challengeAnswer: "README",
                                codeTests: [
                    CodeTest(
                        id: "w40-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w40-l2",
                title: "Professional demo",
                body: """
**Today's focus:** Professional demo

### The idea

2 min, backup recording, thank you.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Bullet your plan or demo script on paper before opening Playground.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 40 capstone project.


### Coach note
print("[ ] README done")
print("[ ] Demo rehearsed")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"[ ] README done\")\nprint(\"[ ] Demo rehearsed\")",
                practiceSteps: [
                    "Read **Learn** for \"Professional demo\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 40 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w40-l3",
                title: "Level 4 session graduation",
                body: """
**Today's focus:** Level 4 session graduation

### The idea

Celebrate portfolio + capstone.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 40 capstone project.


### Coach note
print("Level 4 session track complete!")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Level 4 session track complete!\")",
                practiceSteps: [
                    "Read **Learn** for \"Level 4 session graduation\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 40 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week41: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w41-l1",
                title: "Calculator requirements",
                body: """
**Today's focus:** Calculator requirements

### The idea

History, error on divide by zero, two styles.


### Why it matters

Planning before coding saves hours of debugging.


### Example to study
```
print("Must: + - * /")
print("Must: history list")
print("Must: try/except on /")
```


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 41 capstone project.


### Coach note
List must-have features.


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "List must-have features.",
                practiceSteps: [
                    "Read **Learn** for \"Calculator requirements\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Complete each Step / TODO in order — Run after every fix.",
                    "Connect this skill to the Week 41 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# Calculator requirements — work through each step below
print("Must: + - * /")
print("Must: history list")
# YOUR TURN: print("Must: try/except on /")
""",
                                codeTests: [
                    CodeTest(
                        id: "w41-l1-uses-print",
                        label: "Uses print()",
                        assertionScript: """
                        assert "print" in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w41-l2",
                title: "Error handling",
                body: """
**Today's focus:** Error handling

### The idea

try/except ZeroDivisionError.


### Why it matters

Handling errors keeps programs friendly when something goes wrong.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 41 capstone project.


### Coach note
try:
    print(10/0)
except ZeroDivisionError:
    print("Cannot divide by zero")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "try:\n    print(10/0)\nexcept ZeroDivisionError:\n    print(\"Cannot divide by zero\")",
                practiceSteps: [
                    "Read **Learn** for \"Error handling\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 41 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w41-l3",
                title: "Build history log",
                body: """
**Today's focus:** Build history log

### The idea

Append each operation string.


### Why it matters

Lists store collections: questions, scores, inventory items.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 41 capstone project.


### Coach note
history = []
def log(op):
    history.append(op)
log("2+2=4")
print(history)


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "history = []\ndef log(op):\n    history.append(op)\nlog(\"2+2=4\")\nprint(history)",
                practiceSteps: [
                    "Read **Learn** for \"Build history log\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 41 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week42: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w42-l1",
                title: "Save game JSON",
                body: """
**Today's focus:** Save game JSON

### The idea

Serialize rooms, inventory, location.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data. Game loops combine input, update, and draw every frame.


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 42 capstone project.


### Coach note
import json
state={"room":"hall","inventory":[]}
print(json.dumps(state))


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "import json\nstate={\"room\":\"hall\",\"inventory\":[]}\nprint(json.dumps(state))",
                practiceSteps: [
                    "Read **Learn** for \"Save game JSON\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 42 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l2",
                title: "Load game JSON",
                body: """
**Today's focus:** Load game JSON

### The idea

Restore from file on start.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data. Files save work between runs — notes, saves, CSV exports. Game loops combine input, update, and draw every frame.


### Paper trace (do this first)

Sketch: URL → response → Python dict → one value you will print.


### Common mistakes

- KeyError — accessing a key that does not exist
- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 42 capstone project.


### Coach note
print("if save.json: load else new game")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"if save.json: load else new game\")",
                practiceSteps: [
                    "Read **Learn** for \"Load game JSON\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 42 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l3",
                title: "Inventory commands",
                body: """
**Today's focus:** Inventory commands

### The idea

take, use, look — parse user input.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting that `input()` always returns a string


### Session prep
Finish this lesson before starting the Week 42 capstone project.


### Coach note
print("> take key — add to inventory")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"> take key — add to inventory\")",
                practiceSteps: [
                    "Read **Learn** for \"Inventory commands\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 42 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week43: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w43-l1",
                title: "Visualize one swap",
                body: """
**Today's focus:** Visualize one swap

### The idea

Print array before/after each bubble pass.


### Why it matters

Sorting and searching are core CS skills used everywhere.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 43 capstone project.


### Coach note
arr=[3,1,2]
print("Before:", arr)
# one pass bubble
print("After pass:", sorted(arr))


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "arr=[3,1,2]\nprint(\"Before:\", arr)\n# one pass bubble\nprint(\"After pass:\", sorted(arr))",
                practiceSteps: [
                    "Read **Learn** for \"Visualize one swap\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 43 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l2",
                title: "Step counter",
                body: """
**Today's focus:** Step counter

### The idea

Count comparisons for performance talk.


### Why it matters

Loops power menus, games, and anything that repeats.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 43 capstone project.


### Coach note
comparisons = 0
print("Track comparisons each loop")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "comparisons = 0\nprint(\"Track comparisons each loop\")",
                practiceSteps: [
                    "Read **Learn** for \"Step counter\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 43 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l3",
                title: "matplotlib bars optional",
                body: """
**Today's focus:** matplotlib bars optional

### The idea

Show array state as bar heights.


### Why it matters

Graphs reveal patterns numbers alone hide.


### Paper trace (do this first)

Sketch the x/y axes and where each point goes before plt.show().


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 43 capstone project.


### Coach note
print("Optional: plt.bar(range(n), arr)")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Optional: plt.bar(range(n), arr)\")",
                practiceSteps: [
                    "Read **Learn** for \"matplotlib bars optional\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 43 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week44: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w44-l1",
                title: "Parse maze grid",
                body: """
**Today's focus:** Parse maze grid

### The idea

Read 2D list from file or literal.


### Why it matters

Lists store collections: questions, scores, inventory items. Files save work between runs — notes, saves, CSV exports.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Wrong mode: `"w"` overwrites; use `"a"` to append


### Session prep
Finish this lesson before starting the Week 44 capstone project.


### Coach note
maze = [["S",".","."],["#",".","."],[".",".","G"]]
print(maze)


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "maze = [[\"S\",\".\",\".\"],[\"#\",\".\",\".\"],[\".\",\".\",\"G\"]]\nprint(maze)",
                practiceSteps: [
                    "Read **Learn** for \"Parse maze grid\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 44 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l2",
                title: "BFS queue code",
                body: """
**Today's focus:** BFS queue code

### The idea

collections.deque for queue.


### Why it matters

Loops power menus, games, and anything that repeats. Sorting and searching are core CS skills used everywhere.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 44 capstone project.


### Coach note
from collections import deque
q = deque([(0,0)])
print(q.popleft())


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "from collections import deque\nq = deque([(0,0)])\nprint(q.popleft())",
                practiceSteps: [
                    "Read **Learn** for \"BFS queue code\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 44 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l3",
                title: "Reconstruct path",
                body: """
**Today's focus:** Reconstruct path

### The idea

Parent map from BFS.


### Why it matters

Sorting and searching are core CS skills used everywhere.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 44 capstone project.


### Coach note
print("parent[(r,c)] = where we came from")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"parent[(r,c)] = where we came from\")",
                practiceSteps: [
                    "Read **Learn** for \"Reconstruct path\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 44 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week45: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w45-l1",
                title: "Weather features",
                body: """
**Today's focus:** Weather features

### The idea

temp, humidity as ML inputs.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Forgetting that `input()` always returns a string


### Session prep
Finish this lesson before starting the Week 45 capstone project.


### Coach note
print("Features: temp, humidity")
print("Label: rain tomorrow?")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Features: temp, humidity\")\nprint(\"Label: rain tomorrow?\")",
                practiceSteps: [
                    "Read **Learn** for \"Weather features\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 45 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l2",
                title: "Train simple model",
                body: """
**Today's focus:** Train simple model

### The idea

fit on CSV sample.


### Why it matters

Files save work between runs — notes, saves, CSV exports. Machine learning finds patterns in data to make predictions.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 45 capstone project.


### Coach note
# pip3 install scikit-learn pandas
print("df = pd.read_csv(...); model.fit(X,y)")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "# pip3 install scikit-learn pandas\nprint(\"df = pd.read_csv(...); model.fit(X,y)\")",
                practiceSteps: [
                    "Read **Learn** for \"Train simple model\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 45 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l3",
                title: "Evaluate & report",
                body: """
**Today's focus:** Evaluate & report

### The idea

Print accuracy or confusion.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 45 capstone project.


### Coach note
print("print(f Accuracy: {score:.0%}")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"print(f Accuracy: {score:.0%}\")",
                practiceSteps: [
                    "Read **Learn** for \"Evaluate & report\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 45 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week46: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w46-l1",
                title: "Dashboard layout",
                body: """
**Today's focus:** Dashboard layout

### The idea

grid or pack sections: header, stats, buttons.


### Why it matters

GUIs let anyone use your program without reading code.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 46 capstone project.


### Coach note
import tkinter as tk
root=tk.Tk()
tk.Label(root,text="Dashboard").pack()
root.mainloop()


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "import tkinter as tk\nroot=tk.Tk()\ntk.Label(root,text=\"Dashboard\").pack()\nroot.mainloop()",
                practiceSteps: [
                    "Read **Learn** for \"Dashboard layout\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 46 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l2",
                title: "Bind events",
                body: """
**Today's focus:** Bind events

### The idea

Buttons refresh displayed data.


### Why it matters

GUIs let anyone use your program without reading code.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 46 capstone project.


### Coach note
print("Refresh button updates labels")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Refresh button updates labels\")",
                practiceSteps: [
                    "Read **Learn** for \"Bind events\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 46 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l3",
                title: "Consistent styling",
                body: """
**Today's focus:** Consistent styling

### The idea

Same font, padding, colors.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 46 capstone project.


### Coach note
print("Pick 2 colors + one font")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Pick 2 colors + one font\")",
                practiceSteps: [
                    "Read **Learn** for \"Consistent styling\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 46 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week47: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w47-l1",
                title: "Review 6 projects",
                body: """
**Today's focus:** Review 6 projects

### The idea

Pick strengths for final capstone.


### Why it matters

Loops power menus, games, and anything that repeats.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4


### Session prep
Finish this lesson before starting the Week 47 capstone project.


### Coach note
print("Best project so far:")
print("Skill to showcase:")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Best project so far:\")\nprint(\"Skill to showcase:\")",
                practiceSteps: [
                    "Read **Learn** for \"Review 6 projects\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 47 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l2",
                title: "Design doc template",
                body: """
**Today's focus:** Design doc template

### The idea

Problem, users, features, timeline.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 47 capstone project.


### Coach note
print("Final project title:")
print("4-week timeline:")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Final project title:\")\nprint(\"4-week timeline:\")",
                practiceSteps: [
                    "Read **Learn** for \"Design doc template\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 47 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l3",
                title: "Choose capstone track",
                body: """
**Today's focus:** Choose capstone track

### The idea

Game / Data / Algorithm viz.


### Why it matters

Game loops combine input, update, and draw every frame.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 47 capstone project.


### Coach note
print("Track: Game / Data / Algo")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Track: Game / Data / Algo\")",
                practiceSteps: [
                    "Read **Learn** for \"Choose capstone track\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 47 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week48: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w48-l1",
                title: "Sprint 1 goal",
                body: """
**Today's focus:** Sprint 1 goal

### The idea

One core feature working E2E.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 48 capstone project.


### Coach note
print("Sprint 1 = MVP feature only")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Sprint 1 = MVP feature only\")",
                practiceSteps: [
                    "Read **Learn** for \"Sprint 1 goal\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 48 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l2",
                title: "Debug systematically",
                body: """
**Today's focus:** Debug systematically

### The idea

Print debug, read traceback, fix one error.


### Why it matters

Handling errors keeps programs friendly when something goes wrong.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 48 capstone project.


### Coach note
print("1. Reproduce 2. Read error 3. Fix 4. Re-test")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"1. Reproduce 2. Read error 3. Fix 4. Re-test\")",
                practiceSteps: [
                    "Read **Learn** for \"Debug systematically\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 48 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l3",
                title: "Commit milestone",
                body: """
**Today's focus:** Commit milestone

### The idea

Tag what works today.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 48 capstone project.


### Coach note
print("Milestone: core feature runs")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Milestone: core feature runs\")",
                practiceSteps: [
                    "Read **Learn** for \"Commit milestone\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 48 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week49: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w49-l1",
                title: "Write README",
                body: """
**Today's focus:** Write README

### The idea

Install, run, screenshot.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

After Run, what should be on disk? Draw the file contents before and after.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 49 capstone project.


### Coach note
print("## Install")
print("pip3 install ...")
print("python3 main.py")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"## Install\")\nprint(\"pip3 install ...\")\nprint(\"python3 main.py\")",
                practiceSteps: [
                    "Read **Learn** for \"Write README\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 49 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l2",
                title: "Manual test checklist",
                body: """
**Today's focus:** Manual test checklist

### The idea

Every button, edge case.


### Why it matters

Lists store collections: questions, scores, inventory items. GUIs let anyone use your program without reading code.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 49 capstone project.


### Coach note
print("[ ] Happy path")
print("[ ] Bad input")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"[ ] Happy path\")\nprint(\"[ ] Bad input\")",
                practiceSteps: [
                    "Read **Learn** for \"Manual test checklist\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 49 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l3",
                title: "Code cleanup",
                body: """
**Today's focus:** Code cleanup

### The idea

Remove print debug, rename vars.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 49 capstone project.


### Coach note
print("Delete TODO debug prints")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Delete TODO debug prints\")",
                practiceSteps: [
                    "Read **Learn** for \"Code cleanup\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 49 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

    static let week50: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w50-l1",
                title: "Final presentation",
                body: """
**Today's focus:** Final presentation

### The idea

2 min demo + Q&A.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 50 capstone project.


### Coach note
print("[ ] Demo ready")
print("[ ] README link")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"[ ] Demo ready\")\nprint(\"[ ] README link\")",
                practiceSteps: [
                    "Read **Learn** for \"Final presentation\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 50 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l2",
                title: "Portfolio folder",
                body: """
**Today's focus:** Portfolio folder

### The idea

Screenshots + exported JSON.


### Why it matters

Dictionaries map names to values — menus, settings, JSON data.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- KeyError — accessing a key that does not exist


### Session prep
Finish this lesson before starting the Week 50 capstone project.


### Coach note
print("Folder: best 4 projects")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Folder: best 4 projects\")",
                practiceSteps: [
                    "Read **Learn** for \"Portfolio folder\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 50 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l3",
                title: "Graduation!",
                body: """
**Today's focus:** Graduation!

### The idea

Level 4 portfolio complete.


### Why it matters

Planning before coding saves hours of debugging.


### Paper trace (do this first)

Read the starter top to bottom. Predict the full output before pressing Run.


### Common mistakes

- Running before reading — always predict output first
- Changing too many lines at once — fix one error at a time


### Session prep
Finish this lesson before starting the Week 50 capstone project.


### Coach note
print("Congratulations, Soha!")


### Your job in Playground
Work the starter step by step. Predict → Run → fix one error at a time.
""",
                teacherScript: "print(\"Congratulations, Soha!\")",
                practiceSteps: [
                    "Read **Learn** for \"Graduation!\" — do the paper trace before coding.",
                    "Open Playground. Read the starter top to bottom without running yet.",
                    "Run once, compare output to your prediction, then change one line.",
                    "Connect this skill to the Week 50 session capstone in your own words.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

}
