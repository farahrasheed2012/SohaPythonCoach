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
                starterCode: """
score = 85
if score >= 90:
    print("A")
elif score >= 80:
    print("B")
else:
    print("C")
""",
                challengeQuestion: "Which keyword adds another test after if?",
                challengeAnswer: "elif"
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
                starterCode: """
def greet(name):
    print("Hello,", name)

greet("Soha")
""",
                challengeQuestion: "What keyword starts a function?",
                challengeAnswer: "def"
            ),
            CurriculumSeed.teachingLesson(
                id: "w11-l3",
                title: "Loops refresher",
                body: """
`for item in collection:` visits each item.

`while condition:` repeats until the condition is False.
""",
                teacherScript: "Write a loop that prints 1,2,3.",
                starterCode: """
for n in range(1, 4):
    print(n)
""",
                challengeQuestion: "How many times does range(1, 4) run?",
                challengeAnswer: "3"
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
                starterCode: """
print("Before")
# int("not a number")  # uncomment to see traceback
print("After")
"""
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
                starterCode: """
try:
    x = int("42")
    print(x + 1)
except ValueError:
    print("Not a number!")
finally:
    print("Done.")
""",
                challengeQuestion: "Which keyword handles errors?",
                challengeAnswer: "except"
            ),
            CurriculumSeed.teachingLesson(
                id: "w12-l3",
                title: "Caesar cipher on paper",
                body: """
Shift each letter forward in the alphabet. A→D with shift 3.

HELLO + 3 → KHOOR
""",
                teacherScript: "Encode SOHA with shift 3 on paper first.",
                starterCode: """
def shift_letter(ch, n):
    if not ch.isalpha():
        return ch
    base = ord("A") if ch.isupper() else ord("a")
    return chr((ord(ch) - base + n) % 26 + base)

print(shift_letter("A", 3))
""",
                challengeQuestion: "What does % 26 do in a cipher?",
                challengeAnswer: "wrap"
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
                starterCode: """
class Dog:
    def __init__(self, name):
        self.name = name
    def speak(self):
        print(self.name, "says woof!")

d = Dog("Buddy")
d.speak()
""",
                challengeQuestion: "What creates an object from a class?",
                challengeAnswer: "class"
            ),
            CurriculumSeed.teachingLesson(
                id: "w13-l2",
                title: "__init__ and self",
                body: """
`__init__` runs when the object is created.
`self` refers to **this** object.
""",
                teacherScript: "Add a grade attribute.",
                starterCode: """
class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

s = Student("Soha", 7)
print(s.name, s.grade)
""",
                challengeQuestion: "What method runs on creation?",
                challengeAnswer: "__init__"
            ),
            CurriculumSeed.teachingLesson(
                id: "w13-l3",
                title: "Lists inside objects",
                body: """
Objects can hold lists: courses, scores, inventory.
""",
                teacherScript: "Add enroll() that appends to a list.",
                starterCode: """
class Student:
    def __init__(self, name):
        self.name = name
        self.courses = []
    def enroll(self, course):
        self.courses.append(course)

s = Student("Soha")
s.enroll("Python")
print(s.courses)
"""
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
                starterCode: """
import json
data = {"city": "Houston", "temp": 72}
print(json.dumps(data, indent=2))
""",
                challengeQuestion: "What format do APIs often use?",
                challengeAnswer: "JSON"
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
                starterCode: """
import tkinter as tk
root = tk.Tk()
root.title("Hello GUI")
tk.Label(root, text="Hi Soha!").pack()
tk.Button(root, text="Click me", command=lambda: print("Clicked!")).pack()
root.mainloop()
""",
                challengeQuestion: "Which library makes GUI windows?",
                challengeAnswer: "tkinter"
            ),
            CurriculumSeed.teachingLesson(
                id: "w14-l3",
                title: "Plan the weather app",
                body: """
Sketch: city entry, Get Weather button, result label.
""",
                teacherScript: "Draw the layout on paper.",
                starterCode: """
print("Weather app plan:")
print("1. Entry for city")
print("2. Button to fetch")
print("3. Label for temp + conditions")
"""
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
                starterCode: """
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/get")
print(r.status_code)
print(r.json())
""",
                challengeQuestion: "What method fetches data?",
                challengeAnswer: "GET"
            ),
            CurriculumSeed.teachingLesson(
                id: "w15-l2",
                title: "Parse JSON",
                body: """
`.json()` turns response text into Python dicts and lists.
""",
                teacherScript: "Print keys of the JSON object.",
                starterCode: """
data = {"main": {"temp": 72}, "weather": [{"description": "clear"}]}
print("Temp:", data["main"]["temp"])
""",
                challengeQuestion: "How do you access dict values?",
                challengeAnswer: "brackets"
            ),
            CurriculumSeed.teachingLesson(
                id: "w15-l3",
                title: "Wire GUI to API",
                body: """
Button command calls fetch function; label shows result.
""",
                teacherScript: "Use placeholder until API key added.",
                starterCode: """
print("Connect fetch_weather() to your Tkinter button.")
"""
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
                starterCode: """
squares = [n*n for n in range(1, 6)]
print(squares)
""",
                challengeQuestion: "What keyword builds a list inline?",
                challengeAnswer: "for"
            ),
            CurriculumSeed.teachingLesson(
                id: "w16-l2",
                title: "Pandas DataFrame",
                body: """
A table with named columns. `pip3 install pandas`.
""",
                teacherScript: "Print average of score column.",
                starterCode: """
# pip3 install pandas
import pandas as pd
df = pd.DataFrame({"name": ["Soha"], "score": [92]})
print(df)
""",
                challengeQuestion: "What library uses DataFrame?",
                challengeAnswer: "pandas"
            ),
            CurriculumSeed.teachingLesson(
                id: "w16-l3",
                title: "CSV save & load",
                body: """
`.to_csv()` and `pd.read_csv()` persist tables.
""",
                teacherScript: "Save scores.csv and reload.",
                starterCode: """
import pandas as pd
df = pd.DataFrame({"week": [1,2], "score": [80,90]})
df.to_csv("scores.csv", index=False)
print(pd.read_csv("scores.csv"))
""",
                challengeQuestion: "What file format stores tables?",
                challengeAnswer: "CSV"
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
                starterCode: """
# pip3 install matplotlib
import matplotlib.pyplot as plt
plt.plot([1,2,3], [70,85,90], marker="o")
plt.title("My Scores")
plt.show()
""",
                challengeQuestion: "Which library draws graphs?",
                challengeAnswer: "matplotlib"
            ),
            CurriculumSeed.teachingLesson(
                id: "w17-l2",
                title: "Labels and axes",
                body: """
`xlabel`, `ylabel`, `ylim` make graphs readable.
""",
                teacherScript: "Set y-axis 0–100.",
                starterCode: """
import matplotlib.pyplot as plt
weeks = [1,2,3]
scores = [72, 88, 91]
plt.plot(weeks, scores, marker="o")
plt.xlabel("Week")
plt.ylabel("Score")
plt.ylim(0, 100)
plt.show()
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w17-l3",
                title: "Data science workflow",
                body: """
Ask a question → collect data → visualize → decide.
""",
                teacherScript: "Write one question about your quiz scores.",
                starterCode: """
print("Question: Are my scores improving?")
print("Data: weekly quiz scores")
print("Chart: line plot")
print("Decision: keep studying weak topics")
""",
                challengeQuestion: "First step in data science?",
                challengeAnswer: "ask questions"
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
                starterCode: """
double = lambda x: x * 2
print(double(7))
""",
                challengeQuestion: "What keyword makes a lambda?",
                challengeAnswer: "lambda"
            ),
            CurriculumSeed.teachingLesson(
                id: "w18-l2",
                title: "Default parameters",
                body: """
Parameters can have defaults: `def f(name, greeting="Hi"):`
""",
                teacherScript: "Call with and without second arg.",
                starterCode: """
def greet(name, msg="Hello"):
    print(msg + ",", name)

greet("Soha")
greet("Soha", "Hi")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w18-l3",
                title: "*args and **kwargs",
                body: """
`*args` collects extra positional args.
`**kwargs` collects keyword args.
""",
                teacherScript: "Print args and kwargs in a demo function.",
                starterCode: """
def demo(*args, **kwargs):
    print("args:", args)
    print("kwargs:", kwargs)

demo(1, 2, topic="Python")
""",
                challengeQuestion: "What collects keyword args?",
                challengeAnswer: "**kwargs"
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
                starterCode: """
print("Features: tempo, energy")
print("Label: genre (pop/rock)")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w19-l2",
                title: "scikit-learn basics",
                body: """
`pip3 install scikit-learn`. `model.fit(X, y)` trains.
""",
                teacherScript: "Print training data shapes.",
                starterCode: """
# pip3 install scikit-learn
from sklearn.tree import DecisionTreeClassifier
X = [[1, 0], [0, 1]]
y = [0, 1]
m = DecisionTreeClassifier()
m.fit(X, y)
print("Trained!")
""",
                challengeQuestion: "What method trains the model?",
                challengeAnswer: "fit"
            ),
            CurriculumSeed.teachingLesson(
                id: "w19-l3",
                title: "Predict & demo prep",
                body: """
`.predict()` guesses for new data. Rehearse a 90-second demo.
""",
                teacherScript: "from sklearn.tree import DecisionTreeClassifier\nX = [[120, 0.8], [90, 0.5]]\ny = [1, 0]\nm = DecisionTreeClassifier(max_depth=2)\nm.fit(X, y)\nprint(m.predict([[100, 0.6]]))",
                starterCode: """
None
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
                starterCode: """
print("My project:")
print("Problem it solves:")
print("Coolest feature:")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w20-l2",
                title: "Rehearse the demo",
                body: """
Intro (30s) → demo (60s) → lesson learned (30s).
""",
                teacherScript: "Practice out loud twice.",
                starterCode: """
print("Demo checklist:")
print("[ ] Opens without errors")
print("[ ] Shows main feature")
print("[ ] I explain one line of code")
""",
                challengeQuestion: "How long is the demo?",
                challengeAnswer: "2 minutes"
            ),
            CurriculumSeed.teachingLesson(
                id: "w20-l3",
                title: "Export progress",
                body: """
Back up JSON from Progress tab before presenting.
""",
                teacherScript: "Progress tab → Export.",
                starterCode: """
print("Level 2 complete! Skills: OOP, APIs, pandas, ML")
"""
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
                starterCode: """
import tkinter as tk
root = tk.Tk()
tk.Label(root, text="Editor").pack()
text = tk.Text(root, height=10, width=40)
text.pack()
root.mainloop()
""",
                challengeQuestion: "Which widget holds multiple lines?",
                challengeAnswer: "Text"
            ),
            CurriculumSeed.teachingLesson(
                id: "w21-l2",
                title: "File open & save",
                body: """
`open(path)` reads/writes text files. Use filedialog to pick paths.
""",
                teacherScript: "Save hello.txt from Text widget.",
                starterCode: """
with open("hello.txt", "w") as f:
    f.write("Hello from Soha!")
with open("hello.txt") as f:
    print(f.read())
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w21-l3",
                title: "Connect GUI to files",
                body: """
Save button writes Text content; Open button loads file.
""",
                teacherScript: "Sketch Open/Save buttons.",
                starterCode: """
print("open_file() reads into Text")
print("save_file() writes from Text")
"""
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
                starterCode: """
board = ["X", "", "O", "", "X", "", "", "", "O"]
for i, cell in enumerate(board):
    print(i, cell)
""",
                challengeQuestion: "How many squares on the board?",
                challengeAnswer: "9"
            ),
            CurriculumSeed.teachingLesson(
                id: "w22-l2",
                title: "Win detection",
                body: """
Check rows, columns, diagonals for three matching.
""",
                teacherScript: "Test one winning line.",
                starterCode: """
wins = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
board = ["X"]*3 + [""]*6
print(any(board[a]==board[b]==board[c]!="" for a,b,c in wins))
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w22-l3",
                title: "Tkinter button grid",
                body: """
`.grid(row=, column=)` places buttons in rows/columns.
""",
                teacherScript: "Make one button print its index.",
                starterCode: """
import tkinter as tk
root = tk.Tk()
for i in range(9):
    tk.Button(root, text=str(i), width=4).grid(row=i//3, column=i%3)
root.mainloop()
"""
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
                starterCode: """
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
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w23-l2",
                title: "Entry & Label widgets",
                body: """
Entry gets user text. Label shows output.
""",
                teacherScript: "Show entered text in a label.",
                starterCode: """
import tkinter as tk
root = tk.Tk()
e = tk.Entry(root)
e.pack()
l = tk.Label(root, text="")
l.pack()
tk.Button(root, text="Show", command=lambda: l.config(text=e.get())).pack()
root.mainloop()
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w23-l3",
                title: "Error messages in GUI",
                body: """
Use try/except; show friendly text in Label.
""",
                teacherScript: "Handle invalid shift.",
                starterCode: """
print("except ValueError: show Please enter a number")
"""
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
                starterCode: """
import os
for name in os.listdir("."):
    print(name)
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w24-l2",
                title: "Recursion idea",
                body: """
A function that calls itself needs a **base case** to stop.
""",
                teacherScript: "Count down recursively.",
                starterCode: """
def countdown(n):
    if n <= 0:
        print("Done!")
        return
    print(n)
    countdown(n-1)

countdown(3)
""",
                challengeQuestion: "What stops recursion?",
                challengeAnswer: "base case"
            ),
            CurriculumSeed.teachingLesson(
                id: "w24-l3",
                title: "Organize by extension",
                body: """
Make subfolders per file type — on paper first.
""",
                teacherScript: "print(\"For each file: get extension → move to folder/\")",
                starterCode: """
None
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
                starterCode: """
import json
sample = '{"temp": 72, "city": "Houston"}'
data = json.loads(sample)
print(data["city"], data["temp"])
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w25-l2",
                title: "requests in practice",
                body: """
Fetch a public API or sample endpoint.
""",
                teacherScript: "pip3 install requests",
                starterCode: """
# pip3 install requests
import requests
r = requests.get("https://httpbin.org/json")
print(r.json())
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w25-l3",
                title: "Display in app",
                body: """
Show fetched data in GUI or print formatted.
""",
                teacherScript: "print(\"Format: City: X, Temp: Y F\")",
                starterCode: """
None
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
                starterCode: """
import json
data = {"score": 10, "level": 2}
with open("save.json", "w") as f:
    json.dump(data, f)
with open("save.json") as f:
    print(json.load(f))
""",
                challengeQuestion: "Which module handles JSON?",
                challengeAnswer: "json"
            ),
            CurriculumSeed.teachingLesson(
                id: "w26-l2",
                title: "Game state dict",
                body: """
Store score, level, player position in one dict.
""",
                teacherScript: "Design your save dict keys.",
                starterCode: """
state = {"score": 0, "coins": 3, "x": 100, "y": 200}
print(state)
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w26-l3",
                title: "Load on startup",
                body: """
If save file exists, load it; else start fresh.
""",
                teacherScript: "import os\nprint(\"if os.path.exists(save.json): load else new game\")",
                starterCode: """
None
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
                starterCode: """
print("1. events 2. update 3. draw 4. flip")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w27-l2",
                title: "Sprites & collision",
                body: """
Rectangles check overlap with `.colliderect`.
""",
                teacherScript: "Draw two rects in pygame.",
                starterCode: """
import pygame
pygame.init()
s = pygame.display.set_mode((200,100))
pygame.draw.rect(s,(255,0,0),(10,10,30,30))
pygame.draw.rect(s,(0,255,0),(35,10,30,30))
pygame.display.flip()
input("Enter")
pygame.quit()
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w27-l3",
                title: "Polish checklist",
                body: """
Sound, score, game over screen.
""",
                teacherScript: "print(\"Polish: sound effect on coin, score label, restart\")",
                starterCode: """
None
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
                starterCode: """
print("game.py — main loop")
print("models.py — Player, Coin classes")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w28-l2",
                title: "Class per game object",
                body: """
Player class, Coin class — each knows how to draw/update.
""",
                teacherScript: "Sketch Player attributes.",
                starterCode: """
class Player:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def move(self, dx, dy):
        self.x += dx
        self.y += dy
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w28-l3",
                title: "Refactor one feature",
                body: """
Pick one messy function; move to a class method.
""",
                teacherScript: "print(\"Before: one big file. After: classes + small functions.\")",
                starterCode: """
None
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
                starterCode: """
print("Milestone 1: core feature")
print("Milestone 2: save/load")
print("Milestone 3: polish UI")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w29-l2",
                title: "Design doc",
                body: """
One page: goal, features, file list.
""",
                teacherScript: "Bullet your features.",
                starterCode: """
print("Project title:")
print("Must have:")
print("Nice to have:")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w29-l3",
                title: "Start MVP",
                body: """
Get one feature running end-to-end today.
""",
                teacherScript: "print(\"Today: one working feature, no extras\")",
                starterCode: """
None
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
                starterCode: """
print("[ ] Demo rehearsed")
print("[ ] Backup screen recording")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w30-l2",
                title: "Peer feedback notes",
                body: """
Write one thing to improve and one win.
""",
                teacherScript: "print(\"Win:\")\nprint(\"Improve:\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w30-l3",
                title: "Level 3 graduation",
                body: """
Export progress; screenshot best project.
""",
                teacherScript: "print(\"Level 3 complete!\")",
                starterCode: """
None
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
                starterCode: """
print("Procedural: functions in order")
print("OOP: classes")
print("Functional: map/filter")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w31-l2",
                title: "Calculator with functions",
                body: """
add, subtract as plain functions.
""",
                teacherScript: "Add multiply.",
                starterCode: """
def add(a,b): return a+b
def sub(a,b): return a-b
print(add(5,3))
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w31-l3",
                title: "Same calc with a class",
                body: """
Calculator class holds history list.
""",
                teacherScript: "Add history.append each op.",
                starterCode: """
class Calc:
    def __init__(self):
        self.history = []
    def add(self,a,b):
        r=a+b
        self.history.append(f"{a}+{b}={r}")
        return r
"""
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
                starterCode: """
class Room:
    def __init__(self, name, desc):
        self.name = name
        self.desc = desc
        self.exits = {}

kitchen = Room("Kitchen", "A small kitchen.")
print(kitchen.desc)
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w32-l2",
                title: "Linking rooms",
                body: """
`room.exits["north"] = other_room`
""",
                teacherScript: "Connect two rooms.",
                starterCode: """
class Room:
    def __init__(self, name):
        self.name = name
        self.exits = {}
a = Room("Hall")
b = Room("Garden")
a.exits["south"] = b
print(a.exits["south"].name)
""",
                challengeQuestion: "What connects rooms?",
                challengeAnswer: "exits"
            ),
            CurriculumSeed.teachingLesson(
                id: "w32-l3",
                title: "Game loop for adventure",
                body: """
Print description; read command; move if valid.
""",
                teacherScript: "print(\"> look — print room desc\")\nprint(\"> go north — if exit exists\")",
                starterCode: """
None
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
                starterCode: """
nums = [1,2,3,4]
print(list(map(lambda x: x*2, nums)))
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w33-l2",
                title: "reduce",
                body: """
`functools.reduce` combines list to one value.
""",
                teacherScript: "Sum with reduce.",
                starterCode: """
from functools import reduce
print(reduce(lambda a,b: a+b, [1,2,3,4]))
""",
                challengeQuestion: "Which function combines to one value?",
                challengeAnswer: "reduce"
            ),
            CurriculumSeed.teachingLesson(
                id: "w33-l3",
                title: "Pipeline",
                body: """
Read → filter → map → print.
""",
                teacherScript: "data = [1,2,3,4,5,6]\nevens = filter(lambda x: x%2==0, data)\nprint(list(map(lambda x: x*10, evens)))",
                starterCode: """
None
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
                starterCode: """
arr = [3,1,2]
for i in range(len(arr)):
    for j in range(len(arr)-1-i):
        if arr[j] > arr[j+1]:
            arr[j], arr[j+1] = arr[j+1], arr[j]
print(arr)
""",
                challengeQuestion: "Which sort compares neighbors?",
                challengeAnswer: "bubble sort"
            ),
            CurriculumSeed.teachingLesson(
                id: "w34-l2",
                title: "Binary search",
                body: """
Works on **sorted** list. Cut search space in half.
""",
                teacherScript: "Search for 7 in sorted list.",
                starterCode: """
def binary_search(arr, target):
    lo, hi = 0, len(arr)-1
    while lo <= hi:
        mid = (lo+hi)//2
        if arr[mid] == target: return mid
        if arr[mid] < target: lo = mid+1
        else: hi = mid-1
    return -1
print(binary_search([1,3,5,7,9], 7))
""",
                challengeQuestion: "Requires sorted list?",
                challengeAnswer: "binary search"
            ),
            CurriculumSeed.teachingLesson(
                id: "w34-l3",
                title: "Big-O intuition",
                body: """
Nested loops → slower on big data. Binary search is faster.
""",
                teacherScript: "print(\"Bubble: check many pairs\")\nprint(\"Binary: halve each step\")",
                starterCode: """
None
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
                starterCode: """
grid = [[0]*5 for _ in range(5)]
grid[2][2] = 1
print(grid[2])
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w35-l2",
                title: "BFS idea",
                body: """
Explore neighbors layer by layer — shortest path in unweighted grid.
""",
                teacherScript: "Mark visited cells.",
                starterCode: """
print("Queue: start cell")
print("Add unvisited neighbors")
print("Stop at goal")
""",
                challengeQuestion: "Shortest path algorithm?",
                challengeAnswer: "BFS"
            ),
            CurriculumSeed.teachingLesson(
                id: "w35-l3",
                title: "Implement on paper",
                body: """
Trace BFS from start to goal on a small maze.
""",
                teacherScript: "print(\"Maze: S=start, G=goal, #=wall\")",
                starterCode: """
None
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
                starterCode: """
print("Train: learn patterns")
print("Test: check on new data")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w36-l2",
                title: "Features & labels",
                body: """
X = inputs, y = what you predict.
""",
                teacherScript: "Name 2 features for quiz prediction.",
                starterCode: """
X = [[5, 1], [10, 0]]  # word count, question mark
y = [0, 1]  # subject
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w36-l3",
                title: "Accuracy",
                body: """
`score` method on held-out test set.
""",
                teacherScript: "# pip3 install scikit-learn\nfrom sklearn.neighbors import KNeighborsClassifier\nX=[[1],[2],[3],[10]]\ny=[0,0,1,1]\nm=KNeighborsClassifier(n_neighbors=1)\nm.fit(X[:3], y[:3])\nprint(m.score(X[3:], y[3:]))",
                starterCode: """
None
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
                starterCode: """
import tkinter as tk
root=tk.Tk()
tk.Label(root,text="Prediction:").pack()
tk.Label(root,text="(run model)").pack()
root.mainloop()
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l2",
                title: "Wire predict button",
                body: """
Button runs model.predict on entry features.
""",
                teacherScript: "print(\"on_click: read inputs → predict → update label\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w37-l3",
                title: "UX polish",
                body: """
Clear errors, disable button while loading.
""",
                teacherScript: "print(\"Show Loading... while fetching\")",
                starterCode: """
None
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
                starterCode: """
import pandas as pd
df = pd.DataFrame({"city":["Houston"],"temp":[72]})
print(df)
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w38-l2",
                title: "groupby",
                body: """
`df.groupby("city")["temp"].mean()`
""",
                teacherScript: "Group sample data.",
                starterCode: """
import pandas as pd
df=pd.DataFrame({"city":["H","H","D"],"temp":[70,75,80]})
print(df.groupby("city")["temp"].mean())
""",
                challengeQuestion: "pandas group rows?",
                challengeAnswer: "groupby"
            ),
            CurriculumSeed.teachingLesson(
                id: "w38-l3",
                title: "Plot grouped data",
                body: """
Bar chart of averages.
""",
                teacherScript: "print(\"plt.bar(cities, avg_temps)\")",
                starterCode: """
None
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
                starterCode: """
print("Capstone title:")
print("Week 1 milestone:")
print("Week 2 milestone:")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w39-l2",
                title: "Code review checklist",
                body: """
Readable names, no giant functions, comments on tricky parts.
""",
                teacherScript: "print(\"[ ] Names clear\")\nprint(\"[ ] One job per function\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w39-l3",
                title: "Start coding MVP",
                body: """
First commit: one file that runs.
""",
                teacherScript: "print(\"Today: skeleton + one feature\")",
                starterCode: """
None
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
                starterCode: """
print("# Project Name")
print("## Run: python3 main.py")
""",
                challengeQuestion: "Docs file name?",
                challengeAnswer: "README"
            ),
            CurriculumSeed.teachingLesson(
                id: "w40-l2",
                title: "Professional demo",
                body: """
2 min, backup recording, thank you.
""",
                teacherScript: "print(\"[ ] README done\")\nprint(\"[ ] Demo rehearsed\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w40-l3",
                title: "Level 4 session graduation",
                body: """
Celebrate portfolio + capstone.
""",
                teacherScript: "print(\"Level 4 session track complete!\")",
                starterCode: """
None
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
                starterCode: """
print("Must: + - * /")
print("Must: history list")
print("Must: try/except on /")
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w41-l2",
                title: "Error handling",
                body: """
try/except ZeroDivisionError.
""",
                teacherScript: "try:\n    print(10/0)\nexcept ZeroDivisionError:\n    print(\"Cannot divide by zero\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w41-l3",
                title: "Build history log",
                body: """
Append each operation string.
""",
                teacherScript: "history = []\ndef log(op):\n    history.append(op)\nlog(\"2+2=4\")\nprint(history)",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l2",
                title: "Load game JSON",
                body: """
Restore from file on start.
""",
                teacherScript: "print(\"if save.json: load else new game\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w42-l3",
                title: "Inventory commands",
                body: """
take, use, look — parse user input.
""",
                teacherScript: "print(\"> take key — add to inventory\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l2",
                title: "Step counter",
                body: """
Count comparisons for performance talk.
""",
                teacherScript: "comparisons = 0\nprint(\"Track comparisons each loop\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w43-l3",
                title: "matplotlib bars optional",
                body: """
Show array state as bar heights.
""",
                teacherScript: "print(\"Optional: plt.bar(range(n), arr)\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l2",
                title: "BFS queue code",
                body: """
collections.deque for queue.
""",
                teacherScript: "from collections import deque\nq = deque([(0,0)])\nprint(q.popleft())",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w44-l3",
                title: "Reconstruct path",
                body: """
Parent map from BFS.
""",
                teacherScript: "print(\"parent[(r,c)] = where we came from\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l2",
                title: "Train simple model",
                body: """
fit on CSV sample.
""",
                teacherScript: "# pip3 install scikit-learn pandas\nprint(\"df = pd.read_csv(...); model.fit(X,y)\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w45-l3",
                title: "Evaluate & report",
                body: """
Print accuracy or confusion.
""",
                teacherScript: "print(\"print(f Accuracy: {score:.0%}\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l2",
                title: "Bind events",
                body: """
Buttons refresh displayed data.
""",
                teacherScript: "print(\"Refresh button updates labels\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w46-l3",
                title: "Consistent styling",
                body: """
Same font, padding, colors.
""",
                teacherScript: "print(\"Pick 2 colors + one font\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l2",
                title: "Design doc template",
                body: """
Problem, users, features, timeline.
""",
                teacherScript: "print(\"Final project title:\")\nprint(\"4-week timeline:\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w47-l3",
                title: "Choose capstone track",
                body: """
Game / Data / Algorithm viz.
""",
                teacherScript: "print(\"Track: Game / Data / Algo\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l2",
                title: "Debug systematically",
                body: """
Print debug, read traceback, fix one error.
""",
                teacherScript: "print(\"1. Reproduce 2. Read error 3. Fix 4. Re-test\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w48-l3",
                title: "Commit milestone",
                body: """
Tag what works today.
""",
                teacherScript: "print(\"Milestone: core feature runs\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l2",
                title: "Manual test checklist",
                body: """
Every button, edge case.
""",
                teacherScript: "print(\"[ ] Happy path\")\nprint(\"[ ] Bad input\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w49-l3",
                title: "Code cleanup",
                body: """
Remove print debug, rename vars.
""",
                teacherScript: "print(\"Delete TODO debug prints\")",
                starterCode: """
None
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
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l2",
                title: "Portfolio folder",
                body: """
Screenshots + exported JSON.
""",
                teacherScript: "print(\"Folder: best 4 projects\")",
                starterCode: """
None
"""
            ),
            CurriculumSeed.teachingLesson(
                id: "w50-l3",
                title: "Graduation!",
                body: """
Level 4 portfolio complete.
""",
                teacherScript: "print(\"Congratulations, Soha!\")",
                starterCode: """
None
"""
            ),
    ]

}
