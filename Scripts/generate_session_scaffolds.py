#!/usr/bin/env python3
"""Generate SessionScaffolds.swift — capstone starter code for sessions weeks 11–50."""

from pathlib import Path
import textwrap

# Weeks that keep checklist/plan starters (presentations, graduation).
CHECKLIST_WEEKS = {20, 30, 40, 50}

# week -> (todo lines, optional import/skeleton lines)
CAPSTONES: dict[int, tuple[list[str], list[str]]] = {
    11: (
        [
            "Write grade_label(score) with if/elif/else",
            "Loop scores and print each score with its letter",
        ],
        [
            "def grade_label(score):",
            "    # TODO",
            "    pass",
            "",
            "scores = [95, 82, 74, 88]",
            "# TODO: for loop",
        ],
    ),
    12: (
        [
            "Wrap int(input()) in try/except ValueError",
            "Write encrypt(text, shift) for Caesar cipher",
            "Encrypt a test message and print it",
        ],
        [
            "# TODO: try/except for age input",
            "",
            "def encrypt(text, shift):",
            "    # TODO: shift each letter",
            "    pass",
            "",
            "# TODO: print encrypt(\"HELLO\", 3)",
        ],
    ),
    13: (
        [
            "Create a Student class with __init__, enroll(), greet()",
            "Create one student, enroll two courses, print greet()",
        ],
        [
            "class Student:",
            "    def __init__(self, name, grade):",
            "        # TODO",
            "        pass",
            "",
            "    def enroll(self, course):",
            "        # TODO",
            "        pass",
            "",
            "    def greet(self):",
            "        # TODO: return a string",
            "        pass",
            "",
            "# TODO: create student, enroll, print greet",
        ],
    ),
    14: (
        [
            "Build Tkinter window with city Entry and Get Weather button",
            "fetch_weather() updates a result Label (placeholder text OK)",
        ],
        [
            "import tkinter as tk",
            "",
            "root = tk.Tk()",
            "root.title(\"Weather App\")",
            "# TODO: Entry, Label, Button with command=fetch_weather",
            "# TODO: def fetch_weather(): update label",
            "root.mainloop()",
        ],
    ),
    15: (
        [
            "Fetch weather JSON with requests.get (use YOUR_API_KEY placeholder)",
            "Parse temp and description; print formatted result",
        ],
        [
            "# pip3 install requests",
            "import requests",
            "",
            "API_KEY = \"YOUR_API_KEY\"",
            "city = \"Houston\"",
            "# TODO: build URL, requests.get, parse JSON, print temp",
        ],
    ),
    16: (
        [
            "Build a list with a list comprehension",
            "Create a small pandas DataFrame and save/load CSV",
        ],
        [
            "# pip3 install pandas",
            "import pandas as pd",
            "",
            "# TODO: squares = [n*n for n in range(1, 6)]",
            "# TODO: DataFrame, to_csv, read_csv",
        ],
    ),
    17: (
        [
            "Plot quiz scores with matplotlib (title, labels, ylim 0–100)",
        ],
        [
            "# pip3 install matplotlib",
            "import matplotlib.pyplot as plt",
            "",
            "scores = [70, 85, 90, 88, 92]",
            "days = [1, 2, 3, 4, 5]",
            "# TODO: plot, title, xlabel, ylabel, ylim, show",
        ],
    ),
    18: (
        [
            "Demo lambda, default parameter, and *args in one script",
        ],
        [
            "# TODO: lambda example",
            "# TODO: def greet(name, msg=\"Hello\"):",
            "# TODO: def demo(*args, **kwargs): print args, kwargs",
        ],
    ),
    19: (
        [
            "Train a DecisionTreeClassifier on sample X, y",
            "Print a prediction for one new example",
        ],
        [
            "# pip3 install scikit-learn",
            "from sklearn.tree import DecisionTreeClassifier",
            "",
            "X = [[120, 0.8], [90, 0.5], [200, 0.9]]",
            "y = [1, 0, 1]",
            "# TODO: fit and predict",
        ],
    ),
    21: (
        [
            "Tkinter Text editor with Open and Save buttons",
            "open_file loads text; save_file writes Text content",
        ],
        [
            "import tkinter as tk",
            "from tkinter import filedialog",
            "",
            "root = tk.Tk()",
            "root.title(\"Text Editor\")",
            "text = tk.Text(root, width=60, height=20)",
            "text.pack()",
            "# TODO: open_file(), save_file(), two Buttons",
            "root.mainloop()",
        ],
    ),
    22: (
        [
            "9-button Tic-Tac-Toe grid with X/O alternation",
            "check_winner() for rows/cols/diagonals",
        ],
        [
            "import tkinter as tk",
            "",
            "board = [\"\"] * 9",
            "current = \"X\"",
            "# TODO: check_winner, click(i), 3x3 Button grid",
            "# root.mainloop()",
        ],
    ),
    23: (
        [
            "Cipher app: Entry for message + shift, Encrypt button, output Label",
            "Handle invalid shift with try/except",
        ],
        [
            "import tkinter as tk",
            "",
            "def encrypt(text, shift):",
            "    # TODO: Caesar shift",
            "    pass",
            "",
            "# TODO: Tk widgets + run_encrypt()",
        ],
    ),
    24: (
        [
            "Recursive organize_folder(path) that groups files by extension",
            "Print what would move (or move with shutil under supervision)",
        ],
        [
            "import os",
            "",
            "def organize_folder(path):",
            "    # TODO: base case + recurse into subdirs",
            "    pass",
            "",
            "organize_folder(\".\")",
        ],
    ),
    25: (
        [
            "Fetch live data from an API (urllib or requests)",
            "Print one useful field from the JSON response",
        ],
        [
            "import json",
            "# TODO: fetch URL, parse JSON, print result",
        ],
    ),
    26: (
        [
            "GameState class with save/load using json module",
        ],
        [
            "import json",
            "",
            "class GameState:",
            "    def __init__(self):",
            "        # TODO: board, scores, etc.",
            "        pass",
            "",
            "    def save(self, path=\"game_state.json\"):",
            "        # TODO",
            "        pass",
            "",
            "    @classmethod",
            "    def load(cls, path=\"game_state.json\"):",
            "        # TODO",
            "        pass",
        ],
    ),
    27: (
        [
            "pygame loop: move circle with arrow keys, quit on close",
        ],
        [
            "import pygame",
            "# TODO: init, window, event loop, draw circle, flip, quit",
        ],
    ),
    28: (
        [
            "Split project into at least two classes (e.g. CipherEngine + AppState)",
        ],
        [
            "class CipherEngine:",
            "    def encrypt(self, text):",
            "        # TODO",
            "        pass",
            "",
            "class AppState:",
            "    def log(self, message):",
            "        # TODO",
            "        pass",
        ],
    ),
    29: (
        [
            "Write project plan (title, milestones, first feature to build today)",
        ],
        [
            "print(\"=== Level 3 Final Project Plan ===\")",
            "# TODO: your choice, 3 milestones, today's first feature",
        ],
    ),
    31: (
        [
            "Calculator with add/subtract functions AND a REPL loop",
            "Handle divide by zero",
        ],
        [
            "def add(a, b):",
            "    # TODO",
            "    pass",
            "",
            "# TODO: REPL while loop with + - * / q",
        ],
    ),
    32: (
        [
            "Room class with exits dict; Player class with location",
            "Connect two rooms and print player location",
        ],
        [
            "class Room:",
            "    def __init__(self, name, description):",
            "        # TODO",
            "        pass",
            "",
            "class Player:",
            "    def __init__(self, start_room):",
            "        # TODO",
            "        pass",
            "",
            "# TODO: link rooms, create player, print location",
        ],
    ),
    33: (
        [
            "Use filter and map on a list of numbers",
            "Use reduce to sum results",
        ],
        [
            "numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
            "# TODO: evens = filter(...), squares = map(...), total = reduce(...)",
        ],
    ),
    34: (
        [
            "Implement bubble_sort with print on each swap",
            "Implement binary_search on sorted list",
        ],
        [
            "def bubble_sort(arr):",
            "    # TODO",
            "    pass",
            "",
            "def binary_search(sorted_list, target):",
            "    # TODO",
            "    pass",
            "",
            "data = [5, 1, 4, 2, 8]",
            "# TODO: sort and search",
        ],
    ),
    35: (
        [
            "Parse grid with S, G, # walls; find start and goal",
            "Implement BFS or print neighbor exploration plan",
        ],
        [
            "grid = [",
            "    \"S...\",",
            "    \".#..\",",
            "    \"...G\",",
            "]",
            "# TODO: find_start_goal, BFS queue, print path",
        ],
    ),
    36: (
        [
            "Split data into train/test; fit sklearn model; print accuracy",
        ],
        [
            "# pip3 install scikit-learn",
            "from sklearn.neighbors import KNeighborsClassifier",
            "# TODO: X, y, fit on train, score on test",
        ],
    ),
    37: (
        [
            "Tkinter app: inputs → Predict button → result Label",
        ],
        [
            "import tkinter as tk",
            "# TODO: Entry fields, predict button, show prediction label",
        ],
    ),
    38: (
        [
            "Load weather-like data with pandas; groupby and plot averages",
        ],
        [
            "# pip3 install pandas matplotlib",
            "import pandas as pd",
            "# TODO: DataFrame, groupby mean, optional plot",
        ],
    ),
    39: (
        [
            "One-page capstone plan: goal, milestones, file list",
        ],
        [
            "print(\"Capstone title:\")",
            "# TODO: milestones, files, risks",
        ],
    ),
    41: (
        [
            "Calculator class with history and divide-by-zero handling",
        ],
        [
            "class Calculator:",
            "    def __init__(self):",
            "        self.history = []",
            "",
            "    def calculate(self, a, op, b):",
            "        # TODO: try/except ZeroDivisionError, append history",
            "        pass",
        ],
    ),
    42: (
        [
            "Text adventure: Game class with move/take/save using json",
        ],
        [
            "import json",
            "",
            "class Game:",
            "    def __init__(self):",
            "        # TODO: room, inventory",
            "        pass",
            "",
            "    def move(self, direction):",
            "        # TODO",
            "        pass",
            "",
            "    def save(self, filename=\"savegame.json\"):",
            "        # TODO",
            "        pass",
        ],
    ),
    43: (
        [
            "bubble_sort_visual that prints each swap and counts steps",
        ],
        [
            "import time",
            "",
            "def bubble_sort_visual(arr):",
            "    # TODO: print swaps, return sorted list and step count",
            "    pass",
            "",
            "data = [5, 1, 4, 2, 8]",
            "# TODO: run and print timing",
        ],
    ),
    44: (
        [
            "BFS pathfinding on a grid from S to G",
        ],
        [
            "from collections import deque",
            "",
            "grid = [\"S...\", \".#..\", \"...G\"]",
            "# TODO: BFS with queue, print path",
        ],
    ),
    45: (
        [
            "Load weather CSV/features; train simple ML model; report accuracy",
        ],
        [
            "# pip3 install pandas scikit-learn",
            "# TODO: read data, fit model, print metric",
        ],
    ),
    46: (
        [
            "Custom Tkinter dashboard with sections and refresh button",
        ],
        [
            "import tkinter as tk",
            "# TODO: layout, labels, refresh command",
        ],
    ),
    47: (
        [
            "Wire your best project pieces into one demo-ready app",
        ],
        [
            "print(\"Portfolio integration plan:\")",
            "# TODO: which projects to combine, one working feature today",
        ],
    ),
    48: (
        [
            "Write README.md outline: install, run, screenshot",
        ],
        [
            "print(\"# Project Name\")",
            "# TODO: ## Install, ## Run, ## Features",
        ],
    ),
    49: (
        [
            "Sprint 2 checklist: error handling, README, docstrings, edge-case test",
        ],
        [
            "print(\"=== Sprint 2 Checklist ===\")",
            "# TODO: mark each item as you complete it",
        ],
    ),
}


def swift_string(week: int, todos: list[str], skeleton: list[str]) -> str:
    lines = [f"# w{week}-live capstone — complete the lessons above first", ""]
    for i, todo in enumerate(todos, 1):
        lines.append(f"# TODO {i}: {todo}")
    lines.append("")
    lines.extend(skeleton)
    body = "\n".join(lines)
    escaped = body.replace("\\", "\\\\").replace('"', '\\"')
    return f'    static let week{week} = """\n{body}\n"""'


def emit_swift() -> str:
    parts = [
        "import Foundation",
        "",
        "/// Capstone starter scaffolds for sessions weeks 11–50.",
        "/// Regenerate: python3 Scripts/generate_session_scaffolds.py",
        "enum SessionScaffolds {",
    ]
    for week in sorted(CAPSTONES):
        todos, skeleton = CAPSTONES[week]
        parts.append(swift_string(week, todos, skeleton))
        parts.append("")
    parts.append("    static func starter(for week: Int, fallback: String?) -> String? {")
    parts.append("        switch week {")
    for week in sorted(CAPSTONES):
        parts.append(f"        case {week}: return week{week}")
    parts.append("        default: return fallback")
    parts.append("        }")
    parts.append("    }")
    parts.append("}")
    return "\n".join(parts) + "\n"


def patch_curriculum_seed(seed_path: Path) -> None:
    import re

    text = seed_path.read_text()
    # Only patch advancedLive / level*Live blocks that still use triple-quoted starters.
    block_pattern = re.compile(
        r"private static let \w+ = (?:advancedLive|level3Live|level4Live|level4Portfolio)\([\s\S]*?\n    \)",
    )
    starter_pattern = re.compile(
        r"(starterCode: )\"\"\"[\s\S]*?\"\"\"",
    )

    def patch_block(block: str) -> str:
        week_m = re.search(r"week: (\d+),", block)
        if not week_m:
            return block
        week = int(week_m.group(1))
        if week in CHECKLIST_WEEKS or week not in CAPSTONES:
            return block
        if "SessionScaffolds.week" in block:
            return block
        return starter_pattern.sub(rf"\1SessionScaffolds.week{week}", block, count=1)

    text = block_pattern.sub(lambda m: patch_block(m.group(0)), text)
    seed_path.write_text(text)


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    out_path = root / "Data" / "SessionScaffolds.swift"
    out_path.write_text(emit_swift())
    print(f"Wrote {out_path}")
    patch_curriculum_seed(root / "Data" / "CurriculumSeed.swift")
    print("Patched CurriculumSeed.swift session starters")


if __name__ == "__main__":
    main()
