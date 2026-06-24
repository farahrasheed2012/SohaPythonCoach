import Foundation

/// Auto-generated teach-before-session lessons for weeks 11–50.
/// Regenerate: python3 Scripts/generate_session_teaching.py
enum SessionTeachingLessons {
    static let week11: [LessonStep] = [
            CurriculumSeed.teachingLesson(
                id: "w11-l1",
                title: "if / elif / else refresher",
                body: """
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
""",
                teacherScript: "Trace score=85 on paper before Run.",
                practiceSteps: [
                    "Read Learn — study the example for \"if / elif / else refresher\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`def` names a reusable block. `return` sends a value back.

```
def double(n):
    return n * 2

print(double(5))
```
""",
                teacherScript: "Change double to triple.",
                practiceSteps: [
                    "Read Learn — study the example for \"Functions refresher\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`for item in collection:` visits each item.

`while condition:` repeats until the condition is False.
""",
                teacherScript: "Write a loop that prints 1,2,3.",
                practiceSteps: [
                    "Read Learn — study the example for \"Loops refresher\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
A **traceback** shows where Python stopped. Read from the bottom line up.
""",
                teacherScript: "Run broken code on purpose: `int(\"abc\")`.",
                practiceSteps: [
                    "Read Learn — study the example for \"When programs crash\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`try:` runs risky code.
`except:` handles a specific error.
`finally:` always runs at the end.
""",
                teacherScript: "Wrap int(input()) in try/except.",
                practiceSteps: [
                    "Read Learn — study the example for \"try / except / finally\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Shift each letter forward in the alphabet. A→D with shift 3.

HELLO + 3 → KHOOR
""",
                teacherScript: "Encode SOHA with shift 3 on paper first.",
                practiceSteps: [
                    "Read Learn — study the example for \"Caesar cipher on paper\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
A **class** is a blueprint. An **object** is one instance.

`class Dog:` … `buddy = Dog()`
""",
                teacherScript: "Draw: Student has name, grade.",
                practiceSteps: [
                    "Read Learn — study the example for \"Classes & objects\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`__init__` runs when the object is created.
`self` refers to **this** object.
""",
                teacherScript: "Add a grade attribute.",
                practiceSteps: [
                    "Read Learn — study the example for \"__init__ and self\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Objects can hold lists: courses, scores, inventory.
""",
                teacherScript: "Add enroll() that appends to a list.",
                practiceSteps: [
                    "Read Learn — study the example for \"Lists inside objects\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
An **API** lets programs request data over the internet. Many return **JSON** text.
""",
                teacherScript: "Open a JSON example in browser with parent.",
                practiceSteps: [
                    "Read Learn — study the example for \"What is an API?\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`tk.Tk()` opens a window.
`Label` shows text.
`Button` runs a function when clicked.
""",
                teacherScript: "Change window title to your name.",
                practiceSteps: [
                    "Read Learn — study the example for \"Tkinter window basics\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Sketch: city entry, Get Weather button, result label.
""",
                teacherScript: "Draw the layout on paper.",
                practiceSteps: [
                    "Read Learn — study the example for \"Plan the weather app\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`requests.get(url)` fetches a web page or API response.
Run in Terminal after `pip3 install requests`.
""",
                teacherScript: "Print response.status_code.",
                practiceSteps: [
                    "Read Learn — study the example for \"requests.get\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`.json()` turns response text into Python dicts and lists.
""",
                teacherScript: "Print keys of the JSON object.",
                practiceSteps: [
                    "Read Learn — study the example for \"Parse JSON\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Button command calls fetch function; label shows result.
""",
                teacherScript: "Use placeholder until API key added.",
                practiceSteps: [
                    "Read Learn — study the example for \"Wire GUI to API\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Build lists in one line: `[x*2 for x in range(5)]`
""",
                teacherScript: "Make a list of squares 1–5.",
                practiceSteps: [
                    "Read Learn — study the example for \"List comprehensions\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
A table with named columns. `pip3 install pandas`.
""",
                teacherScript: "Print average of score column.",
                practiceSteps: [
                    "Read Learn — study the example for \"Pandas DataFrame\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`.to_csv()` and `pd.read_csv()` persist tables.
""",
                teacherScript: "Save scores.csv and reload.",
                practiceSteps: [
                    "Read Learn — study the example for \"CSV save & load\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`pip3 install matplotlib`. Plot points with `plt.plot`.
""",
                teacherScript: "Change title to your name.",
                practiceSteps: [
                    "Read Learn — study the example for \"Matplotlib first plot\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`xlabel`, `ylabel`, `ylim` make graphs readable.
""",
                teacherScript: "Set y-axis 0–100.",
                practiceSteps: [
                    "Read Learn — study the example for \"Labels and axes\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Ask a question → collect data → visualize → decide.
""",
                teacherScript: "Write one question about your quiz scores.",
                practiceSteps: [
                    "Read Learn — study the example for \"Data science workflow\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Short one-line functions: `lambda x: x * 2`
""",
                teacherScript: "Lambda that adds 10.",
                practiceSteps: [
                    "Read Learn — study the example for \"Lambda functions\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Parameters can have defaults: `def f(name, greeting="Hi"):`
""",
                teacherScript: "Call with and without second arg.",
                practiceSteps: [
                    "Read Learn — study the example for \"Default parameters\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`*args` collects extra positional args.
`**kwargs` collects keyword args.
""",
                teacherScript: "Print args and kwargs in a demo function.",
                practiceSteps: [
                    "Read Learn — study the example for \"*args and **kwargs\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Find patterns in data to predict labels for new examples.
""",
                teacherScript: "Name one feature and one label.",
                practiceSteps: [
                    "Read Learn — study the example for \"What is machine learning?\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`pip3 install scikit-learn`. `model.fit(X, y)` trains.
""",
                teacherScript: "Print training data shapes.",
                practiceSteps: [
                    "Read Learn — study the example for \"scikit-learn basics\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`.predict()` guesses for new data. Rehearse a 90-second demo.
""",
                teacherScript: "from sklearn.tree import DecisionTreeClassifier\nX = [[120, 0.8], [90, 0.5]]\ny = [1, 0]\nm = DecisionTreeClassifier(max_depth=2)\nm.fit(X, y)\nprint(m.predict([[100, 0.6]]))",
                practiceSteps: [
                    "Read Learn — study the example for \"Predict & demo prep\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Weather app, graph project, or music ML — choose one to demo.
""",
                teacherScript: "Write 3 sentences about your project.",
                practiceSteps: [
                    "Read Learn — study the example for \"Pick your showcase project\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Intro (30s) → demo (60s) → lesson learned (30s).
""",
                teacherScript: "Practice out loud twice.",
                practiceSteps: [
                    "Read Learn and sketch or write your plan on paper first.",
                    "Open Playground and replace each placeholder with your own words.",
                    "Run and read the output — does it match your plan?",
                    "Add one more line that is specific to your project.",
                    "Answer the quick check when done.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Back up JSON from Progress tab before presenting.
""",
                teacherScript: "Progress tab → Export.",
                practiceSteps: [
                    "Read Learn — study the example for \"Export progress\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Label, Button, Text — each `.pack()` goes in the window.
""",
                teacherScript: "Add a second label.",
                practiceSteps: [
                    "Read Learn — study the example for \"Tkinter widgets\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`open(path)` reads/writes text files. Use filedialog to pick paths.
""",
                teacherScript: "Save hello.txt from Text widget.",
                practiceSteps: [
                    "Read Learn — study the example for \"File open & save\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Save button writes Text content; Open button loads file.
""",
                teacherScript: "Sketch Open/Save buttons.",
                practiceSteps: [
                    "Read Learn — study the example for \"Connect GUI to files\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
9 squares → list of length 9. Index 0–8 maps to grid.
""",
                teacherScript: "Print board positions.",
                practiceSteps: [
                    "Read Learn — study the example for \"Game board as a list\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Check rows, columns, diagonals for three matching.
""",
                teacherScript: "Test one winning line.",
                practiceSteps: [
                    "Read Learn — study the example for \"Win detection\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`.grid(row=, column=)` places buttons in rows/columns.
""",
                teacherScript: "Make one button print its index.",
                practiceSteps: [
                    "Read Learn — study the example for \"Tkinter button grid\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Reuse shift function from Level 2.
""",
                teacherScript: "Encrypt ABC with shift 1.",
                practiceSteps: [
                    "Read Learn — study the example for \"Caesar shift review\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Entry gets user text. Label shows output.
""",
                teacherScript: "Show entered text in a label.",
                practiceSteps: [
                    "Read Learn — study the example for \"Entry & Label widgets\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Use try/except; show friendly text in Label.
""",
                teacherScript: "Handle invalid shift.",
                practiceSteps: [
                    "Read Learn — study the example for \"Error messages in GUI\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`os.path.join` builds safe paths. `listdir` lists folder contents.
""",
                teacherScript: "List files in current folder.",
                practiceSteps: [
                    "Read Learn — study the example for \"os.listdir & paths\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
A function that calls itself needs a **base case** to stop.
""",
                teacherScript: "Count down recursively.",
                practiceSteps: [
                    "Read Learn — study the example for \"Recursion idea\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Make subfolders per file type — on paper first.
""",
                teacherScript: "print(\"For each file: get extension → move to folder/\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Organize by extension\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
GET request → JSON response → parse in Python.
""",
                teacherScript: "Print one field from sample JSON.",
                practiceSteps: [
                    "Read Learn — study the example for \"HTTP & JSON review\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Fetch a public API or sample endpoint.
""",
                teacherScript: "pip3 install requests",
                practiceSteps: [
                    "Read Learn — study the example for \"requests in practice\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Show fetched data in GUI or print formatted.
""",
                teacherScript: "print(\"Format: City: X, Temp: Y F\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Display in app\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
`json.dump` saves Python data; `json.load` reads it.
""",
                teacherScript: "Save and load a dict.",
                practiceSteps: [
                    "Read Learn — study the example for \"JSON module\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Store score, level, player position in one dict.
""",
                teacherScript: "Design your save dict keys.",
                practiceSteps: [
                    "Read Learn — study the example for \"Game state dict\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
If save file exists, load it; else start fresh.
""",
                teacherScript: "import os\nprint(\"if os.path.exists(save.json): load else new game\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Load on startup\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
while running: handle events → update → draw → flip.
""",
                teacherScript: "List the four steps.",
                practiceSteps: [
                    "Read Learn — study the example for \"pygame loop review\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

# YOUR TURN: print("1. events 2. update 3. draw 4. flip")
""",
                                codeTests: [
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
Rectangles check overlap with `.colliderect`.
""",
                teacherScript: "Draw two rects in pygame.",
                practiceSteps: [
                    "Read Learn — study the example for \"Sprites & collision\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Sound, score, game over screen.
""",
                teacherScript: "print(\"Polish: sound effect on coin, score label, restart\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Polish checklist\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Move helpers to `utils.py` and `import utils`.
""",
                teacherScript: "Plan two files for your project.",
                practiceSteps: [
                    "Read Learn — study the example for \"Split into modules\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Player class, Coin class — each knows how to draw/update.
""",
                teacherScript: "Sketch Player attributes.",
                practiceSteps: [
                    "Read Learn — study the example for \"Class per game object\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Pick one messy function; move to a class method.
""",
                teacherScript: "print(\"Before: one big file. After: classes + small functions.\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Refactor one feature\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
MVP = smallest version that works. Extras come later.
""",
                teacherScript: "Write 3 milestones.",
                practiceSteps: [
                    "Read Learn — study the example for \"Capstone planning\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
One page: goal, features, file list.
""",
                teacherScript: "Bullet your features.",
                practiceSteps: [
                    "Read Learn — study the example for \"Design doc\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Get one feature running end-to-end today.
""",
                teacherScript: "print(\"Today: one working feature, no extras\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Start MVP\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
2 minutes: intro, live demo, one bug you fixed.
""",
                teacherScript: "Practice twice.",
                practiceSteps: [
                    "Read Learn — study the example for \"Demo rehearsal\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Write one thing to improve and one win.
""",
                teacherScript: "print(\"Win:\")\nprint(\"Improve:\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Peer feedback notes\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w30-l3",
                title: "Level 3 graduation",
                body: """
Export progress; screenshot best project.
""",
                teacherScript: "print(\"Level 3 complete!\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Level 3 graduation\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Procedural: step-by-step. OOP: objects. Functional: map/filter on data.
""",
                teacherScript: "Name the three styles.",
                practiceSteps: [
                    "Read Learn — study the example for \"Three paradigms\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
add, subtract as plain functions.
""",
                teacherScript: "Add multiply.",
                practiceSteps: [
                    "Read Learn — study the example for \"Calculator with functions\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Calculator class holds history list.
""",
                teacherScript: "Add history.append each op.",
                practiceSteps: [
                    "Read Learn — study the example for \"Same calc with a class\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Each room has name, description, exits dict.
""",
                teacherScript: "Draw 3 rooms on paper.",
                practiceSteps: [
                    "Read Learn — study the example for \"Room class\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`room.exits["north"] = other_room`
""",
                teacherScript: "Connect two rooms.",
                practiceSteps: [
                    "Read Learn — study the example for \"Linking rooms\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Print description; read command; move if valid.
""",
                teacherScript: "print(\"> look — print room desc\")\nprint(\"> go north — if exit exists\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Game loop for adventure\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
`map(fn, list)` transforms each item.
`filter(fn, list)` keeps items where fn is True.
""",
                teacherScript: "Double a list with map.",
                practiceSteps: [
                    "Read Learn — study the example for \"map & filter\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`functools.reduce` combines list to one value.
""",
                teacherScript: "Sum with reduce.",
                practiceSteps: [
                    "Read Learn — study the example for \"reduce\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Read → filter → map → print.
""",
                teacherScript: "data = [1,2,3,4,5,6]\nevens = filter(lambda x: x%2==0, data)\nprint(list(map(lambda x: x*10, evens)))",
                practiceSteps: [
                    "Read Learn — study the example for \"Pipeline\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Compare neighbors; swap if wrong order; repeat.
""",
                teacherScript: "Sort [3,1,2] on paper.",
                practiceSteps: [
                    "Read Learn — study the example for \"Bubble sort idea\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Works on **sorted** list. Cut search space in half.
""",
                teacherScript: "Search for 7 in sorted list.",
                practiceSteps: [
                    "Read Learn — study the example for \"Binary search\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Nested loops → slower on big data. Binary search is faster.
""",
                teacherScript: "print(\"Bubble: check many pairs\")\nprint(\"Binary: halve each step\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Big-O intuition\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
grid[row][col] — 0 often means open, 1 wall.
""",
                teacherScript: "Make a 5x5 grid of zeros.",
                practiceSteps: [
                    "Read Learn — study the example for \"Grid as 2D list\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Explore neighbors layer by layer — shortest path in unweighted grid.
""",
                teacherScript: "Mark visited cells.",
                practiceSteps: [
                    "Read Learn — study the example for \"BFS idea\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Trace BFS from start to goal on a small maze.
""",
                teacherScript: "print(\"Maze: S=start, G=goal, #=wall\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Implement on paper\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Never test on training data only — hold out some rows.
""",
                teacherScript: "Split 80/20 on paper.",
                practiceSteps: [
                    "Read Learn — study the example for \"Train/test split\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
X = inputs, y = what you predict.
""",
                teacherScript: "Name 2 features for quiz prediction.",
                practiceSteps: [
                    "Read Learn — study the example for \"Features & labels\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`score` method on held-out test set.
""",
                teacherScript: "# pip3 install scikit-learn\nfrom sklearn.neighbors import KNeighborsClassifier\nX=[[1],[2],[3],[10]]\ny=[0,0,1,1]\nm=KNeighborsClassifier(n_neighbors=1)\nm.fit(X[:3], y[:3])\nprint(m.score(X[3:], y[3:]))",
                practiceSteps: [
                    "Read Learn — study the example for \"Accuracy\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Show prediction label and confidence in GUI.
""",
                teacherScript: "Sketch layout.",
                practiceSteps: [
                    "Read Learn — study the example for \"Tkinter for results\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

import tkinter as tk
root=tk.Tk()
tk.Label(root,text="Prediction:").pack()
# YOUR TURN: tk.Label(root,text="(run model)").pack()
root.mainloop()
""",
                                codeTests: [
                    CodeTest(
                        id: "w37-l1-imports-a-module",
                        label: "Imports a module",
                        assertionScript: """
                        assert "import " in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w37-l1-uses-tkinter",
                        label: "Uses Tkinter",
                        assertionScript: """
                        assert "tk." in user_code
                        """,
                        inspectSourceOnly: true
                    ),
                ],
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l2",
                title: "Wire predict button",
                body: """
Button runs model.predict on entry features.
""",
                teacherScript: "print(\"on_click: read inputs → predict → update label\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Wire predict button\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l3",
                title: "UX polish",
                body: """
Clear errors, disable button while loading.
""",
                teacherScript: "print(\"Show Loading... while fetching\")",
                practiceSteps: [
                    "Read Learn — study the example for \"UX polish\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Combine requests + pandas.
""",
                teacherScript: "pip3 install pandas requests",
                practiceSteps: [
                    "Read Learn — study the example for \"Fetch weather CSV/API\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
`df.groupby("city")["temp"].mean()`
""",
                teacherScript: "Group sample data.",
                practiceSteps: [
                    "Read Learn — study the example for \"groupby\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Bar chart of averages.
""",
                teacherScript: "print(\"plt.bar(cities, avg_temps)\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Plot grouped data\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Goal, milestones, files, risks.
""",
                teacherScript: "Fill one-page plan.",
                practiceSteps: [
                    "Read Learn — study the example for \"Project plan doc\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
Readable names, no giant functions, comments on tricky parts.
""",
                teacherScript: "print(\"[ ] Names clear\")\nprint(\"[ ] One job per function\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Code review checklist\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w39-l3",
                title: "Start coding MVP",
                body: """
First commit: one file that runs.
""",
                teacherScript: "print(\"Today: skeleton + one feature\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Start coding MVP\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
How to run, what it does, screenshot.
""",
                teacherScript: "Outline README sections.",
                practiceSteps: [
                    "Read Learn — study the example for \"README draft\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
2 min, backup recording, thank you.
""",
                teacherScript: "print(\"[ ] README done\")\nprint(\"[ ] Demo rehearsed\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Professional demo\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w40-l3",
                title: "Level 4 session graduation",
                body: """
Celebrate portfolio + capstone.
""",
                teacherScript: "print(\"Level 4 session track complete!\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Level 4 session graduation\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
History, error on divide by zero, two styles.
""",
                teacherScript: "List must-have features.",
                practiceSteps: [
                    "Read Learn — study the example for \"Calculator requirements\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """
# Read the steps in Learn, then complete below.

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
try/except ZeroDivisionError.
""",
                teacherScript: "try:\n    print(10/0)\nexcept ZeroDivisionError:\n    print(\"Cannot divide by zero\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Error handling\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w41-l3",
                title: "Build history log",
                body: """
Append each operation string.
""",
                teacherScript: "history = []\ndef log(op):\n    history.append(op)\nlog(\"2+2=4\")\nprint(history)",
                practiceSteps: [
                    "Read Learn — study the example for \"Build history log\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Serialize rooms, inventory, location.
""",
                teacherScript: "import json\nstate={\"room\":\"hall\",\"inventory\":[]}\nprint(json.dumps(state))",
                practiceSteps: [
                    "Read Learn — study the example for \"Save game JSON\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l2",
                title: "Load game JSON",
                body: """
Restore from file on start.
""",
                teacherScript: "print(\"if save.json: load else new game\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Load game JSON\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l3",
                title: "Inventory commands",
                body: """
take, use, look — parse user input.
""",
                teacherScript: "print(\"> take key — add to inventory\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Inventory commands\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Print array before/after each bubble pass.
""",
                teacherScript: "arr=[3,1,2]\nprint(\"Before:\", arr)\n# one pass bubble\nprint(\"After pass:\", sorted(arr))",
                practiceSteps: [
                    "Read Learn — study the example for \"Visualize one swap\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l2",
                title: "Step counter",
                body: """
Count comparisons for performance talk.
""",
                teacherScript: "comparisons = 0\nprint(\"Track comparisons each loop\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Step counter\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l3",
                title: "matplotlib bars optional",
                body: """
Show array state as bar heights.
""",
                teacherScript: "print(\"Optional: plt.bar(range(n), arr)\")",
                practiceSteps: [
                    "Read Learn — study the example for \"matplotlib bars optional\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Read 2D list from file or literal.
""",
                teacherScript: "maze = [[\"S\",\".\",\".\"],[\"#\",\".\",\".\"],[\".\",\".\",\"G\"]]\nprint(maze)",
                practiceSteps: [
                    "Read Learn — study the example for \"Parse maze grid\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l2",
                title: "BFS queue code",
                body: """
collections.deque for queue.
""",
                teacherScript: "from collections import deque\nq = deque([(0,0)])\nprint(q.popleft())",
                practiceSteps: [
                    "Read Learn — study the example for \"BFS queue code\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l3",
                title: "Reconstruct path",
                body: """
Parent map from BFS.
""",
                teacherScript: "print(\"parent[(r,c)] = where we came from\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Reconstruct path\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
temp, humidity as ML inputs.
""",
                teacherScript: "print(\"Features: temp, humidity\")\nprint(\"Label: rain tomorrow?\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Weather features\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l2",
                title: "Train simple model",
                body: """
fit on CSV sample.
""",
                teacherScript: "# pip3 install scikit-learn pandas\nprint(\"df = pd.read_csv(...); model.fit(X,y)\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Train simple model\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l3",
                title: "Evaluate & report",
                body: """
Print accuracy or confusion.
""",
                teacherScript: "print(\"print(f Accuracy: {score:.0%}\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Evaluate & report\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
grid or pack sections: header, stats, buttons.
""",
                teacherScript: "import tkinter as tk\nroot=tk.Tk()\ntk.Label(root,text=\"Dashboard\").pack()\nroot.mainloop()",
                practiceSteps: [
                    "Read Learn — study the example for \"Dashboard layout\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l2",
                title: "Bind events",
                body: """
Buttons refresh displayed data.
""",
                teacherScript: "print(\"Refresh button updates labels\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Bind events\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l3",
                title: "Consistent styling",
                body: """
Same font, padding, colors.
""",
                teacherScript: "print(\"Pick 2 colors + one font\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Consistent styling\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Pick strengths for final capstone.
""",
                teacherScript: "print(\"Best project so far:\")\nprint(\"Skill to showcase:\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Review 6 projects\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l2",
                title: "Design doc template",
                body: """
Problem, users, features, timeline.
""",
                teacherScript: "print(\"Final project title:\")\nprint(\"4-week timeline:\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Design doc template\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l3",
                title: "Choose capstone track",
                body: """
Game / Data / Algorithm viz.
""",
                teacherScript: "print(\"Track: Game / Data / Algo\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Choose capstone track\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
One core feature working E2E.
""",
                teacherScript: "print(\"Sprint 1 = MVP feature only\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Sprint 1 goal\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l2",
                title: "Debug systematically",
                body: """
Print debug, read traceback, fix one error.
""",
                teacherScript: "print(\"1. Reproduce 2. Read error 3. Fix 4. Re-test\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Debug systematically\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l3",
                title: "Commit milestone",
                body: """
Tag what works today.
""",
                teacherScript: "print(\"Milestone: core feature runs\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Commit milestone\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
Install, run, screenshot.
""",
                teacherScript: "print(\"## Install\")\nprint(\"pip3 install ...\")\nprint(\"python3 main.py\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Write README\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l2",
                title: "Manual test checklist",
                body: """
Every button, edge case.
""",
                teacherScript: "print(\"[ ] Happy path\")\nprint(\"[ ] Bad input\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Manual test checklist\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l3",
                title: "Code cleanup",
                body: """
Remove print debug, rename vars.
""",
                teacherScript: "print(\"Delete TODO debug prints\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Code cleanup\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
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
2 min demo + Q&A.
""",
                teacherScript: "print(\"[ ] Demo ready\")\nprint(\"[ ] README link\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Final presentation\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l2",
                title: "Portfolio folder",
                body: """
Screenshots + exported JSON.
""",
                teacherScript: "print(\"Folder: best 4 projects\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Portfolio folder\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l3",
                title: "Graduation!",
                body: """
Level 4 portfolio complete.
""",
                teacherScript: "print(\"Congratulations, Soha!\")",
                practiceSteps: [
                    "Read Learn — study the example for \"Graduation!\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Change one value or line, predict the output, then Run again.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
                starterCode: """

"""
            ),
    ]

}
