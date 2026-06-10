import Foundation

/// Capstone starter scaffolds for sessions weeks 11–50.
/// Regenerate: python3 Scripts/generate_session_scaffolds.py
enum SessionScaffolds {
    static let week11 = """
# w11-live capstone — complete the lessons above first

# TODO 1: Write grade_label(score) with if/elif/else
# TODO 2: Loop scores and print each score with its letter

def grade_label(score):
    # TODO
    pass

scores = [95, 82, 74, 88]
# TODO: for loop
"""

    static let week12 = """
# w12-live capstone — complete the lessons above first

# TODO 1: Wrap int(input()) in try/except ValueError
# TODO 2: Write encrypt(text, shift) for Caesar cipher
# TODO 3: Encrypt a test message and print it

# TODO: try/except for age input

def encrypt(text, shift):
    # TODO: shift each letter
    pass

# TODO: print encrypt("HELLO", 3)
"""

    static let week13 = """
# w13-live capstone — complete the lessons above first

# TODO 1: Create a Student class with __init__, enroll(), greet()
# TODO 2: Create one student, enroll two courses, print greet()

class Student:
    def __init__(self, name, grade):
        # TODO
        pass

    def enroll(self, course):
        # TODO
        pass

    def greet(self):
        # TODO: return a string
        pass

# TODO: create student, enroll, print greet
"""

    static let week14 = """
# w14-live capstone — complete the lessons above first

# TODO 1: Build Tkinter window with city Entry and Get Weather button
# TODO 2: fetch_weather() updates a result Label (placeholder text OK)

import tkinter as tk

root = tk.Tk()
root.title("Weather App")
# TODO: Entry, Label, Button with command=fetch_weather
# TODO: def fetch_weather(): update label
root.mainloop()
"""

    static let week15 = """
# w15-live capstone — complete the lessons above first

# TODO 1: Fetch weather JSON with requests.get (use YOUR_API_KEY placeholder)
# TODO 2: Parse temp and description; print formatted result

# pip3 install requests
import requests

API_KEY = "YOUR_API_KEY"
city = "Houston"
# TODO: build URL, requests.get, parse JSON, print temp
"""

    static let week16 = """
# w16-live capstone — complete the lessons above first

# TODO 1: Build a list with a list comprehension
# TODO 2: Create a small pandas DataFrame and save/load CSV

# pip3 install pandas
import pandas as pd

# TODO: squares = [n*n for n in range(1, 6)]
# TODO: DataFrame, to_csv, read_csv
"""

    static let week17 = """
# w17-live capstone — complete the lessons above first

# TODO 1: Plot quiz scores with matplotlib (title, labels, ylim 0–100)

# pip3 install matplotlib
import matplotlib.pyplot as plt

scores = [70, 85, 90, 88, 92]
days = [1, 2, 3, 4, 5]
# TODO: plot, title, xlabel, ylabel, ylim, show
"""

    static let week18 = """
# w18-live capstone — complete the lessons above first

# TODO 1: Demo lambda, default parameter, and *args in one script

# TODO: lambda example
# TODO: def greet(name, msg="Hello"):
# TODO: def demo(*args, **kwargs): print args, kwargs
"""

    static let week19 = """
# w19-live capstone — complete the lessons above first

# TODO 1: Train a DecisionTreeClassifier on sample X, y
# TODO 2: Print a prediction for one new example

# pip3 install scikit-learn
from sklearn.tree import DecisionTreeClassifier

X = [[120, 0.8], [90, 0.5], [200, 0.9]]
y = [1, 0, 1]
# TODO: fit and predict
"""

    static let week21 = """
# w21-live capstone — complete the lessons above first

# TODO 1: Tkinter Text editor with Open and Save buttons
# TODO 2: open_file loads text; save_file writes Text content

import tkinter as tk
from tkinter import filedialog

root = tk.Tk()
root.title("Text Editor")
text = tk.Text(root, width=60, height=20)
text.pack()
# TODO: open_file(), save_file(), two Buttons
root.mainloop()
"""

    static let week22 = """
# w22-live capstone — complete the lessons above first

# TODO 1: 9-button Tic-Tac-Toe grid with X/O alternation
# TODO 2: check_winner() for rows/cols/diagonals

import tkinter as tk

board = [""] * 9
current = "X"
# TODO: check_winner, click(i), 3x3 Button grid
# root.mainloop()
"""

    static let week23 = """
# w23-live capstone — complete the lessons above first

# TODO 1: Cipher app: Entry for message + shift, Encrypt button, output Label
# TODO 2: Handle invalid shift with try/except

import tkinter as tk

def encrypt(text, shift):
    # TODO: Caesar shift
    pass

# TODO: Tk widgets + run_encrypt()
"""

    static let week24 = """
# w24-live capstone — complete the lessons above first

# TODO 1: Recursive organize_folder(path) that groups files by extension
# TODO 2: Print what would move (or move with shutil under supervision)

import os

def organize_folder(path):
    # TODO: base case + recurse into subdirs
    pass

organize_folder(".")
"""

    static let week25 = """
# w25-live capstone — complete the lessons above first

# TODO 1: Fetch live data from an API (urllib or requests)
# TODO 2: Print one useful field from the JSON response

import json
# TODO: fetch URL, parse JSON, print result
"""

    static let week26 = """
# w26-live capstone — complete the lessons above first

# TODO 1: GameState class with save/load using json module

import json

class GameState:
    def __init__(self):
        # TODO: board, scores, etc.
        pass

    def save(self, path="game_state.json"):
        # TODO
        pass

    @classmethod
    def load(cls, path="game_state.json"):
        # TODO
        pass
"""

    static let week27 = """
# w27-live capstone — complete the lessons above first

# TODO 1: pygame loop: move circle with arrow keys, quit on close

import pygame
# TODO: init, window, event loop, draw circle, flip, quit
"""

    static let week28 = """
# w28-live capstone — complete the lessons above first

# TODO 1: Split project into at least two classes (e.g. CipherEngine + AppState)

class CipherEngine:
    def encrypt(self, text):
        # TODO
        pass

class AppState:
    def log(self, message):
        # TODO
        pass
"""

    static let week29 = """
# w29-live capstone — complete the lessons above first

# TODO 1: Write project plan (title, milestones, first feature to build today)

print("=== Level 3 Final Project Plan ===")
# TODO: your choice, 3 milestones, today's first feature
"""

    static let week31 = """
# w31-live capstone — complete the lessons above first

# TODO 1: Calculator with add/subtract functions AND a REPL loop
# TODO 2: Handle divide by zero

def add(a, b):
    # TODO
    pass

# TODO: REPL while loop with + - * / q
"""

    static let week32 = """
# w32-live capstone — complete the lessons above first

# TODO 1: Room class with exits dict; Player class with location
# TODO 2: Connect two rooms and print player location

class Room:
    def __init__(self, name, description):
        # TODO
        pass

class Player:
    def __init__(self, start_room):
        # TODO
        pass

# TODO: link rooms, create player, print location
"""

    static let week33 = """
# w33-live capstone — complete the lessons above first

# TODO 1: Use filter and map on a list of numbers
# TODO 2: Use reduce to sum results

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# TODO: evens = filter(...), squares = map(...), total = reduce(...)
"""

    static let week34 = """
# w34-live capstone — complete the lessons above first

# TODO 1: Implement bubble_sort with print on each swap
# TODO 2: Implement binary_search on sorted list

def bubble_sort(arr):
    # TODO
    pass

def binary_search(sorted_list, target):
    # TODO
    pass

data = [5, 1, 4, 2, 8]
# TODO: sort and search
"""

    static let week35 = """
# w35-live capstone — complete the lessons above first

# TODO 1: Parse grid with S, G, # walls; find start and goal
# TODO 2: Implement BFS or print neighbor exploration plan

grid = [
    "S...",
    ".#..",
    "...G",
]
# TODO: find_start_goal, BFS queue, print path
"""

    static let week36 = """
# w36-live capstone — complete the lessons above first

# TODO 1: Split data into train/test; fit sklearn model; print accuracy

# pip3 install scikit-learn
from sklearn.neighbors import KNeighborsClassifier
# TODO: X, y, fit on train, score on test
"""

    static let week37 = """
# w37-live capstone — complete the lessons above first

# TODO 1: Tkinter app: inputs → Predict button → result Label

import tkinter as tk
# TODO: Entry fields, predict button, show prediction label
"""

    static let week38 = """
# w38-live capstone — complete the lessons above first

# TODO 1: Load weather-like data with pandas; groupby and plot averages

# pip3 install pandas matplotlib
import pandas as pd
# TODO: DataFrame, groupby mean, optional plot
"""

    static let week39 = """
# w39-live capstone — complete the lessons above first

# TODO 1: One-page capstone plan: goal, milestones, file list

print("Capstone title:")
# TODO: milestones, files, risks
"""

    static let week41 = """
# w41-live capstone — complete the lessons above first

# TODO 1: Calculator class with history and divide-by-zero handling

class Calculator:
    def __init__(self):
        self.history = []

    def calculate(self, a, op, b):
        # TODO: try/except ZeroDivisionError, append history
        pass
"""

    static let week42 = """
# w42-live capstone — complete the lessons above first

# TODO 1: Text adventure: Game class with move/take/save using json

import json

class Game:
    def __init__(self):
        # TODO: room, inventory
        pass

    def move(self, direction):
        # TODO
        pass

    def save(self, filename="savegame.json"):
        # TODO
        pass
"""

    static let week43 = """
# w43-live capstone — complete the lessons above first

# TODO 1: bubble_sort_visual that prints each swap and counts steps

import time

def bubble_sort_visual(arr):
    # TODO: print swaps, return sorted list and step count
    pass

data = [5, 1, 4, 2, 8]
# TODO: run and print timing
"""

    static let week44 = """
# w44-live capstone — complete the lessons above first

# TODO 1: BFS pathfinding on a grid from S to G

from collections import deque

grid = ["S...", ".#..", "...G"]
# TODO: BFS with queue, print path
"""

    static let week45 = """
# w45-live capstone — complete the lessons above first

# TODO 1: Load weather CSV/features; train simple ML model; report accuracy

# pip3 install pandas scikit-learn
# TODO: read data, fit model, print metric
"""

    static let week46 = """
# w46-live capstone — complete the lessons above first

# TODO 1: Custom Tkinter dashboard with sections and refresh button

import tkinter as tk
# TODO: layout, labels, refresh command
"""

    static let week47 = """
# w47-live capstone — complete the lessons above first

# TODO 1: Wire your best project pieces into one demo-ready app

print("Portfolio integration plan:")
# TODO: which projects to combine, one working feature today
"""

    static let week48 = """
# w48-live capstone — complete the lessons above first

# TODO 1: Write README.md outline: install, run, screenshot

print("# Project Name")
# TODO: ## Install, ## Run, ## Features
"""

    static let week49 = """
# w49-live capstone — complete the lessons above first

# TODO 1: Sprint 2 checklist: error handling, README, docstrings, edge-case test

print("=== Sprint 2 Checklist ===")
# TODO: mark each item as you complete it
"""

    static func starter(for week: Int, fallback: String?) -> String? {
        switch week {
        case 11: return week11
        case 12: return week12
        case 13: return week13
        case 14: return week14
        case 15: return week15
        case 16: return week16
        case 17: return week17
        case 18: return week18
        case 19: return week19
        case 21: return week21
        case 22: return week22
        case 23: return week23
        case 24: return week24
        case 25: return week25
        case 26: return week26
        case 27: return week27
        case 28: return week28
        case 29: return week29
        case 31: return week31
        case 32: return week32
        case 33: return week33
        case 34: return week34
        case 35: return week35
        case 36: return week36
        case 37: return week37
        case 38: return week38
        case 39: return week39
        case 41: return week41
        case 42: return week42
        case 43: return week43
        case 44: return week44
        case 45: return week45
        case 46: return week46
        case 47: return week47
        case 48: return week48
        case 49: return week49
        default: return fallback
        }
    }
}
