import Foundation

enum CurriculumSeed {
    static let outcomes: [OutcomeGoal] = [
        OutcomeGoal(id: "o1", title: "Write Python independently", detail: "Open a file, run code, fix errors without step-by-step help."),
        OutcomeGoal(id: "o2", title: "Build 4–5 games", detail: "Text games first, then pygame games with graphics, sound, and scoring."),
        OutcomeGoal(id: "o3", title: "Understand core logic", detail: "Variables, if/else, loops, functions, lists, and game loops."),
        OutcomeGoal(id: "o4", title: "Live class skills", detail: "GUI (Tkinter), data viz, web apps (Flask), and presenting your projects."),
        OutcomeGoal(id: "o5", title: "Ready for what's next", detail: "Scratch → AI tools → app development with confidence."),
    ]

    static let finalChallenge: [FinalChallengeRequirement] = [
        FinalChallengeRequirement(
            id: "fc-sound",
            title: "Add sound",
            detail: "Play a sound when Soha collects a coin or wins the level.",
            hint: "Use pygame.mixer.Sound and sound.play() after loading a .wav file.",
            starterSnippet: """
import pygame
pygame.mixer.init()
coin_sound = pygame.mixer.Sound("coin.wav")
# inside your coin pickup:
coin_sound.play()
"""
        ),
        FinalChallengeRequirement(
            id: "fc-coins",
            title: "Add 3 coins",
            detail: "Place exactly three coins on the map. The player must collect all three to win.",
            hint: "Use a list of (x, y) positions and remove each coin when the player touches it.",
            starterSnippet: """
coins = [(100, 80), (200, 150), (320, 90)]
score = 0

# when player hits a coin position:
coins.remove(hit_coin)
score += 1
if score == 3:
    print("You win!")
"""
        ),
        FinalChallengeRequirement(
            id: "fc-timer",
            title: "Add timer",
            detail: "Count down seconds. If time hits zero before all coins are collected, show Game Over.",
            hint: "Track start time with pygame.time.get_ticks() or subtract 1 each second in your game loop.",
            starterSnippet: """
import time
time_left = 30  # seconds

# each frame or each second:
time_left -= 1
if time_left <= 0:
    print("Time's up!")
"""
        ),
    ]

    static let games: [GameProject] = [
        GameProject(
            id: "game-guess",
            title: "Guess the Number",
            weekNumber: 5,
            summary: "Computer picks 1–100. Player guesses until correct.",
            skills: ["input()", "if/else", "while loop", "random"],
            steps: [
                "Import random and pick secret = random.randint(1, 100)",
                "Loop: ask for a guess with input()",
                "Compare guess to secret — print Too high / Too low / You win!",
                "Count guesses and celebrate when correct",
            ],
            starterCode: """
import random

secret = random.randint(1, 100)
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
        print(f"You got it in {guesses} tries!")
        break
""",
            stretchGoal: "Add a maximum of 7 guesses before Game Over.",
            codeTests: [
                CodeTest(
                    id: "guess-random",
                    label: "Uses random.randint",
                    assertionScript: """
assert "random" in user_code
assert "randint" in user_code
assert "secret" in user_code
""",
                    inspectSourceOnly: true
                ),
                CodeTest(
                    id: "guess-loop",
                    label: "Has a while loop and guesses counter",
                    assertionScript: """
assert "while" in user_code
assert "guesses" in user_code
""",
                    inspectSourceOnly: true
                ),
            ]
        ),
        GameProject(
            id: "game-rps",
            title: "Rock Paper Scissors",
            weekNumber: 5,
            summary: "Best-of-3 against the computer.",
            skills: ["random.choice", "if/elif", "score variable"],
            steps: [
                "Store choices in a list",
                "Loop 3 rounds: player types choice, computer picks random",
                "Compare with if/elif rules",
                "Track wins for player vs computer",
            ],
            starterCode: """
import random

choices = ["rock", "paper", "scissors"]
player_score = 0
computer_score = 0

for round_num in range(1, 4):
    player = input("Rock, paper, or scissors? ").lower()
    computer = random.choice(choices)
    print(f"Computer chose {computer}")

    if player == computer:
        print("Tie!")
    elif (player == "rock" and computer == "scissors") or \\
         (player == "paper" and computer == "rock") or \\
         (player == "scissors" and computer == "paper"):
        print("You win this round!")
        player_score += 1
    else:
        print("Computer wins this round!")
        computer_score += 1

print(f"Final: You {player_score} — Computer {computer_score}")
""",
            stretchGoal: "Reject invalid input and ask again.",
            codeTests: [
                CodeTest(
                    id: "rps-choices",
                    label: "Defines choices and score variables",
                    assertionScript: """
assert "choices" in user_code
assert "player_score" in user_code
assert "computer_score" in user_code
""",
                    inspectSourceOnly: true
                ),
            ]
        ),
        GameProject(
            id: "game-quiz",
            title: "Science Quiz Game",
            weekNumber: 6,
            summary: "Science Bowl–style multiple-choice quiz with a score counter.",
            skills: ["lists", "for loop", "functions", "NSB toss-ups"],
            steps: [
                "Make a list of questions (each question is a small tuple)",
                "Loop through questions and print options A/B/C style",
                "Check answer and add to score",
                "Print final score — aim for 5/5!",
            ],
            starterCode: """
# Science Bowl–style toss-ups (multiple choice)
questions = [
    ("What gas do plants release during photosynthesis?", ["Oxygen", "Carbon dioxide", "Nitrogen"], 0),
    ("H2O is the chemical formula for?", ["Salt", "Water", "Hydrogen gas"], 1),
    ("Speed equals distance divided by?", ["Time", "Mass", "Volume"], 0),
    ("What organelle is the powerhouse of the cell?", ["Nucleus", "Mitochondria", "Ribosome"], 1),
    ("Which planet is known as the Red Planet?", ["Venus", "Mars", "Jupiter"], 1),
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
        print(f"Nope — it was {options[correct]}")

print(f"\\nYou scored {score} / {len(questions)}")
""",
            stretchGoal: "Wrap the quiz in a function run_quiz() and add 2 more NSB questions.",
            codeTests: [
                CodeTest(
                    id: "quiz-questions",
                    label: "At least 5 Science Bowl questions",
                    assertionScript: """
assert "questions" in user_code
assert user_code.count("(") >= 5
""",
                    inspectSourceOnly: true
                ),
                CodeTest(
                    id: "quiz-score",
                    label: "Tracks score in a loop",
                    assertionScript: """
assert "score" in user_code
assert "for" in user_code
""",
                    inspectSourceOnly: true
                ),
            ]
        ),
        GameProject(
            id: "game-maze",
            title: "Treasure Hunt (text)",
            weekNumber: 7,
            summary: "Move N/S/E/W on a grid until you find treasure.",
            skills: ["2D list", "coordinates", "game state"],
            steps: [
                "Player starts at (0,0) on a small grid",
                "Read direction commands",
                "Check walls and boundaries",
                "Win when player reaches treasure cell",
            ],
            starterCode: """
player_x, player_y = 0, 0
treasure_x, treasure_y = 2, 2
size = 3

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
    print(f"Position: ({player_x}, {player_y})")

print("You found the treasure!")
""",
            stretchGoal: "Add one trap cell that sends you back to start.",
            codeTests: [
                CodeTest(
                    id: "maze-coords",
                    label: "Tracks player and treasure coordinates",
                    assertionScript: """
assert "player" in user_code or "player_x" in user_code
assert "treasure" in user_code or "treasure_x" in user_code
assert "while" in user_code
""",
                    inspectSourceOnly: true
                ),
            ]
        ),
        GameProject(
            id: "game-coins",
            title: "Coin Collector (Final Game)",
            weekNumber: 8,
            summary: "pygame game: move a sprite, collect 3 coins, beat the timer, hear sounds.",
            skills: ["pygame", "game loop", "collision", "sound", "timer"],
            steps: [
                "Install pygame once: pip3 install pygame",
                "Draw player rectangle and move with arrow keys",
                "Draw 3 coin circles at fixed positions",
                "Detect collision — remove coin, play sound, add score",
                "Add countdown timer on screen",
                "Show Win or Game Over",
            ],
            starterCode: """
# pip3 install pygame  (run once in Terminal)
import pygame
import sys

pygame.init()
screen = pygame.display.set_mode((400, 300))
clock = pygame.time.Clock()
font = pygame.font.SysFont(None, 28)

player = pygame.Rect(50, 130, 30, 30)
coins = [pygame.Rect(120, 60, 20, 20), pygame.Rect(250, 140, 20, 20), pygame.Rect(180, 220, 20, 20)]
score = 0
time_left = 30
running = True

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:  player.x -= 4
    if keys[pygame.K_RIGHT]: player.x += 4
    if keys[pygame.K_UP]:    player.y -= 4
    if keys[pygame.K_DOWN]:  player.y += 4

    for coin in coins[:]:
        if player.colliderect(coin):
            coins.remove(coin)
            score += 1
            print("Coin!", score)

    screen.fill((30, 30, 50))
    pygame.draw.rect(screen, (100, 200, 255), player)
    for coin in coins:
        pygame.draw.ellipse(screen, (255, 215, 0), coin)
    screen.blit(font.render(f"Coins: {score}/3  Time: {time_left}", True, (255,255,255)), (10, 10))
    pygame.display.flip()
    clock.tick(30)
    time_left -= 1/30
    if score == 3 or time_left <= 0:
        running = False

pygame.quit()
if score == 3:
    print("You win!")
else:
    print("Time's up!")
""",
            stretchGoal: "Add coin.wav sound and a restart button.",
            codeTests: [
                CodeTest(
                    id: "coins-pygame",
                    label: "Uses pygame with 3 coins",
                    assertionScript: """
assert "pygame" in user_code
assert user_code.count("coin") >= 3
assert "time_left" in user_code or "timer" in user_code.lower()
""",
                    inspectSourceOnly: true
                ),
            ]
        ),
    ]

    static let weeks: [WeekUnit] = [
        week1, week2, week3, week4, week5, week6, week7, week8, week9, week10,
    ]

    // MARK: - Outschool live lessons (60 min each)

    private static func outschoolLive(
        week: Int,
        sessionNumber: Int,
        title: String,
        body: String,
        teacherScript: String,
        tryItPrompt: String? = nil,
        starterCode: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil,
        codeTests: [CodeTest]? = nil
    ) -> LessonStep {
        LessonStep(
            id: "w\(week)-live",
            title: "Live Lesson \(sessionNumber): \(title)",
            body: body,
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            format: .liveOnline,
            durationMinutes: 60
        )
    }

    private static let live1 = outschoolLive(
        week: 1,
        sessionNumber: 1,
        title: "Foundations of Python Programming",
        body: """
Review variables, conditional statements, and functions. Apply them in a Fizz Buzz mini-project and explore nested conditionals. Finish with scope, the global keyword, and the pass statement — a solid foundation for the rest of the course.

60 min online live lesson with instructor.
""",
        teacherScript: "Before class: confirm Zoom/Outschool link and that python3 works. After class, have Soha run Fizz Buzz in the Playground without looking at notes.",
        tryItPrompt: "After live class: run Fizz Buzz for numbers 1–20 in Playground.",
        starterCode: """
# Fizz Buzz — print 1 to 20
for n in range(1, 21):
    if n % 15 == 0:
        print("FizzBuzz")
    elif n % 3 == 0:
        print("Fizz")
    elif n % 5 == 0:
        print("Buzz")
    else:
        print(n)
""",
        challengeQuestion: "In Fizz Buzz, what do you print when n is divisible by both 3 and 5?",
        challengeAnswer: "FizzBuzz",
        challengeAcceptedAnswers: ["fizzbuzz"]
    )

    private static let live2 = outschoolLive(
        week: 2,
        sessionNumber: 2,
        title: "Planning and Project Development",
        body: """
Learn why planning matters in coding. Use flowcharts and brainstorming to break problems down. Main project: Outschool Pizza Shop — a multi-day build that reinforces variables, input, and conditionals in a practical context.

60 min online live lesson with instructor.
""",
        teacherScript: "Ask Soha to explain her Pizza Shop plan in her own words before coding. Save the flowchart photo in week notes.",
        tryItPrompt: "Sketch a flowchart on paper before opening Playground.",
        starterCode: """
# Pizza Shop order taker
menu = {"cheese": 8, "pepperoni": 10, "veggie": 9}
order = []

print("Welcome to Soha's Pizza!")
while True:
    choice = input("Pick (cheese/pepperoni/veggie/done): ").lower()
    if choice == "done":
        break
    if choice in menu:
        order.append(choice)
        print("Added", choice)
    else:
        print("Not on menu.")

total = sum(menu[pizza] for pizza in order)
print("Order:", order)
print("Total: $", total)
""",
        challengeQuestion: "What planning tool helps break a big project into steps?",
        challengeAnswer: "flowchart",
        challengeAcceptedAnswers: ["brainstorm", "brainstorming"]
    )

    private static let live3 = outschoolLive(
        week: 3,
        sessionNumber: 3,
        title: "Advanced Python Concepts",
        body: """
Explore Python methods — string and math methods. Learn ternary operators for concise conditionals. Study Python keywords and reserved words to write cleaner, more readable code.

60 min online live lesson with instructor.
""",
        teacherScript: "Have Soha predict what .strip() and .title() do before running. Compare if/else vs ternary for the same problem.",
        starterCode: """
name = "  soha  "
print("Clean name:", name.strip().title())
print("Absolute value:", abs(-7))

grade = 85
letter = "A" if grade >= 90 else "B" if grade >= 80 else "C"
print("Grade:", letter)

# Reserved words — you cannot use these as variable names:
# if, else, def, class, import, return, ...
""",
        challengeQuestion: "What does the ternary operator let you write in one line?",
        challengeAnswer: "if else",
        challengeAcceptedAnswers: ["conditional", "if/else"]
    )

    private static let live4 = outschoolLive(
        week: 4,
        sessionNumber: 4,
        title: "File Operations and Loops",
        body: """
Read from, write to, and append to files. Create your own files and manipulate data inside them. Comprehensive loop review with a focus on while loops for repetitive tasks and data processing.

60 min online live lesson with instructor.
""",
        teacherScript: "After class, open the saved file in TextEdit together so Soha sees the file on disk matches her code.",
        tryItPrompt: "Find notes.txt in Application Support scripts folder after saving.",
        starterCode: """
filename = "notes.txt"

with open(filename, "w") as f:
    f.write("Hello from Soha!\\n")

with open(filename, "a") as f:
    f.write("Python files are just text.\\n")

with open(filename) as f:
    content = f.read()
    print("File contents:")
    print(content)

# while loop review
count = 0
while count < 3:
    print("Loop round", count + 1)
    count += 1
""",
        challengeQuestion: "Which mode opens a file for appending without erasing it?",
        challengeAnswer: "a",
        challengeAcceptedAnswers: ["append", "a mode"]
    )

    private static let live5 = outschoolLive(
        week: 5,
        sessionNumber: 5,
        title: "Data Structures and Advanced Function Concepts",
        body: """
Introduce tuples as a data structure. Learn function default parameters, return statements, and variable arguments (*args) for flexible, powerful functions.

60 min online live lesson with instructor.
""",
        teacherScript: "Compare list vs tuple — why might coordinates be a tuple? Demo *args with different numbers of arguments.",
        starterCode: """
# Tuples — ordered, cannot change items
point = (3, 4)
print("x:", point[0], "y:", point[1])

def greet(name, greeting="Hello"):
    print(greeting + ",", name)

greet("Soha")
greet("Soha", "Hi")

def total(*numbers):
    return sum(numbers)

print("Sum:", total(1, 2, 3, 4))
print("Sum:", total(10, 20))
""",
        challengeQuestion: "What symbol collects extra arguments into a tuple?",
        challengeAnswer: "*args",
        challengeAcceptedAnswers: ["star args", "asterisk"]
    )

    private static let live6 = outschoolLive(
        week: 6,
        sessionNumber: 6,
        title: "Graphical User Interfaces with Python",
        body: """
GUI development with Tkinter: windows, buttons, labels, and events. Main project: Outschool Interactive Calendar Application — apply GUI skills in a practical, engaging build.

60 min online live lesson with instructor.
""",
        teacherScript: "Tkinter runs in a window — use Run game window or Terminal like pygame. Celebrate the first button click!",
        tryItPrompt: "Add a second button that prints today's date.",
        starterCode: """
import tkinter as tk

root = tk.Tk()
root.title("Soha Calendar")
root.geometry("300x200")

tk.Label(root, text="March 2026", font=("Arial", 16)).pack(pady=10)
tk.Button(root, text="Today", command=lambda: print("Today clicked!")).pack(pady=5)
tk.Button(root, text="Quit", command=root.destroy).pack(pady=5)

root.mainloop()
""",
        challengeQuestion: "Which Python library is used for basic GUIs in this lesson?",
        challengeAnswer: "tkinter",
        challengeAcceptedAnswers: ["Tkinter"]
    )

    private static let live7 = outschoolLive(
        week: 7,
        sessionNumber: 7,
        title: "Introduction to Data Science with Python",
        body: """
Introduction to data science: graphing with NumPy and Matplotlib. Build a Python Graph Application to analyze and visualize real-world data.

60 min online live lesson with instructor.
""",
        teacherScript: "Before class: pip3 install matplotlib numpy. Connect graphs to Science Bowl — plot practice quiz scores over time.",
        tryItPrompt: "pip3 install matplotlib numpy",
        starterCode: """
# pip3 install matplotlib numpy
import matplotlib.pyplot as plt

quiz_scores = [70, 85, 90, 88, 92]
days = [1, 2, 3, 4, 5]

plt.plot(days, quiz_scores, marker="o")
plt.title("Science Quiz Scores")
plt.xlabel("Week")
plt.ylabel("Score")
plt.ylim(0, 100)
plt.show()
""",
        challengeQuestion: "Which library draws graphs in this lesson?",
        challengeAnswer: "matplotlib",
        challengeAcceptedAnswers: ["pyplot"]
    )

    private static let live8 = outschoolLive(
        week: 8,
        sessionNumber: 8,
        title: "Game Development with PyGame Zero",
        body: """
Game development with PyGame Zero: game loops, sprites, and event handling. Documentation matters! Apply concepts in a Space Explorer Game — simple but engaging.

60 min online live lesson with instructor.
""",
        teacherScript: "Link to Coin Collector Final Boss — same ideas: loop, sprites, events. Compare pygame vs pgzero syntax after class.",
        tryItPrompt: "After live class, add one sprite to your Coin Collector game.",
        starterCode: """
# Space Explorer — plan before coding
# pip3 install pgzero   OR continue with pygame from Final Boss

print("=== Space Explorer Plan ===")
print("1. Game loop (update every frame)")
print("2. Player ship sprite + movement")
print("3. Asteroid sprites + collision")
print("4. Score + game over screen")
print("5. Read docs: pygame.org or pgzero.readthedocs.io")
""",
        challengeQuestion: "Name two things every game loop needs to handle.",
        challengeAnswer: "events update",
        challengeAcceptedAnswers: ["events and update", "input and draw", "sprites events"]
    )

    private static let live9 = outschoolLive(
        week: 9,
        sessionNumber: 9,
        title: "Web Development with Python Flask",
        body: """
Web development with Flask: set up a server, handle routes, and work with HTML templates. Begin the Todo List Application — form handling and basic data storage.

60 min online live lesson with instructor.
""",
        teacherScript: "Flask runs in Terminal, not the in-app Playground. After class, bookmark localhost page together.",
        tryItPrompt: "pip3 install flask — then save and run in Terminal.",
        starterCode: """
# pip3 install flask
# Save as todo_app.py and run: python3 todo_app.py
# Open http://127.0.0.1:5000 in Safari

from flask import Flask, request, redirect

app = Flask(__name__)
todos = []

@app.route("/")
def home():
    items = "".join(f"<li>{t}</li>" for t in todos)
    form = '<form action="/add" method="post"><input name="task"><button>Add</button></form>'
    return f"<h1>Soha Todo List</h1><ul>{items}</ul>{form}"

@app.route("/add", methods=["POST"])
def add():
    task = request.form.get("task", "").strip()
    if task:
        todos.append(task)
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)
""",
        challengeQuestion: "What URL do you open to see your Flask app locally?",
        challengeAnswer: "127.0.0.1:5000",
        challengeAcceptedAnswers: ["localhost:5000", "localhost"]
    )

    private static let live10 = outschoolLive(
        week: 10,
        sessionNumber: 10,
        title: "Project Completion and Student Presentations",
        body: """
Complete the Todo List Application — final features and basic styling. Present your final project: demo what you learned across all 10 live lessons and get feedback.

60 min online live lesson with instructor.
""",
        teacherScript: "Practice the 2-minute demo at home first. Progress tab → export backup before presentation day.",
        tryItPrompt: "Rehearse: 30 sec intro · 60 sec demo · 30 sec what you learned.",
        starterCode: """
print("=== Presentation Checklist ===")
print("[ ] Todo app adds and shows tasks")
print("[ ] Added CSS or styling")
print("[ ] Tested in browser")
print("[ ] 2-minute demo rehearsed")
print("[ ] Ready to show Coin Collector OR Todo app")
print()
print("What I learned:")
print("- Fizz Buzz & functions")
print("- Pizza Shop planning")
print("- Files, GUIs, graphs, games, Flask")
""",
        challengeQuestion: "How long should your live demo be?",
        challengeAnswer: "2 minutes",
        challengeAcceptedAnswers: ["two minutes", "2 min"]
    )

    private static let week1 = WeekUnit(
        id: 1,
        title: "Hello, Python!",
        subtitle: "Print, variables, and your first program",
        emoji: "👋",
        goal: "Run Python and make the computer talk back.",
        skills: ["print()", "strings", "variables", "Fizz Buzz", "scope"],
        lessons: [
            LessonStep(
                id: "w1-l1",
                title: "What is Python?",
                body: "Python is a language you type — like giving the computer a recipe. You write code in a file, run it, and see results instantly.",
                teacherScript: "Today we're programmers. Python is how we tell the Mac what to do. No magic — just clear instructions.",
                tryItPrompt: "Open Terminal and type: python3 --version",
                starterCode: "print(\"Hello, Soha!\")\nprint(\"I am learning Python!\")",
                challengeQuestion: "What function shows text on the screen?",
                challengeAnswer: "print",
                challengeAcceptedAnswers: ["print()", "print function"],
                codeTests: [
                    CodeTest(
                        id: "w1-l1-prints",
                        label: "Uses print() at least twice",
                        assertionScript: "assert user_code.count('print') >= 2",
                        inspectSourceOnly: true
                    ),
                ]
            ),
            LessonStep(
                id: "w1-l2",
                title: "Variables = labeled boxes",
                body: "A variable stores a value. name = \"Soha\" puts the text Soha in a box labeled name.",
                teacherScript: "Think of variables as sticky notes on boxes. The label is the variable name; what's inside is the value.",
                tryItPrompt: nil,
                starterCode: """
name = "Soha"
age = 12
print(name)
print("Next year:", age + 1)
""",
                challengeQuestion: "If score = 10 and you run score = score + 5, what is score?",
                challengeAnswer: "15",
                challengeAcceptedAnswers: ["fifteen"],
                codeTests: [
                    CodeTest(
                        id: "w1-l2-vars",
                        label: "Defines name and age variables",
                        assertionScript: """
assert "name" in user_code
assert "age" in user_code
""",
                        inspectSourceOnly: true
                    ),
                    CodeTest(
                        id: "w1-l2-run",
                        label: "score ends at 15",
                        assertionScript: """
score = 10
score = score + 5
assert score == 15
"""
                    ),
                ]
            ),
            LessonStep(
                id: "w1-l3",
                title: "Mini project: About Me",
                body: "Combine print and variables to make a short bio program.",
                teacherScript: "Let's build something that's yours — not a copy from a worksheet.",
                tryItPrompt: "Add your favorite subject and hobby.",
                starterCode: """
print("=== About Me ===")
name = "Soha"
grade = 7
print("Name:", name)
print("Grade:", grade)
print("Favorite color: blue")
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live1,
        ]
    )

    private static let week2 = WeekUnit(
        id: 2,
        title: "Decisions",
        subtitle: "input() and if / else",
        emoji: "🔀",
        goal: "Programs that react to what the user types.",
        skills: ["input()", "int()", "if", "else", "elif", "flowcharts", "planning"],
        lessons: [
            LessonStep(
                id: "w2-l1",
                title: "Ask the user",
                body: "input() waits for keyboard text. Wrap with int() when you need a number.",
                teacherScript: "Before, programs only talked. Now they listen.",
                tryItPrompt: nil,
                starterCode: """
name = input("What is your name? ")
print("Hi", name + "!")
""",
                challengeQuestion: "Which function reads text from the user?",
                challengeAnswer: "input",
                challengeAcceptedAnswers: ["input()"]
            ),
            LessonStep(
                id: "w2-l2",
                title: "if / else",
                body: "Run different code depending on a condition. Use == to compare, not =.",
                teacherScript: "If the condition is True, do this block. Otherwise, do that block.",
                tryItPrompt: nil,
                starterCode: """
score = int(input("Quiz score (0-100): "))
if score >= 90:
    print("A — amazing!")
elif score >= 80:
    print("B — great job!")
else:
    print("Keep practicing — you got this!")
""",
                challengeQuestion: "Which symbol checks equality?",
                challengeAnswer: "==",
                challengeAcceptedAnswers: ["double equals", "equals equals"]
            ),
            LessonStep(
                id: "w2-l3",
                title: "Mini project: Password Gate",
                body: "Only print the secret message if the password matches.",
                teacherScript: "Real apps use this idea — checking before showing something.",
                tryItPrompt: "Add a second wrong-try message.",
                starterCode: """
password = input("Enter password: ")
if password == "python":
    print("Access granted!")
else:
    print("Wrong password.")
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live2,
        ]
    )

    private static let week3 = WeekUnit(
        id: 3,
        title: "Loops",
        subtitle: "Repeat without copy-paste",
        emoji: "🔁",
        goal: "Use while and for to repeat actions.",
        skills: ["while", "for", "range()", "methods", "ternary"],
        lessons: [
            LessonStep(
                id: "w3-l1",
                title: "while loops",
                body: "Repeat while a condition is True. Always make sure the loop can end!",
                teacherScript: "Loops are how games run frame after frame.",
                tryItPrompt: nil,
                starterCode: """
count = 1
while count <= 5:
    print("Count is", count)
    count += 1
print("Done!")
""",
                challengeQuestion: "What happens if you forget count += 1 in a while True loop?",
                challengeAnswer: "infinite loop",
                challengeAcceptedAnswers: ["never stops", "runs forever", "endless loop"]
            ),
            LessonStep(
                id: "w3-l2",
                title: "for loops",
                body: "for i in range(5) repeats 5 times with i = 0,1,2,3,4.",
                teacherScript: "When you know how many times, for is cleaner than while.",
                tryItPrompt: nil,
                starterCode: """
for i in range(3):
    print("Round", i + 1)
    print("Buzz!")
""",
                challengeQuestion: "How many times does range(4) loop?",
                challengeAnswer: "4",
                challengeAcceptedAnswers: ["four", "4 times"]
            ),
            LessonStep(
                id: "w3-l3",
                title: "Mini project: Multiplication Table",
                body: "Print one number's times table from 1 to 10.",
                teacherScript: "Nested loops come later — one loop is enough today.",
                tryItPrompt: "Change n to your favorite number.",
                starterCode: """
n = 7
for i in range(1, 11):
    print(n, "x", i, "=", n * i)
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live3,
        ]
    )

    private static let week4 = WeekUnit(
        id: 4,
        title: "Functions",
        subtitle: "Reusable blocks of code",
        emoji: "🧩",
        goal: "Write def functions you can call many times.",
        skills: ["def", "parameters", "return", "files", "read/write"],
        lessons: [
            LessonStep(
                id: "w4-l1",
                title: "Define a function",
                body: "def greet(name): groups code under one name. Call it with greet(\"Soha\").",
                teacherScript: "Functions are like custom LEGO pieces you build once and reuse.",
                tryItPrompt: nil,
                starterCode: """
def greet(name):
    print("Hello,", name, "!")

greet("Soha")
greet("Python")
""",
                challengeQuestion: "What keyword starts a function definition?",
                challengeAnswer: "def",
                codeTests: [
                    CodeTest(
                        id: "w4-l1-def",
                        label: "Defines greet() function",
                        assertionScript: """
assert "def greet" in user_code
""",
                        inspectSourceOnly: true
                    ),
                ]
            ),
            LessonStep(
                id: "w4-l2",
                title: "return values",
                body: "return sends a result back. area = rectangle_area(4, 5) stores the answer.",
                teacherScript: "Some functions do something; some functions calculate and give back a value.",
                tryItPrompt: nil,
                starterCode: """
def add(a, b):
    return a + b

total = add(3, 7)
print("Sum:", total)
""",
                challengeQuestion: "What keyword sends a value back from a function?",
                challengeAnswer: "return"
            ),
            LessonStep(
                id: "w4-l3",
                title: "Mini project: Calculator functions",
                body: "Write add, subtract, multiply as separate functions.",
                teacherScript: "This is how real programs stay organized.",
                tryItPrompt: "Add a divide function that checks for zero.",
                starterCode: """
def multiply(a, b):
    return a * b

print(multiply(6, 7))
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live4,
        ]
    )

    private static let week5 = WeekUnit(
        id: 5,
        title: "First Games",
        subtitle: "Guess the Number & Rock Paper Scissors",
        emoji: "🎮",
        goal: "Combine everything into playable text games.",
        skills: ["random", "game loop", "score", "tuples", "*args"],
        lessons: [
            LessonStep(
                id: "w5-l1",
                title: "Random numbers",
                body: "import random then random.randint(1, 10) picks a surprise number.",
                teacherScript: "Games need unpredictability — that's what random gives us.",
                tryItPrompt: nil,
                starterCode: """
import random
dice = random.randint(1, 6)
print("You rolled", dice)
""",
                challengeQuestion: "Which module gives random numbers?",
                challengeAnswer: "random",
                challengeAcceptedAnswers: ["import random"]
            ),
            LessonStep(
                id: "w5-l2",
                title: "Build: Guess the Number",
                body: "Open the Games tab for the full step-by-step. Today: get a working version in Playground.",
                teacherScript: "Walk through one round together before Soha codes solo.",
                tryItPrompt: "Complete Game 1 in the Games tab.",
                starterCode: games[0].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w5-l3",
                title: "Build: Rock Paper Scissors",
                body: "Second game — best of 3 rounds with a score counter.",
                teacherScript: "Notice how the same patterns repeat: input, compare, update score.",
                tryItPrompt: "Complete Game 2 in the Games tab.",
                starterCode: games[1].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live5,
        ]
    )

    private static let week6 = WeekUnit(
        id: 6,
        title: "Lists & Quiz Game",
        subtitle: "Store many items in one variable",
        emoji: "📋",
        goal: "Use lists to power a quiz game.",
        skills: ["lists", "index", "len()", "Tkinter", "GUI"],
        lessons: [
            LessonStep(
                id: "w6-l1",
                title: "Lists",
                body: "scores = [10, 20, 30] holds multiple values. scores[0] is the first item.",
                teacherScript: "Lists are how we store inventories, questions, and high scores.",
                tryItPrompt: nil,
                starterCode: """
fruits = ["apple", "banana", "cherry"]
print(fruits[0])
fruits.append("date")
print(fruits)
""",
                challengeQuestion: "What index is the first item in a Python list?",
                challengeAnswer: "0",
                challengeAcceptedAnswers: ["zero"],
                codeTests: [
                    CodeTest(
                        id: "w6-l1-list",
                        label: "Creates a list and uses append",
                        assertionScript: """
assert "fruits" in user_code or "[" in user_code
assert "append" in user_code
""",
                        inspectSourceOnly: true
                    ),
                ]
            ),
            LessonStep(
                id: "w6-l2",
                title: "Loop through a list",
                body: "for item in my_list: visits each element.",
                teacherScript: "This pattern shows up in almost every game menu and quiz.",
                tryItPrompt: nil,
                starterCode: """
colors = ["red", "green", "blue"]
for c in colors:
    print("I like", c)
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w6-l3",
                title: "Build: Science Quiz Game",
                body: "Game 3 — Science Bowl–style multiple choice with 5 toss-ups and a running score.",
                teacherScript: "Connect to Science Bowl prep — she already knows these topics! Add her own toss-ups from DOE practice.",
                tryItPrompt: "Add 2 more science questions from your NSB prep.",
                starterCode: games[2].starterCode,
                challengeQuestion: "How many questions are in the starter quiz?",
                challengeAnswer: "5",
                challengeAcceptedAnswers: ["five"]
            ),
            live6,
        ]
    )

    private static let week7 = WeekUnit(
        id: 7,
        title: "Maps & pygame intro",
        subtitle: "Coordinates and graphics",
        emoji: "🗺️",
        goal: "Move from text games to a window with shapes.",
        skills: ["coordinates", "pygame basics", "event loop", "matplotlib", "numpy"],
        lessons: [
            LessonStep(
                id: "w7-l1",
                title: "Coordinates",
                body: "On screen, (0,0) is top-left. x goes right, y goes down.",
                teacherScript: "Draw a quick sketch on paper before coding — it helps every time.",
                tryItPrompt: nil,
                starterCode: """
# Text version: track x,y on a grid
x, y = 0, 0
print("Start at", x, y)
x += 1
print("Moved right:", x, y)
""",
                challengeQuestion: "On a screen, which direction does y increase?",
                challengeAnswer: "down"
            ),
            LessonStep(
                id: "w7-l2",
                title: "pygame window",
                body: "pip3 install pygame once. Then open a window and draw a rectangle.",
                teacherScript: "First run might feel slow — that's normal. Celebrate the window appearing!",
                tryItPrompt: "Run: pip3 install pygame",
                starterCode: """
import pygame
pygame.init()
screen = pygame.display.set_mode((300, 200))
screen.fill((40, 40, 80))
pygame.draw.rect(screen, (255, 100, 100), (50, 70, 40, 40))
pygame.display.flip()
input("Press Enter to close...")
pygame.quit()
""",
                challengeQuestion: "What pip command installs pygame?",
                challengeAnswer: "pip3 install pygame",
                challengeAcceptedAnswers: ["pip install pygame"]
            ),
            LessonStep(
                id: "w7-l3",
                title: "Build: Treasure Hunt",
                body: "Text grid game first — then optional pygame version later.",
                teacherScript: "Game 4 teaches state: where am I? where is the goal?",
                tryItPrompt: "Complete Game 4 in the Games tab.",
                starterCode: games[3].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live7,
        ]
    )

    private static let week8 = WeekUnit(
        id: 8,
        title: "Final Challenge",
        subtitle: "Sound · 3 coins · Timer",
        emoji: "🏆",
        goal: "Ship the capstone Coin Collector game.",
        skills: ["game loop", "collision", "sound", "timer", "win/lose", "pgzero"],
        lessons: [
            LessonStep(
                id: "w8-l1",
                title: "Plan your game",
                body: "Before coding: sketch the player, 3 coin spots, timer display, and win screen.",
                teacherScript: "Five minutes of planning saves an hour of debugging.",
                tryItPrompt: "Open Final Boss tab and read all three requirements.",
                starterCode: "# Sketch on paper first!\nprint(\"My game plan:\")\nprint(\"1. Player moves with arrows\")\nprint(\"2. Three coins at fixed spots\")\nprint(\"3. 30 second timer\")",
                challengeQuestion: "Name the three Final Challenge requirements.",
                challengeAnswer: "sound coins timer",
                challengeAcceptedAnswers: [
                    "sound, coins, timer",
                    "sound 3 coins timer",
                    "add sound add 3 coins add timer",
                    "sound three coins timer",
                ]
            ),
            LessonStep(
                id: "w8-l2",
                title: "Build the core loop",
                body: "Player movement + coin collision + score. Get this working before sound and timer.",
                teacherScript: "One feature at a time — never add sound, timer, and coins all at once.",
                tryItPrompt: "Use starter code from Game 5.",
                starterCode: games[4].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w8-l3",
                title: "Add sound, 3 coins, timer",
                body: "Check off each requirement in the Final Boss tab. All three must work together.",
                teacherScript: "This is your portfolio piece — take a screen recording when it works!",
                tryItPrompt: "Mark all three checkboxes when done.",
                starterCode: games[4].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live8,
        ]
    )

    private static let week9 = WeekUnit(
        id: 9,
        title: "Web Development",
        subtitle: "Flask & Todo List app",
        emoji: "🌐",
        goal: "Build a web app that runs in the browser.",
        skills: ["Flask", "routes", "HTML", "forms", "localhost"],
        lessons: [
            LessonStep(
                id: "w9-l1",
                title: "How web apps work",
                body: "A Flask app runs a server on your Mac. The browser sends requests; Python sends back HTML pages.",
                teacherScript: "Compare to Science Bowl Coach — that's a native app; Flask is a website on your own computer.",
                tryItPrompt: "pip3 install flask",
                starterCode: """
print("Browser  →  request  →  Flask  →  HTML response")
print("Try: python3 todo_app.py then open Safari")
""",
                challengeQuestion: "What command installs Flask?",
                challengeAnswer: "pip3 install flask",
                challengeAcceptedAnswers: ["pip install flask"]
            ),
            live9,
            LessonStep(
                id: "w9-l3",
                title: "Extend your Todo app",
                body: "After live class: add delete tasks, mark complete, or a counter in the page title.",
                teacherScript: "One feature at a time. Save todo_app.py in the scripts folder.",
                tryItPrompt: "Add a route /clear that empties the todo list.",
                starterCode: live9.starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
        ]
    )

    private static let week10 = WeekUnit(
        id: 10,
        title: "Graduation & Presentations",
        subtitle: "Showcase your projects",
        emoji: "🎓",
        goal: "Ship the Todo app and present everything you built.",
        skills: ["presentation", "polish", "portfolio", "demo"],
        lessons: [
            LessonStep(
                id: "w10-l1",
                title: "Polish your Todo app",
                body: "Add styling, test every button, and fix bugs before presentation day.",
                teacherScript: "Good demos fail gracefully — have a backup screen recording.",
                tryItPrompt: "Add inline CSS: style the h1 and button colors.",
                starterCode: """
# In your Flask home() return string, wrap with:
# <style>body{font-family:sans-serif;background:#1a1a2e;color:white;}</style>
print("Polish checklist: styling · delete · mobile-friendly · tested")
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live10,
            LessonStep(
                id: "w10-l3",
                title: "Portfolio & next steps",
                body: "You completed 10 live lessons + self-paced games + Final Boss. Export progress and keep coding!",
                teacherScript: "Celebrate! Screenshot Coin Collector, Todo app, and quiz game for a portfolio folder.",
                tryItPrompt: "Progress tab → Export progress JSON as backup.",
                starterCode: """
print("=== Soha Python Portfolio ===")
print("1. Coin Collector (pygame)")
print("2. Science Quiz game")
print("3. Todo List (Flask)")
print("4. Tkinter Calendar")
print("Next: SwiftUI apps · AI tools · more Flask")
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
        ]
    )
}
