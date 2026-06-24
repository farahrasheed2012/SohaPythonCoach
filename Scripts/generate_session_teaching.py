#!/usr/bin/env python3
"""Generate SessionTeachingLessons.swift — 3 teach lessons before each session week (11–50)."""

from pathlib import Path

from enrich_lesson_body import (
    enrich_body,
    enrich_starter_code,
    pedagogical_practice_steps,
)
from lesson_teaching_utils import (
    auto_code_tests,
    default_practice_steps,
    emit_code_tests_swift,
    emit_practice_steps_swift,
    scaffold_starter,
    swift_string,
)

# week -> list of 3 lessons (title, body, teacher_script, starter_code, challenge_q, challenge_a, try_it)
WEEKS = {
    11: [
        ("if / elif / else refresher", "Decisions pick different code paths.\n\n```\nif score >= 90:\n    print(\"A\")\nelif score >= 80:\n    print(\"B\")\nelse:\n    print(\"Keep going\")\n```\n\nOnly **one** branch runs.", "Trace score=85 on paper before Run.", 'score = 85\nif score >= 90:\n    print("A")\nelif score >= 80:\n    print("B")\nelse:\n    print("C")', "Which keyword adds another test after if?", "elif"),
        ("Functions refresher", "`def` names a reusable block. `return` sends a value back.\n\n```\ndef double(n):\n    return n * 2\n\nprint(double(5))\n```", "Change double to triple.", 'def greet(name):\n    print("Hello,", name)\n\ngreet("Soha")', "What keyword starts a function?", "def"),
        ("Loops refresher", "`for item in collection:` visits each item.\n\n`while condition:` repeats until the condition is False.", "Write a loop that prints 1,2,3.", 'for n in range(1, 4):\n    print(n)', "How many times does range(1, 4) run?", "3"),
    ],
    12: [
        ("When programs crash", "A **traceback** shows where Python stopped. Read from the bottom line up.", "Run broken code on purpose: `int(\"abc\")`.", 'print("Before")\n# int("not a number")  # uncomment to see traceback\nprint("After")', None, None),
        ("try / except / finally", "`try:` runs risky code.\n`except:` handles a specific error.\n`finally:` always runs at the end.", "Wrap int(input()) in try/except.", 'try:\n    x = int("42")\n    print(x + 1)\nexcept ValueError:\n    print("Not a number!")\nfinally:\n    print("Done.")', "Which keyword handles errors?", "except"),
        ("Caesar cipher on paper", "Shift each letter forward in the alphabet. A→D with shift 3.\n\nHELLO + 3 → KHOOR", "Encode SOHA with shift 3 on paper first.", 'def shift_letter(ch, n):\n    if not ch.isalpha():\n        return ch\n    base = ord("A") if ch.isupper() else ord("a")\n    return chr((ord(ch) - base + n) % 26 + base)\n\nprint(shift_letter("A", 3))', "What does % 26 do in a cipher?", "wrap"),
    ],
    13: [
        ("Classes & objects", "A **class** is a blueprint. An **object** is one instance.\n\n`class Dog:` … `buddy = Dog()`", "Draw: Student has name, grade.", 'class Dog:\n    def __init__(self, name):\n        self.name = name\n    def speak(self):\n        print(self.name, "says woof!")\n\nd = Dog("Buddy")\nd.speak()', "What creates an object from a class?", "class"),
        ("__init__ and self", "`__init__` runs when the object is created.\n`self` refers to **this** object.", "Add a grade attribute.", 'class Student:\n    def __init__(self, name, grade):\n        self.name = name\n        self.grade = grade\n\ns = Student("Soha", 7)\nprint(s.name, s.grade)', "What method runs on creation?", "__init__"),
        ("Lists inside objects", "Objects can hold lists: courses, scores, inventory.", "Add enroll() that appends to a list.", 'class Student:\n    def __init__(self, name):\n        self.name = name\n        self.courses = []\n    def enroll(self, course):\n        self.courses.append(course)\n\ns = Student("Soha")\ns.enroll("Python")\nprint(s.courses)', None, None),
    ],
    14: [
        ("What is an API?", "An **API** lets programs request data over the internet. Many return **JSON** text.", "Open a JSON example in browser with parent.", 'import json\ndata = {"city": "Houston", "temp": 72}\nprint(json.dumps(data, indent=2))', "What format do APIs often use?", "JSON"),
        ("Tkinter window basics", "`tk.Tk()` opens a window.\n`Label` shows text.\n`Button` runs a function when clicked.", "Change window title to your name.", 'import tkinter as tk\nroot = tk.Tk()\nroot.title("Hello GUI")\ntk.Label(root, text="Hi Soha!").pack()\ntk.Button(root, text="Click me", command=lambda: print("Clicked!")).pack()\nroot.mainloop()', "Which library makes GUI windows?", "tkinter"),
        ("Plan the weather app", "Sketch: city entry, Get Weather button, result label.", "Draw the layout on paper.", 'print("Weather app plan:")\nprint("1. Entry for city")\nprint("2. Button to fetch")\nprint("3. Label for temp + conditions")', None, None),
    ],
    15: [
        ("requests.get", "`requests.get(url)` fetches a web page or API response.\nRun in Terminal after `pip3 install requests`.", "Print response.status_code.", '# pip3 install requests\nimport requests\nr = requests.get("https://httpbin.org/get")\nprint(r.status_code)\nprint(r.json())', "What method fetches data?", "GET"),
        ("Parse JSON", "`.json()` turns response text into Python dicts and lists.", "Print keys of the JSON object.", 'data = {"main": {"temp": 72}, "weather": [{"description": "clear"}]}\nprint("Temp:", data["main"]["temp"])', "How do you access dict values?", "brackets"),
        ("Wire GUI to API", "Button command calls fetch function; label shows result.", "Use placeholder until API key added.", 'print("Connect fetch_weather() to your Tkinter button.")', None, None),
    ],
    16: [
        ("List comprehensions", "Build lists in one line: `[x*2 for x in range(5)]`", "Make a list of squares 1–5.", 'squares = [n*n for n in range(1, 6)]\nprint(squares)', "What keyword builds a list inline?", "for"),
        ("Pandas DataFrame", "A table with named columns. `pip3 install pandas`.", "Print average of score column.", '# pip3 install pandas\nimport pandas as pd\ndf = pd.DataFrame({"name": ["Soha"], "score": [92]})\nprint(df)', "What library uses DataFrame?", "pandas"),
        ("CSV save & load", "`.to_csv()` and `pd.read_csv()` persist tables.", "Save scores.csv and reload.", 'import pandas as pd\ndf = pd.DataFrame({"week": [1,2], "score": [80,90]})\ndf.to_csv("scores.csv", index=False)\nprint(pd.read_csv("scores.csv"))', "What file format stores tables?", "CSV"),
    ],
    17: [
        ("Matplotlib first plot", "`pip3 install matplotlib`. Plot points with `plt.plot`.", "Change title to your name.", '# pip3 install matplotlib\nimport matplotlib.pyplot as plt\nplt.plot([1,2,3], [70,85,90], marker="o")\nplt.title("My Scores")\nplt.show()', "Which library draws graphs?", "matplotlib"),
        ("Labels and axes", "`xlabel`, `ylabel`, `ylim` make graphs readable.", "Set y-axis 0–100.", 'import matplotlib.pyplot as plt\nweeks = [1,2,3]\nscores = [72, 88, 91]\nplt.plot(weeks, scores, marker="o")\nplt.xlabel("Week")\nplt.ylabel("Score")\nplt.ylim(0, 100)\nplt.show()', None, None),
        ("Data science workflow", "Ask a question → collect data → visualize → decide.", "Write one question about your quiz scores.", 'print("Question: Are my scores improving?")\nprint("Data: weekly quiz scores")\nprint("Chart: line plot")\nprint("Decision: keep studying weak topics")', "First step in data science?", "ask questions"),
    ],
    18: [
        ("Lambda functions", "Short one-line functions: `lambda x: x * 2`", "Lambda that adds 10.", 'double = lambda x: x * 2\nprint(double(7))', "What keyword makes a lambda?", "lambda"),
        ("Default parameters", "Parameters can have defaults: `def f(name, greeting=\"Hi\"):`", "Call with and without second arg.", 'def greet(name, msg="Hello"):\n    print(msg + ",", name)\n\ngreet("Soha")\ngreet("Soha", "Hi")', None, None),
        ("*args and **kwargs", "`*args` collects extra positional args.\n`**kwargs` collects keyword args.", "Print args and kwargs in a demo function.", 'def demo(*args, **kwargs):\n    print("args:", args)\n    print("kwargs:", kwargs)\n\ndemo(1, 2, topic="Python")', "What collects keyword args?", "**kwargs"),
    ],
    19: [
        ("What is machine learning?", "Find patterns in data to predict labels for new examples.", "Name one feature and one label.", 'print("Features: tempo, energy")\nprint("Label: genre (pop/rock)")', None, None),
        ("scikit-learn basics", "`pip3 install scikit-learn`. `model.fit(X, y)` trains.", "Print training data shapes.", '# pip3 install scikit-learn\nfrom sklearn.tree import DecisionTreeClassifier\nX = [[1, 0], [0, 1]]\ny = [0, 1]\nm = DecisionTreeClassifier()\nm.fit(X, y)\nprint("Trained!")', "What method trains the model?", "fit"),
        ("Predict & demo prep", "`.predict()` guesses for new data. Rehearse a 90-second demo.", 'from sklearn.tree import DecisionTreeClassifier\nX = [[120, 0.8], [90, 0.5]]\ny = [1, 0]\nm = DecisionTreeClassifier(max_depth=2)\nm.fit(X, y)\nprint(m.predict([[100, 0.6]]))', None, None),
    ],
    20: [
        ("Pick your showcase project", "Weather app, graph project, or music ML — choose one to demo.", "Write 3 sentences about your project.", 'print("My project:")\nprint("Problem it solves:")\nprint("Coolest feature:")', None, None),
        ("Rehearse the demo", "Intro (30s) → demo (60s) → lesson learned (30s).", "Practice out loud twice.", 'print("Demo checklist:")\nprint("[ ] Opens without errors")\nprint("[ ] Shows main feature")\nprint("[ ] I explain one line of code")', "How long is the demo?", "2 minutes"),
        ("Export progress", "Back up JSON from Progress tab before presenting.", "Progress tab → Export.", 'print("Level 2 complete! Skills: OOP, APIs, pandas, ML")', None, None),
    ],
}

# Level 3 weeks 21-30
WEEKS.update({
    21: [
        ("Tkinter widgets", "Label, Button, Text — each `.pack()` goes in the window.", "Add a second label.", 'import tkinter as tk\nroot = tk.Tk()\ntk.Label(root, text="Editor").pack()\ntext = tk.Text(root, height=10, width=40)\ntext.pack()\nroot.mainloop()', "Which widget holds multiple lines?", "Text"),
        ("File open & save", "`open(path)` reads/writes text files. Use filedialog to pick paths.", "Save hello.txt from Text widget.", 'with open("hello.txt", "w") as f:\n    f.write("Hello from Soha!")\nwith open("hello.txt") as f:\n    print(f.read())', None, None),
        ("Connect GUI to files", "Save button writes Text content; Open button loads file.", "Sketch Open/Save buttons.", 'print("open_file() reads into Text")\nprint("save_file() writes from Text")', None, None),
    ],
    22: [
        ("Game board as a list", "9 squares → list of length 9. Index 0–8 maps to grid.", "Print board positions.", 'board = ["X", "", "O", "", "X", "", "", "", "O"]\nfor i, cell in enumerate(board):\n    print(i, cell)', "How many squares on the board?", "9"),
        ("Win detection", "Check rows, columns, diagonals for three matching.", "Test one winning line.", 'wins = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]\nboard = ["X"]*3 + [""]*6\nprint(any(board[a]==board[b]==board[c]!="" for a,b,c in wins))', None, None),
        ("Tkinter button grid", "`.grid(row=, column=)` places buttons in rows/columns.", "Make one button print its index.", 'import tkinter as tk\nroot = tk.Tk()\nfor i in range(9):\n    tk.Button(root, text=str(i), width=4).grid(row=i//3, column=i%3)\nroot.mainloop()', None, None),
    ],
    23: [
        ("Caesar shift review", "Reuse shift function from Level 2.", "Encrypt ABC with shift 1.", 'def encrypt(text, shift):\n    out = ""\n    for ch in text:\n        if ch.isalpha():\n            b = ord("A") if ch.isupper() else ord("a")\n            out += chr((ord(ch)-b+shift)%26+b)\n        else:\n            out += ch\n    return out\nprint(encrypt("HI", 1))', None, None),
        ("Entry & Label widgets", "Entry gets user text. Label shows output.", "Show entered text in a label.", 'import tkinter as tk\nroot = tk.Tk()\ne = tk.Entry(root)\ne.pack()\nl = tk.Label(root, text="")\nl.pack()\ntk.Button(root, text="Show", command=lambda: l.config(text=e.get())).pack()\nroot.mainloop()', None, None),
        ("Error messages in GUI", "Use try/except; show friendly text in Label.", "Handle invalid shift.", 'print("except ValueError: show Please enter a number")', None, None),
    ],
    24: [
        ("os.listdir & paths", "`os.path.join` builds safe paths. `listdir` lists folder contents.", "List files in current folder.", 'import os\nfor name in os.listdir("."):\n    print(name)', None, None),
        ("Recursion idea", "A function that calls itself needs a **base case** to stop.", "Count down recursively.", 'def countdown(n):\n    if n <= 0:\n        print("Done!")\n        return\n    print(n)\n    countdown(n-1)\n\ncountdown(3)', "What stops recursion?", "base case"),
        ("Organize by extension", "Make subfolders per file type — on paper first.", 'print("For each file: get extension → move to folder/")', None, None),
    ],
    25: [
        ("HTTP & JSON review", "GET request → JSON response → parse in Python.", "Print one field from sample JSON.", 'import json\nsample = \'{"temp": 72, "city": "Houston"}\'\ndata = json.loads(sample)\nprint(data["city"], data["temp"])', None, None),
        ("requests in practice", "Fetch a public API or sample endpoint.", "pip3 install requests", '# pip3 install requests\nimport requests\nr = requests.get("https://httpbin.org/json")\nprint(r.json())', None, None),
        ("Display in app", "Show fetched data in GUI or print formatted.", 'print("Format: City: X, Temp: Y F")', None, None),
    ],
    26: [
        ("JSON module", "`json.dump` saves Python data; `json.load` reads it.", "Save and load a dict.", 'import json\ndata = {"score": 10, "level": 2}\nwith open("save.json", "w") as f:\n    json.dump(data, f)\nwith open("save.json") as f:\n    print(json.load(f))', "Which module handles JSON?", "json"),
        ("Game state dict", "Store score, level, player position in one dict.", "Design your save dict keys.", 'state = {"score": 0, "coins": 3, "x": 100, "y": 200}\nprint(state)', None, None),
        ("Load on startup", "If save file exists, load it; else start fresh.", 'import os\nprint("if os.path.exists(save.json): load else new game")', None, None),
    ],
    27: [
        ("pygame loop review", "while running: handle events → update → draw → flip.", "List the four steps.", 'print("1. events 2. update 3. draw 4. flip")', None, None),
        ("Sprites & collision", "Rectangles check overlap with `.colliderect`.", "Draw two rects in pygame.", 'import pygame\npygame.init()\ns = pygame.display.set_mode((200,100))\npygame.draw.rect(s,(255,0,0),(10,10,30,30))\npygame.draw.rect(s,(0,255,0),(35,10,30,30))\npygame.display.flip()\ninput("Enter")\npygame.quit()', None, None),
        ("Polish checklist", "Sound, score, game over screen.", 'print("Polish: sound effect on coin, score label, restart")', None, None),
    ],
    28: [
        ("Split into modules", "Move helpers to `utils.py` and `import utils`.", "Plan two files for your project.", 'print("game.py — main loop")\nprint("models.py — Player, Coin classes")', None, None),
        ("Class per game object", "Player class, Coin class — each knows how to draw/update.", "Sketch Player attributes.", 'class Player:\n    def __init__(self, x, y):\n        self.x = x\n        self.y = y\n    def move(self, dx, dy):\n        self.x += dx\n        self.y += dy', None, None),
        ("Refactor one feature", "Pick one messy function; move to a class method.", 'print("Before: one big file. After: classes + small functions.")', None, None),
    ],
    29: [
        ("Capstone planning", "MVP = smallest version that works. Extras come later.", "Write 3 milestones.", 'print("Milestone 1: core feature")\nprint("Milestone 2: save/load")\nprint("Milestone 3: polish UI")', None, None),
        ("Design doc", "One page: goal, features, file list.", "Bullet your features.", 'print("Project title:")\nprint("Must have:")\nprint("Nice to have:")', None, None),
        ("Start MVP", "Get one feature running end-to-end today.", 'print("Today: one working feature, no extras")', None, None),
    ],
    30: [
        ("Demo rehearsal", "2 minutes: intro, live demo, one bug you fixed.", "Practice twice.", 'print("[ ] Demo rehearsed")\nprint("[ ] Backup screen recording")', None, None),
        ("Peer feedback notes", "Write one thing to improve and one win.", 'print("Win:")\nprint("Improve:")', None, None),
        ("Level 3 graduation", "Export progress; screenshot best project.", 'print("Level 3 complete!")', None, None),
    ],
})

# Level 4 weeks 31-40
WEEKS.update({
    31: [
        ("Three paradigms", "Procedural: step-by-step. OOP: objects. Functional: map/filter on data.", "Name the three styles.", 'print("Procedural: functions in order")\nprint("OOP: classes")\nprint("Functional: map/filter")', None, None),
        ("Calculator with functions", "add, subtract as plain functions.", "Add multiply.", 'def add(a,b): return a+b\ndef sub(a,b): return a-b\nprint(add(5,3))', None, None),
        ("Same calc with a class", "Calculator class holds history list.", "Add history.append each op.", 'class Calc:\n    def __init__(self):\n        self.history = []\n    def add(self,a,b):\n        r=a+b\n        self.history.append(f"{a}+{b}={r}")\n        return r', None, None),
    ],
    32: [
        ("Room class", "Each room has name, description, exits dict.", "Draw 3 rooms on paper.", 'class Room:\n    def __init__(self, name, desc):\n        self.name = name\n        self.desc = desc\n        self.exits = {}\n\nkitchen = Room("Kitchen", "A small kitchen.")\nprint(kitchen.desc)', None, None),
        ("Linking rooms", "`room.exits[\"north\"] = other_room`", "Connect two rooms.", 'class Room:\n    def __init__(self, name):\n        self.name = name\n        self.exits = {}\na = Room("Hall")\nb = Room("Garden")\na.exits["south"] = b\nprint(a.exits["south"].name)', "What connects rooms?", "exits"),
        ("Game loop for adventure", "Print description; read command; move if valid.", 'print("> look — print room desc")\nprint("> go north — if exit exists")', None, None),
    ],
    33: [
        ("map & filter", "`map(fn, list)` transforms each item.\n`filter(fn, list)` keeps items where fn is True.", "Double a list with map.", 'nums = [1,2,3,4]\nprint(list(map(lambda x: x*2, nums)))', None, None),
        ("reduce", "`functools.reduce` combines list to one value.", "Sum with reduce.", 'from functools import reduce\nprint(reduce(lambda a,b: a+b, [1,2,3,4]))', "Which function combines to one value?", "reduce"),
        ("Pipeline", "Read → filter → map → print.", 'data = [1,2,3,4,5,6]\nevens = filter(lambda x: x%2==0, data)\nprint(list(map(lambda x: x*10, evens)))', None, None),
    ],
    34: [
        ("Bubble sort idea", "Compare neighbors; swap if wrong order; repeat.", "Sort [3,1,2] on paper.", 'arr = [3,1,2]\nfor i in range(len(arr)):\n    for j in range(len(arr)-1-i):\n        if arr[j] > arr[j+1]:\n            arr[j], arr[j+1] = arr[j+1], arr[j]\nprint(arr)', "Which sort compares neighbors?", "bubble sort"),
        ("Binary search", "Works on **sorted** list. Cut search space in half.", "Search for 7 in sorted list.", 'def binary_search(arr, target):\n    lo, hi = 0, len(arr)-1\n    while lo <= hi:\n        mid = (lo+hi)//2\n        if arr[mid] == target: return mid\n        if arr[mid] < target: lo = mid+1\n        else: hi = mid-1\n    return -1\nprint(binary_search([1,3,5,7,9], 7))', "Requires sorted list?", "binary search"),
        ("Big-O intuition", "Nested loops → slower on big data. Binary search is faster.", 'print("Bubble: check many pairs")\nprint("Binary: halve each step")', None, None),
    ],
    35: [
        ("Grid as 2D list", "grid[row][col] — 0 often means open, 1 wall.", "Make a 5x5 grid of zeros.", 'grid = [[0]*5 for _ in range(5)]\ngrid[2][2] = 1\nprint(grid[2])', None, None),
        ("BFS idea", "Explore neighbors layer by layer — shortest path in unweighted grid.", "Mark visited cells.", 'print("Queue: start cell")\nprint("Add unvisited neighbors")\nprint("Stop at goal")', "Shortest path algorithm?", "BFS"),
        ("Implement on paper", "Trace BFS from start to goal on a small maze.", 'print("Maze: S=start, G=goal, #=wall")', None, None),
    ],
    36: [
        ("Train/test split", "Never test on training data only — hold out some rows.", "Split 80/20 on paper.", 'print("Train: learn patterns")\nprint("Test: check on new data")', None, None),
        ("Features & labels", "X = inputs, y = what you predict.", "Name 2 features for quiz prediction.", 'X = [[5, 1], [10, 0]]  # word count, question mark\ny = [0, 1]  # subject', None, None),
        ("Accuracy", "`score` method on held-out test set.", '# pip3 install scikit-learn\nfrom sklearn.neighbors import KNeighborsClassifier\nX=[[1],[2],[3],[10]]\ny=[0,0,1,1]\nm=KNeighborsClassifier(n_neighbors=1)\nm.fit(X[:3], y[:3])\nprint(m.score(X[3:], y[3:]))', None, None),
    ],
    37: [
        ("Tkinter for results", "Show prediction label and confidence in GUI.", "Sketch layout.", 'import tkinter as tk\nroot=tk.Tk()\ntk.Label(root,text="Prediction:").pack()\ntk.Label(root,text="(run model)").pack()\nroot.mainloop()', None, None),
        ("Wire predict button", "Button runs model.predict on entry features.", 'print("on_click: read inputs → predict → update label")', None, None),
        ("UX polish", "Clear errors, disable button while loading.", 'print("Show Loading... while fetching")', None, None),
    ],
    38: [
        ("Fetch weather CSV/API", "Combine requests + pandas.", "pip3 install pandas requests", 'import pandas as pd\ndf = pd.DataFrame({"city":["Houston"],"temp":[72]})\nprint(df)', None, None),
        ("groupby", "`df.groupby(\"city\")[\"temp\"].mean()`", "Group sample data.", 'import pandas as pd\ndf=pd.DataFrame({"city":["H","H","D"],"temp":[70,75,80]})\nprint(df.groupby("city")["temp"].mean())', "pandas group rows?", "groupby"),
        ("Plot grouped data", "Bar chart of averages.", 'print("plt.bar(cities, avg_temps)")', None, None),
    ],
    39: [
        ("Project plan doc", "Goal, milestones, files, risks.", "Fill one-page plan.", 'print("Capstone title:")\nprint("Week 1 milestone:")\nprint("Week 2 milestone:")', None, None),
        ("Code review checklist", "Readable names, no giant functions, comments on tricky parts.", 'print("[ ] Names clear")\nprint("[ ] One job per function")', None, None),
        ("Start coding MVP", "First commit: one file that runs.", 'print("Today: skeleton + one feature")', None, None),
    ],
    40: [
        ("README draft", "How to run, what it does, screenshot.", "Outline README sections.", 'print("# Project Name")\nprint("## Run: python3 main.py")', "Docs file name?", "README"),
        ("Professional demo", "2 min, backup recording, thank you.", 'print("[ ] README done")\nprint("[ ] Demo rehearsed")', None, None),
        ("Level 4 session graduation", "Celebrate portfolio + capstone.", 'print("Level 4 session track complete!")', None, None),
    ],
})

# Portfolio weeks 41-50
WEEKS.update({
    41: [
        ("Calculator requirements", "History, error on divide by zero, two styles.", "List must-have features.", 'print("Must: + - * /")\nprint("Must: history list")\nprint("Must: try/except on /")', None, None),
        ("Error handling", "try/except ZeroDivisionError.", 'try:\n    print(10/0)\nexcept ZeroDivisionError:\n    print("Cannot divide by zero")', None, None),
        ("Build history log", "Append each operation string.", 'history = []\ndef log(op):\n    history.append(op)\nlog("2+2=4")\nprint(history)', None, None),
    ],
    42: [
        ("Save game JSON", "Serialize rooms, inventory, location.", 'import json\nstate={"room":"hall","inventory":[]}\nprint(json.dumps(state))', None, None),
        ("Load game JSON", "Restore from file on start.", 'print("if save.json: load else new game")', None, None),
        ("Inventory commands", "take, use, look — parse user input.", 'print("> take key — add to inventory")', None, None),
    ],
    43: [
        ("Visualize one swap", "Print array before/after each bubble pass.", 'arr=[3,1,2]\nprint("Before:", arr)\n# one pass bubble\nprint("After pass:", sorted(arr))', None, None),
        ("Step counter", "Count comparisons for performance talk.", 'comparisons = 0\nprint("Track comparisons each loop")', None, None),
        ("matplotlib bars optional", "Show array state as bar heights.", 'print("Optional: plt.bar(range(n), arr)")', None, None),
    ],
    44: [
        ("Parse maze grid", "Read 2D list from file or literal.", 'maze = [["S",".","."],["#",".","."],[".",".","G"]]\nprint(maze)', None, None),
        ("BFS queue code", "collections.deque for queue.", 'from collections import deque\nq = deque([(0,0)])\nprint(q.popleft())', None, None),
        ("Reconstruct path", "Parent map from BFS.", 'print("parent[(r,c)] = where we came from")', None, None),
    ],
    45: [
        ("Weather features", "temp, humidity as ML inputs.", 'print("Features: temp, humidity")\nprint("Label: rain tomorrow?")', None, None),
        ("Train simple model", "fit on CSV sample.", '# pip3 install scikit-learn pandas\nprint("df = pd.read_csv(...); model.fit(X,y)")', None, None),
        ("Evaluate & report", "Print accuracy or confusion.", 'print("print(f Accuracy: {score:.0%}")', None, None),
    ],
    46: [
        ("Dashboard layout", "grid or pack sections: header, stats, buttons.", 'import tkinter as tk\nroot=tk.Tk()\ntk.Label(root,text="Dashboard").pack()\nroot.mainloop()', None, None),
        ("Bind events", "Buttons refresh displayed data.", 'print("Refresh button updates labels")', None, None),
        ("Consistent styling", "Same font, padding, colors.", 'print("Pick 2 colors + one font")', None, None),
    ],
    47: [
        ("Review 6 projects", "Pick strengths for final capstone.", 'print("Best project so far:")\nprint("Skill to showcase:")', None, None),
        ("Design doc template", "Problem, users, features, timeline.", 'print("Final project title:")\nprint("4-week timeline:")', None, None),
        ("Choose capstone track", "Game / Data / Algorithm viz.", 'print("Track: Game / Data / Algo")', None, None),
    ],
    48: [
        ("Sprint 1 goal", "One core feature working E2E.", 'print("Sprint 1 = MVP feature only")', None, None),
        ("Debug systematically", "Print debug, read traceback, fix one error.", 'print("1. Reproduce 2. Read error 3. Fix 4. Re-test")', None, None),
        ("Commit milestone", "Tag what works today.", 'print("Milestone: core feature runs")', None, None),
    ],
    49: [
        ("Write README", "Install, run, screenshot.", 'print("## Install")\nprint("pip3 install ...")\nprint("python3 main.py")', None, None),
        ("Manual test checklist", "Every button, edge case.", 'print("[ ] Happy path")\nprint("[ ] Bad input")', None, None),
        ("Code cleanup", "Remove print debug, rename vars.", 'print("Delete TODO debug prints")', None, None),
    ],
    50: [
        ("Final presentation", "2 min demo + Q&A.", 'print("[ ] Demo ready")\nprint("[ ] README link")', None, None),
        ("Portfolio folder", "Screenshots + exported JSON.", 'print("Folder: best 4 projects")', None, None),
        ("Graduation!", "Level 4 portfolio complete.", 'print("Congratulations, Soha!")', None, None),
    ],
})


def swift_multiline_literal(text: str) -> str:
    return text.replace("\\", "\\\\")


def emit_lesson(week: int, idx: int, lesson: tuple) -> str:
    title = lesson[0]
    body = lesson[1]
    script = lesson[2]
    code = lesson[3] if len(lesson) > 3 and lesson[3] is not None else ""
    cq = lesson[4] if len(lesson) > 4 else None
    ca = lesson[5] if len(lesson) > 5 else None
    lid = f"w{week}-l{idx}"
    enriched_body = swift_multiline_literal(
        enrich_body(title, body, code, script, lid, None, cq, ca)
    )
    starter = enrich_starter_code(code, title, lid)
    scaffolded = scaffold_starter(starter, lid)
    steps = pedagogical_practice_steps(title, enriched_body, scaffolded, None, lid)
    tests = auto_code_tests(lid, scaffolded, ca)
    steps_swift = emit_practice_steps_swift(steps, indent="                ")
    tests_swift = emit_code_tests_swift(lid, tests, indent="                ")
    trailing_parts: list[str] = []
    if cq and ca:
        trailing_parts.append(
            f'challengeQuestion: "{swift_string(cq)}",\n                challengeAnswer: "{swift_string(ca)}"'
        )
    if tests_swift:
        trailing_parts.append(tests_swift.rstrip())
    trailing = ",\n                ".join(trailing_parts)
    trailing_block = f",\n                {trailing}" if trailing else ""
    return f"""            CurriculumSeed.teachingLesson(
                id: "{lid}",
                title: "{swift_string(title)}",
                body: \"\"\"
{enriched_body}
\"\"\",
                teacherScript: "{swift_string(script)}",
{steps_swift}
                starterCode: \"\"\"
{swift_multiline_literal(scaffolded)}
\"\"\"{trailing_block}
            )"""


def main():
    lines = [
        "import Foundation",
        "",
        "/// Auto-generated teach-before-session lessons for weeks 11–50.",
        "/// Regenerate: python3 Scripts/generate_session_teaching.py",
        "enum SessionTeachingLessons {",
    ]
    for week in range(11, 51):
        lessons = WEEKS.get(week)
        if not lessons:
            raise SystemExit(f"Missing week {week}")
        lines.append(f"    static let week{week}: [LessonStep] = [")
        for i, les in enumerate(lessons, 1):
            lines.append(emit_lesson(week, i, les) + ",")
        lines.append("    ]")
        lines.append("")
    lines.append("}")
    out = Path(__file__).resolve().parents[1] / "Data" / "SessionTeachingLessons.swift"
    out.write_text("\n".join(lines) + "\n")
    print(f"Wrote {out} — {len(WEEKS)} weeks, {sum(len(v) for v in WEEKS.values())} lessons")


if __name__ == "__main__":
    main()
