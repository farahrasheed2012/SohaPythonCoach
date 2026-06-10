import Foundation

enum CurriculumSeed {
    static let outcomes: [OutcomeGoal] = [
        OutcomeGoal(id: "o1", title: "Write Python independently", detail: "Open a file, run code, fix errors without step-by-step help."),
        OutcomeGoal(id: "o2", title: "Build 4–5 games", detail: "Text games first, then pygame games with graphics, sound, and scoring."),
        OutcomeGoal(id: "o3", title: "Understand core logic", detail: "Variables, if/else, loops, functions, lists, and game loops."),
        OutcomeGoal(id: "o4", title: "GUI & data skills", detail: "Tkinter, data viz, web apps (Flask), and presenting your projects."),
        OutcomeGoal(id: "o5", title: "Ready for what's next", detail: "Scratch → AI tools → app development with confidence."),
        OutcomeGoal(id: "o6", title: "Level 2 mastery", detail: "Error handling, OOP, APIs, pandas, matplotlib, and intro to machine learning."),
        OutcomeGoal(id: "o7", title: "Level 3 mastery", detail: "Tkinter GUIs, Tic-Tac-Toe, cipher app, recursion, APIs, and a final project."),
        OutcomeGoal(id: "o8", title: "Level 4 mastery", detail: "Paradigms, OOP, algorithms, data structures, AI/ML, APIs, and capstone planning."),
        OutcomeGoal(id: "o9", title: "Level 4 Portfolio", detail: "Seven portfolio projects plus final capstone and graduation showcase."),
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

    // `summerWeeks` is defined at the bottom after all track weeks (week1–week50).

    // MARK: - Project sessions (~30 min app lessons)

    static func teachingLesson(
        id: String,
        title: String,
        body: String,
        teacherScript: String,
        starterCode: String,
        tryItPrompt: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil,
        codeTests: [CodeTest]? = nil
    ) -> LessonStep {
        LessonStep(
            id: id,
            title: title,
            body: body,
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            format: .selfPaced,
            durationMinutes: nil
        )
    }

    private static func sessionWeek(_ teach: [LessonStep], _ session: LessonStep) -> [LessonStep] {
        teach + [session]
    }

    private static func sessionLesson(
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
        codeTests: [CodeTest]? = nil,
        sessionTitlePrefix: String = "Session"
    ) -> LessonStep {
        let capstoneBody = """
**Session capstone** — complete the lessons above in this week first, then finish the project below in Playground.

\(body)
"""
        return LessonStep(
            id: "w\(week)-live",
            title: "\(sessionTitlePrefix) \(sessionNumber): \(title)",
            body: capstoneBody,
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            format: .selfPaced,
            durationMinutes: 30
        )
    }

    private static let live1 = sessionLesson(
        week: 1,
        sessionNumber: 1,
        title: "Capstone: Your About Me program",
        body: """
**Session 1 goal:** Build a short program that introduces you — using only what you learned this week (`print` and variables).

**Checklist before you start**
- You completed the four lessons above (Python basics → variables → About Me → combining text).
- You can explain what a variable is in your own words.

**Your program should**
1. Print a title line (banner).
2. Store at least four facts in variables (name, grade, favorite subject, hobby).
3. Print each fact on its own line.
4. Print one closing sentence that uses at least two variables.

Open Playground, start from the scaffold below, and fill in the `# TODO` parts yourself. Run often — fix one error at a time.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Do not introduce loops or if statements today. If Soha finishes early, ask her to add favorite Science Bowl subject as a fifth variable. Mark complete when she can change a fact and re-run without help.",
        tryItPrompt: "Add: favorite_subject = \"Science\" and print it on its own line.",
        starterCode: """
# Session 1 capstone — finish this About Me program
print("=== About Me ===")

name = "Soha"
grade = 7
favorite_subject = "Science"
hobby = "Science Bowl"

print("Name:", name)
print("Grade:", grade)
# TODO: print favorite_subject and hobby
# TODO: one closing line, e.g. print(name, "loves", hobby)
""",
        challengeQuestion: "What function shows text on the screen?",
        challengeAnswer: "print",
        challengeAcceptedAnswers: ["print()"],
        codeTests: [
            CodeTest(
                id: "w1-live-about",
                label: "Defines at least 3 variables and uses print",
                assertionScript: """
assert user_code.count("print") >= 4
assert "name" in user_code
assert "grade" in user_code
""",
                inspectSourceOnly: true
            ),
        ]
    )

    private static let live2 = sessionLesson(
        week: 2,
        sessionNumber: 2,
        title: "Capstone: Pizza Shop planner",
        body: """
**Session 2 goal:** Build a text Pizza Shop that uses **input**, **if**, a **menu dict**, an **order list**, and a **while** loop.

Complete lessons w2-l1 through w2-l5 first.

**Steps**
1. Sketch a flowchart on paper (order loop → pick pizza → done → total).
2. Fill in the `# TODO` parts in Playground.
3. Test: one valid pizza, one invalid pizza, then done.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Ask Soha to explain her Pizza Shop plan before coding. Save the flowchart photo in week notes.",
        tryItPrompt: "Sketch a flowchart on paper before opening Playground.",
        starterCode: """
# Pizza Shop — finish the TODOs
menu = {"cheese": 8, "pepperoni": 10, "veggie": 9}
order = []

print("Welcome to Soha's Pizza!")
while True:
    choice = input("Pick (cheese/pepperoni/veggie/done): ").lower()
    # TODO: if choice is "done", break
    # TODO: if choice in menu, append to order and print "Added ..."
    # TODO: else print "Not on menu."

# TODO: compute total with sum(menu[pizza] for pizza in order)
print("Order:", order)
# print("Total: $", total)
""",
        challengeQuestion: "What planning tool helps break a big project into steps?",
        challengeAnswer: "flowchart",
        challengeAcceptedAnswers: ["brainstorm", "brainstorming"]
    )

    private static let live3 = sessionLesson(
        week: 3,
        sessionNumber: 3,
        title: "Capstone: Clean strings & letter grades",
        body: """
**Session 3 goal:** Practice string methods and ternary conditionals — after Fizz Buzz in w3-l4.

Complete w3-l1 through w3-l4 first.

**Your program should**
1. Clean a messy name with `.strip()` and `.title()`.
2. Use a ternary to assign a letter grade from a numeric score.
3. Print both results.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Have Soha predict what .strip() and .title() do before running. Compare if/else vs ternary for the same problem.",
        starterCode: """
# Session 3 capstone — finish the TODOs
name = "  soha  "
# TODO: print cleaned name with strip() and title()

grade = 85
# TODO: letter = "A" if grade >= 90 else "B" if grade >= 80 else "C"
# TODO: print grade and letter

# Reserved words — never use as variable names: if, else, def, class, ...
""",
        challengeQuestion: "What does the ternary operator let you write in one line?",
        challengeAnswer: "if else",
        challengeAcceptedAnswers: ["conditional", "if/else"]
    )

    private static let live4 = sessionLesson(
        week: 4,
        sessionNumber: 4,
        title: "Capstone: Notes file + loop review",
        body: """
**Session 4 goal:** Write, append, and read a notes file, then review a `while` loop.

Complete w4-l1–l4 first. Files save to the Playground scripts folder when you run in Terminal, or use a filename in the current directory.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "When done, open the saved file in TextEdit together so Soha sees the file on disk matches her code.",
        tryItPrompt: "Find notes.txt in Application Support scripts folder after saving.",
        starterCode: """
filename = "notes.txt"

# TODO: write one line with open(..., "w")
# TODO: append another line with open(..., "a")
# TODO: read and print the full file

count = 0
while count < 3:
    print("Loop round", count + 1)
    count += 1
""",
        challengeQuestion: "Which mode opens a file for appending without erasing it?",
        challengeAnswer: "append",
        challengeAcceptedAnswers: ["a", "a mode"]
    )

    private static let live5 = sessionLesson(
        week: 5,
        sessionNumber: 5,
        title: "Capstone: Points & flexible functions",
        body: """
**Session 5 goal:** Combine **tuples**, **default parameters**, and **\\*args** in one small program.

Complete w5-l1 through w5-l5 first.

**Your program should**
1. Store a 2D point as a tuple and print x/y.
2. Write `greet(name, greeting="Hello")` with a default greeting.
3. Write `total(*numbers)` that returns the sum of any number of arguments.
4. Call each function at least once and print the results.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Compare list vs tuple — why might coordinates be a tuple? Demo *args with different numbers of arguments.",
        starterCode: """
# Session 5 capstone — finish the TODOs

point = (3, 4)
# TODO: print x and y from point[0] and point[1]

def greet(name, greeting="Hello"):
    # TODO: print greeting + "," + name

greet("Soha")
greet("Soha", "Hi")

def total(*numbers):
    # TODO: return sum(numbers)

# TODO: print total(1, 2, 3) and total(10, 20)
""",
        challengeQuestion: "What symbol collects extra arguments into a tuple?",
        challengeAnswer: "*args",
        challengeAcceptedAnswers: ["star args", "asterisk"]
    )

    private static let live6 = sessionLesson(
        week: 6,
        sessionNumber: 6,
        title: "Capstone: Interactive calendar GUI",
        body: """
**Session 6 goal:** Build a simple Tkinter calendar window with labels and buttons.

Complete w6-l1 through w6-l4 first. Run with **Open in Terminal** — `mainloop()` needs a window.

**Your window should**
1. Show a title and month label.
2. Have a **Today** button that prints a message.
3. Have a **Quit** button that closes the window.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Tkinter runs in a window — use Run game window or Terminal like pygame. Celebrate the first button click!",
        tryItPrompt: "Add a second label showing today's date.",
        starterCode: """
# Session 6 capstone — finish the TODOs
import tkinter as tk

root = tk.Tk()
root.title("Soha Calendar")
root.geometry("300x200")

# TODO: Label with month/year, e.g. "March 2026"
# TODO: Button "Today" → command prints "Today clicked!"
# TODO: Button "Quit" → command=root.destroy

root.mainloop()
""",
        challengeQuestion: "Which Python library is used for basic GUIs in this lesson?",
        challengeAnswer: "tkinter",
        challengeAcceptedAnswers: ["Tkinter"]
    )

    private static let live7 = sessionLesson(
        week: 7,
        sessionNumber: 7,
        title: "Capstone: Quiz score chart",
        body: """
**Session 7 goal:** Plot quiz scores over time with matplotlib.

Complete w7-l1 through w7-l4 first. Install once: `pip3 install matplotlib`

**Your chart should**
1. Use two lists: days and scores.
2. Call `plt.plot` with a marker.
3. Set title, x-label, y-label, and y-limit 0–100.
4. Call `plt.show()` (Terminal / Open in Terminal).

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Connect graphs to Science Bowl — plot practice quiz scores over time.",
        tryItPrompt: "pip3 install matplotlib numpy",
        starterCode: """
# Session 7 capstone — finish the TODOs
# pip3 install matplotlib
import matplotlib.pyplot as plt

quiz_scores = [70, 85, 90, 88, 92]
days = [1, 2, 3, 4, 5]

# TODO: plt.plot(days, quiz_scores, marker="o")
# TODO: plt.title, plt.xlabel, plt.ylabel
# TODO: plt.ylim(0, 100)
# TODO: plt.show()
""",
        challengeQuestion: "Which library draws graphs in this lesson?",
        challengeAnswer: "matplotlib",
        challengeAcceptedAnswers: ["pyplot"]
    )

    private static let live8 = sessionLesson(
        week: 8,
        sessionNumber: 8,
        title: "Capstone: Space Explorer plan",
        body: """
**Session 8 goal:** Plan a small game before coding — then connect it to your Coin Collector work in w8-l2/l3.

Complete w8-l1 through w8-l3 first (Final Boss tab).

**Your plan should list**
1. Game loop (update every frame).
2. Player sprite + movement.
3. Enemy or obstacle sprites + collision.
4. Score and game-over screen.
5. Where you'll read docs (pygame.org or pgzero).

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Link to Coin Collector Final Boss — same ideas: loop, sprites, events. Compare pygame vs pgzero syntax after class.",
        tryItPrompt: "Add one sprite to your Coin Collector game in the Final Boss tab.",
        starterCode: """
# Session 8 capstone — write your Space Explorer plan
print("=== Space Explorer Plan ===")
# TODO: print 5 numbered steps (loop, player, obstacles, score, docs)
print()
print("Coin Collector status:")
print("[ ] Player moves")
print("[ ] 3 coins collected")
print("[ ] Timer works")
""",
        challengeQuestion: "Name two things every game loop needs to handle.",
        challengeAnswer: "events update",
        challengeAcceptedAnswers: ["events and update", "input and draw", "sprites events"]
    )

    private static let live9 = sessionLesson(
        week: 9,
        sessionNumber: 9,
        title: "Capstone: Todo List web app",
        body: """
**Session 9 goal:** Build a Flask Todo app that shows tasks and adds new ones from a form.

Complete w9-l1 and w9-l2 first. Save as `todo_app.py` and run in Terminal — not the in-app Run button.

**Your app should**
1. Show a heading and list of tasks at `/`.
2. Include a form with `<input name="task">` and Add button.
3. POST to `/add` to append a task and redirect home.

~30 min app lesson — read, code in Playground, quick check.
""",
        teacherScript: "Flask runs in Terminal, not the in-app Playground. When done, bookmark localhost page together.",
        tryItPrompt: "pip3 install flask — then save and run in Terminal.",
        starterCode: """
# Session 9 capstone — finish the TODOs
# pip3 install flask
# Save as todo_app.py → python3 todo_app.py → Safari http://127.0.0.1:5000

from flask import Flask, request, redirect

app = Flask(__name__)
todos = []

@app.route("/")
def home():
    # TODO: build HTML with <h1>, <ul> of tasks, and a POST form
    return "<h1>Soha Todo List</h1><p>TODO: list + form</p>"

@app.route("/add", methods=["POST"])
def add():
    # TODO: get task from request.form, strip, append if not empty, redirect("/")
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)
""",
        challengeQuestion: "What URL do you open to see your Flask app locally?",
        challengeAnswer: "127.0.0.1:5000",
        challengeAcceptedAnswers: ["localhost:5000", "localhost"]
    )

    private static let live10 = sessionLesson(
        week: 10,
        sessionNumber: 10,
        title: "Project Completion and Student Presentations",
        body: """
Complete the Todo List Application — final features and basic styling. Present your final project: demo what you learned across all 10 sessions and get feedback.

~30 min app lesson — read, code in Playground, quick check.
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
        challengeQuestion: "How long should your project demo be?",
        challengeAnswer: "2 minutes",
        challengeAcceptedAnswers: ["two minutes", "2 min"]
    )

    // MARK: - Level 2 sessions (weeks 11–20)

    private static func advancedLive(
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
        sessionLesson(
            week: week,
            sessionNumber: sessionNumber,
            title: title,
            body: body + "\n\n**Level 2** · ~30 min app lesson.",
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            sessionTitlePrefix: "Level 2 Session"
        )
    }

    private static let advLive1 = advancedLive(
        week: 11,
        sessionNumber: 1,
        title: "Review Conditional Statements, Functions, Loops",
        body: """
Refresh the core building blocks before advanced topics: if/elif/else, def functions with parameters and return, while and for loops. Apply all three in short review exercises so Course 2 starts on solid ground.
""",
        teacherScript: "Quick oral quiz: write a function that uses a loop and an if statement. Don't peek at old notes for 5 minutes first.",
        starterCode: SessionScaffolds.week11,
        challengeQuestion: "Name the three control-flow tools reviewed today.",
        challengeAnswer: "conditionals functions loops",
        challengeAcceptedAnswers: ["if else def while for"]
    )

    private static let advLive2 = advancedLive(
        week: 12,
        sessionNumber: 2,
        title: "Python Error Handling",
        body: """
Learn try/except, try/except/else, and try/except/finally. Handle crashes gracefully instead of ugly tracebacks. Introduce the Caesar Cipher: background (shift letters), project setup, and start encoding messages.
""",
        teacherScript: "Trigger a ValueError on purpose so Soha sees the difference with and without try/except. Explain Caesar cipher history in one sentence.",
        tryItPrompt: "Encode your first name with shift 3.",
        starterCode: SessionScaffolds.week12,
        challengeQuestion: "Which keyword runs cleanup code even when an error happens?",
        challengeAnswer: "finally",
        challengeAcceptedAnswers: ["finally block"]
    )

    private static let advLive3 = advancedLive(
        week: 13,
        sessionNumber: 3,
        title: "Finish Caesar Cipher & Introduction to OOP",
        body: """
Complete the Caesar Cipher project (encrypt and decrypt). Introduction to object-oriented programming: classes, attributes, and methods. Student Enrollment mini-project — model students as objects. Organizing code into modules and files.
""",
        teacherScript: "Decrypt should use shift (26 - n) or negative shift. Draw a class diagram: Student has name, grade, methods enroll() and greet().",
        tryItPrompt: "Add a decrypt() function to your cipher.",
        starterCode: SessionScaffolds.week13,
        challengeQuestion: "What method runs automatically when you create a class instance?",
        challengeAnswer: "__init__",
        challengeAcceptedAnswers: ["init", "constructor"]
    )

    private static let advLive4 = advancedLive(
        week: 14,
        sessionNumber: 4,
        title: "Introduction to APIs & Weather App",
        body: """
What APIs are and how apps fetch live data. APIs and data sources (weather, JSON responses). Tkinter for application windows. Start the Real-Time Weather Application project — layout the GUI and plan the API call.
""",
        teacherScript: "Show a JSON weather response in the browser. Tkinter + requests run in Terminal. Get a free API key from openweathermap.org if needed.",
        tryItPrompt: "pip3 install requests · sketch the weather app window on paper.",
        starterCode: SessionScaffolds.week14,
        challengeQuestion: "What format do most APIs return data in?",
        challengeAnswer: "JSON",
        challengeAcceptedAnswers: ["json"]
    )

    private static let advLive5 = advancedLive(
        week: 15,
        sessionNumber: 5,
        title: "Real-Time Weather Application Project",
        body: """
Build the Real-Time Weather Application: connect to a weather API, parse JSON, display temperature and conditions in your Tkinter app. Working with APIs in practice. Testing applications — try edge cases (bad city name, no internet).
""",
        teacherScript: "Test with a fake city name before demo day. Celebrate the first real temperature on screen!",
        tryItPrompt: "Add humidity or wind speed to the display.",
        starterCode: SessionScaffolds.week15,
        challengeQuestion: "What HTTP method does requests.get use?",
        challengeAnswer: "GET",
        challengeAcceptedAnswers: ["get"]
    )

    private static let advLive6 = advancedLive(
        week: 16,
        sessionNumber: 6,
        title: "Working with Lists & Data Libraries",
        body: """
Lists deep dive and list comprehensions for concise code. Working with Data Part 2: Introduction to NumPy arrays and the Pandas library. Read CSV files and understand tabular data structures.
""",
        teacherScript: "Compare a for-loop that builds a list vs a list comprehension side by side. Load a CSV of quiz scores from Science Bowl practice.",
        tryItPrompt: "pip3 install pandas numpy",
        starterCode: SessionScaffolds.week16,
        challengeQuestion: "What library reads CSV files into a DataFrame?",
        challengeAnswer: "pandas",
        challengeAcceptedAnswers: ["pd", "Pandas"]
    )

    private static let advLive7 = advancedLive(
        week: 17,
        sessionNumber: 7,
        title: "Matplotlib & Data Science Project",
        body: """
Introduction to Matplotlib for charts and graphs. Python Pandas exercises for data cleaning. Python Interactive Graphing Project — plot real data. What is data science? Introduction to the student data-science project.
""",
        teacherScript: "Plot Soha's weekly quiz scores from the CSV. Ask: what story does the graph tell?",
        tryItPrompt: "Change the graph to a bar chart instead of a line.",
        starterCode: SessionScaffolds.week17,
        challengeQuestion: "What is the first step in a data science workflow?",
        challengeAnswer: "ask questions",
        challengeAcceptedAnswers: ["question", "define the question", "collect data"]
    )

    private static let advLive8 = advancedLive(
        week: 18,
        sessionNumber: 8,
        title: "Lambda, *Args, **Kwargs & ML Intro",
        body: """
Lambda functions for short anonymous functions. Python default parameters review. *args and **kwargs for flexible functions. Introduction to machine learning concepts. Planning code projects before you build.
""",
        teacherScript: "Rewrite a simple def as a lambda. Explain ML as 'find patterns in data' — connect to music prediction next week.",
        starterCode: SessionScaffolds.week18,
        challengeQuestion: "What collects keyword arguments into a dictionary?",
        challengeAnswer: "**kwargs",
        challengeAcceptedAnswers: ["kwargs", "double star kwargs"]
    )

    private static let advLive9 = advancedLive(
        week: 19,
        sessionNumber: 9,
        title: "Scikit-Learn & Music Prediction",
        body: """
Scikit-learn and Python for machine learning. Machine Learning Project — Music Prediction: train a model on song features. Student project presentations — first practice run of your demo.
""",
        teacherScript: "Before starting: pip3 install scikit-learn. Keep the model simple — DecisionTree or KNeighbors. Rehearse 90-second demo.",
        tryItPrompt: "pip3 install scikit-learn",
        starterCode: SessionScaffolds.week19,
        challengeQuestion: "What sklearn method trains the model on data?",
        challengeAnswer: "fit",
        challengeAcceptedAnswers: [".fit()", "model.fit"]
    )

    private static let advLive10 = advancedLive(
        week: 20,
        sessionNumber: 10,
        title: "Student Project Presentations",
        body: """
Present your data-science or ML project: demonstrate what you built, explain one thing you learned, and note one improvement for next time. Celebrate completing Level 2!
""",
        teacherScript: "2-minute demo max. Backup: screen recording if demo fails. Export progress JSON before presenting.",
        tryItPrompt: "Rehearse: intro · demo · one challenge you overcame · thank you.",
        starterCode: """
print("=== Course 2 Presentation Checklist ===")
print("[ ] Weather app OR graph project OR music ML model")
print("[ ] 2-minute demo rehearsed")
print("[ ] Explain one bug you fixed")
print("[ ] Peer feedback notes ready")
print()
print("Course 2 skills unlocked:")
print("· Error handling & Caesar cipher")
print("· Classes & OOP")
print("· APIs & Weather app")
print("· Pandas, NumPy, Matplotlib")
print("· Lambda, *args, **kwargs")
print("· Scikit-learn ML")
""",
        challengeQuestion: "How many Level 2 sessions did you complete?",
        challengeAnswer: "10",
        challengeAcceptedAnswers: ["ten"]
    )

    // MARK: - Level 3 sessions (weeks 21–30)

    private static func level3Live(
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
        sessionLesson(
            week: week,
            sessionNumber: sessionNumber,
            title: title,
            body: body + "\n\n**Level 3** · ~30 min app lesson.",
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            sessionTitlePrefix: "Level 3 Session"
        )
    }

    private static let level3Live1 = level3Live(
        week: 21,
        sessionNumber: 1,
        title: "GUI with Tkinter · Text Editor",
        body: """
Learn to build graphical apps with Tkinter: windows, labels, buttons, and text widgets. Start a text editor project and practice reading and writing files so your work persists between sessions.
""",
        teacherScript: "Show Label, Button, Text, and filedialog. Save/load a .txt file. Compare GUI vs Terminal-only apps.",
        starterCode: SessionScaffolds.week21,
        challengeQuestion: "Which library creates GUI windows in Python?",
        challengeAnswer: "tkinter",
        challengeAcceptedAnswers: ["Tkinter"]
    )

    private static let level3Live2 = level3Live(
        week: 22,
        sessionNumber: 2,
        title: "Tic-Tac-Toe Game",
        body: """
Build a playable Tic-Tac-Toe game with Tkinter buttons. Track board state, detect wins and draws, and reset the game. Save widget state to JSON for a polished project.
""",
        teacherScript: "Use a 3×3 grid of buttons. Alternate X and O. Check rows, columns, diagonals after each move.",
        starterCode: SessionScaffolds.week22,
        challengeQuestion: "How many squares are on a Tic-Tac-Toe board?",
        challengeAnswer: "9",
        challengeAcceptedAnswers: ["nine"]
    )

    private static let level3Live3 = level3Live(
        week: 23,
        sessionNumber: 3,
        title: "Cipher App",
        body: """
Combine Tkinter with encryption from Level 2. Build a cipher app with input fields, encode/decode buttons, and clear error messages when input is invalid.
""",
        teacherScript: "Reuse Caesar shift from Level 2. Add a Tkinter Entry and result Label. Handle empty input gracefully.",
        starterCode: SessionScaffolds.week23,
        challengeQuestion: "What Level 2 project does the cipher app extend?",
        challengeAnswer: "Caesar cipher",
        challengeAcceptedAnswers: ["caesar", "cipher"]
    )

    private static let level3Live4 = level3Live(
        week: 24,
        sessionNumber: 4,
        title: "Directory Organization & Recursion",
        body: """
Use the os module to create folders and move files by extension. Write a recursive function that organizes nested directories — a powerful pattern for real-world automation.
""",
        teacherScript: "Demo os.listdir, os.path.isfile, os.makedirs, shutil.move. Explain base case vs recursive case.",
        starterCode: SessionScaffolds.week24,
        challengeQuestion: "What stops a recursive function from running forever?",
        challengeAnswer: "base case",
        challengeAcceptedAnswers: ["termination condition", "base condition"]
    )

    private static let level3Live5 = level3Live(
        week: 25,
        sessionNumber: 5,
        title: "APIs & Live Data",
        body: """
Fetch live data from a web API and display results in your app. Review requests, JSON parsing, and how GUI apps can show real-world information.
""",
        teacherScript: "Use a free API (weather or quotes). Show status codes and try/except for network errors.",
        starterCode: SessionScaffolds.week25,
        challengeQuestion: "What format do most APIs return?",
        challengeAnswer: "JSON",
        challengeAcceptedAnswers: ["json"]
    )

    private static let level3Live6 = level3Live(
        week: 26,
        sessionNumber: 6,
        title: "Data Persistence & JSON",
        body: """
Save and load application state with JSON files. Extend your Tic-Tac-Toe or cipher app so settings and high scores persist between launches.
""",
        teacherScript: "Model GameState class with to_dict() and from_dict(). Write json.dump / json.load.",
        starterCode: SessionScaffolds.week26,
        challengeQuestion: "Which module serializes Python data to a file?",
        challengeAnswer: "json",
        challengeAcceptedAnswers: ["JSON"]
    )

    private static let level3Live7 = level3Live(
        week: 27,
        sessionNumber: 7,
        title: "pygame Review & Game Polish",
        body: """
Review pygame for graphics, events, and game loops. Polish an earlier game with sprites, scoring, or sound — bridging GUI apps and interactive games.
""",
        teacherScript: "Quick pygame window + event loop. Connect to Coin Collector or a new mini-game.",
        starterCode: SessionScaffolds.week27,
        challengeQuestion: "What pygame function updates the display each frame?",
        challengeAnswer: "display.flip",
        challengeAcceptedAnswers: ["pygame.display.flip", "flip"]
    )

    private static let level3Live8 = level3Live(
        week: 28,
        sessionNumber: 8,
        title: "OOP Project Integration",
        body: """
Organize Level 3 projects with classes and modules. Refactor your text editor, game, or cipher app into reusable components ready for a portfolio folder.
""",
        teacherScript: "One class per major feature. Split into files: models.py, gui.py, main.py.",
        starterCode: SessionScaffolds.week28,
        challengeQuestion: "What OOP concept groups data and behavior together?",
        challengeAnswer: "class",
        challengeAcceptedAnswers: ["classes", "object"]
    )

    private static let level3Live9 = level3Live(
        week: 29,
        sessionNumber: 9,
        title: "Final Project · Plan & Build",
        body: """
Design your own Level 3 capstone: extend the text editor, Tic-Tac-Toe, cipher app, or file organizer. Write milestones and implement the first working feature.
""",
        teacherScript: "Review project checklist. Pick one path. Goal: one demo-able feature by end of class.",
        starterCode: SessionScaffolds.week29,
        challengeQuestion: "What should you finish before adding extra features?",
        challengeAnswer: "core feature",
        challengeAcceptedAnswers: ["one working path", "main feature", "mvp"]
    )

    private static let level3Live10 = level3Live(
        week: 30,
        sessionNumber: 10,
        title: "Graduation · Level 3 Showcase",
        body: """
Present your Level 3 final project. Play review games, celebrate GUI and recursion skills, and prepare for Level 4 — paradigms, algorithms, and professional projects.
""",
        teacherScript: "2-minute demo. Export progress backup. Preview Level 4 calculator + adventure game topics.",
        starterCode: """
print("=== Level 3 Graduation Checklist ===")
print("[ ] Text editor OR Tic-Tac-Toe OR cipher app OR organizer")
print("[ ] Uses Tkinter, files, or recursion")
print("[ ] 2-minute demo rehearsed")
print("[ ] Progress exported from Python Coach")
print()
print("Level 3 skills unlocked:")
print("· Tkinter GUIs")
print("· File I/O & JSON")
print("· Recursion & os module")
print("· APIs & data persistence")
print("· OOP project structure")
print()
print("Next up: Level 4 (weeks 31–40)")
""",
        challengeQuestion: "What level comes after Level 3 in the app journey?",
        challengeAnswer: "Level 4",
        challengeAcceptedAnswers: ["level 4", "L4", "weeks 31"]
    )

    // MARK: - Level 4 sessions (weeks 31–40)

    private static func level4Live(
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
        sessionLesson(
            week: week,
            sessionNumber: sessionNumber,
            title: title,
            body: body + "\n\n**Level 4** · ~30 min app lesson.",
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: codeTests,
            sessionTitlePrefix: "Level 4 Session"
        )
    }

    // MARK: - Level 4 Portfolio labs (weeks 41–50)

    private static func level4Portfolio(
        week: Int,
        labNumber: Int,
        title: String,
        body: String,
        teacherScript: String,
        tryItPrompt: String? = nil,
        starterCode: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil
    ) -> LessonStep {
        sessionLesson(
            week: week,
            sessionNumber: labNumber,
            title: title,
            body: body + "\n\n**Level 4 Portfolio Lab** · Course 4 · Apply Level 4 sessions to a portfolio project.",
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            sessionTitlePrefix: "Portfolio Lab"
        )
    }

    private static let portfolio1 = level4Portfolio(
        week: 41,
        labNumber: 1,
        title: "Multi-Paradigm Calculator",
        body: """
Extend your calculator with professional error handling, calculation history, and at least two programming styles (functions + class). This is Portfolio Project #1 from Level 4.
""",
        teacherScript: "Compare Calculator as functions vs Calculator class. Log each operation to a history list. Handle divide-by-zero gracefully.",
        starterCode: SessionScaffolds.week41,
        challengeQuestion: "What should happen when the user divides by zero?",
        challengeAnswer: "error message",
        challengeAcceptedAnswers: ["handle error", "zero division", "catch error"]
    )

    private static let portfolio2 = level4Portfolio(
        week: 42,
        labNumber: 2,
        title: "Text Adventure Game",
        body: """
Build a complete text adventure with rooms, inventory, items to collect, and win/lose states. Save game state to JSON. Portfolio Project #2 from Level 4.
""",
        teacherScript: "Minimum: 3 rooms, 1 item, 1 puzzle. Bonus: save/load with json module.",
        starterCode: SessionScaffolds.week42,
        challengeQuestion: "Which module saves game state to a file?",
        challengeAnswer: "json",
        challengeAcceptedAnswers: ["import json"]
    )

    private static let portfolio3 = level4Portfolio(
        week: 43,
        labNumber: 3,
        title: "Algorithm Visualizer",
        body: """
Build a tool that shows sorting algorithms step-by-step. Print each swap or compare so you can see bubble sort and selection sort in action. Portfolio Project #3 from Level 4.
""",
        teacherScript: "Add a counter for comparisons. Time two algorithms on the same list with time module.",
        starterCode: SessionScaffolds.week43,
        challengeQuestion: "Which sort compares neighbors and swaps?",
        challengeAnswer: "bubble sort",
        challengeAcceptedAnswers: ["bubble"]
    )

    private static let portfolio4 = level4Portfolio(
        week: 44,
        labNumber: 4,
        title: "Pathfinding Game",
        body: """
Develop a maze pathfinding game using BFS (or A* if ready). Generate a grid, mark walls, find shortest path from S to G. Portfolio Project #4 from Level 4.
""",
        teacherScript: "Print the path as a list of coordinates. Highlight path cells when displaying the grid.",
        starterCode: SessionScaffolds.week44,
        challengeQuestion: "What algorithm finds shortest path in an unweighted grid?",
        challengeAnswer: "BFS",
        challengeAcceptedAnswers: ["breadth first search", "bfs"]
    )

    private static let portfolio5 = level4Portfolio(
        week: 45,
        labNumber: 5,
        title: "Weather Prediction System",
        body: """
Engineer a weather analysis app that processes real or sample data with basic machine learning. Predict a category (hot/mild/cold) from temperature and humidity. Uses NASA/OpenWeather-style data patterns. Portfolio Project #5.
""",
        teacherScript: "Start with CSV sample data; swap in API fetch when ready. Plot predictions with matplotlib.",
        tryItPrompt: "pip3 install scikit-learn pandas matplotlib",
        starterCode: SessionScaffolds.week45,
        challengeQuestion: "What two features does this model use?",
        challengeAnswer: "temp humidity",
        challengeAcceptedAnswers: ["temperature and humidity", "temp_f humidity"]
    )

    private static let portfolio6 = level4Portfolio(
        week: 46,
        labNumber: 6,
        title: "Custom GUI Application",
        body: """
Design a professional Tkinter GUI from scratch — layout, labels, buttons, and event handling. Present weather or ML results in a polished window. Portfolio Project #6 from Level 4.
""",
        teacherScript: "Use grid() for alignment. Add a status bar label. Match colors to a simple theme.",
        starterCode: SessionScaffolds.week46,
        challengeQuestion: "Which Tkinter method places widgets in rows and columns?",
        challengeAnswer: "grid",
        challengeAcceptedAnswers: [".grid()", "grid()"]
    )

    private static let portfolio7 = level4Portfolio(
        week: 47,
        labNumber: 7,
        title: "Portfolio Review & Final Project Plan",
        body: """
Review all six portfolio projects. Choose your final project: Game Development, Data Science, or Algorithm Visualization. Write a design doc with milestones. Week 1 of final project (Level 4 Lesson 9).
""",
        teacherScript: "Pick one project that excites Soha most. Rubric: working demo, clean code, README, 2-min presentation.",
        starterCode: SessionScaffolds.week47,
        challengeQuestion: "How many portfolio projects should you complete before the final?",
        challengeAnswer: "6",
        challengeAcceptedAnswers: ["six", "7"]
    )

    private static let portfolio8 = level4Portfolio(
        week: 48,
        labNumber: 8,
        title: "Final Project — Build Sprint 1",
        body: """
Implement core features of your chosen final project. Focus on one working path end-to-end before adding extras. Level 4 capstone build week 1.
""",
        teacherScript: "Commit or save daily. If stuck >20 min, simplify scope.",
        tryItPrompt: "Create a new .py file in scripts folder; run in Terminal or Playground.",
        starterCode: SessionScaffolds.week48,
        challengeQuestion: "What is the goal of sprint 1?",
        challengeAnswer: "one core feature",
        challengeAcceptedAnswers: ["core feature working", "working demo"]
    )

    private static let portfolio9 = level4Portfolio(
        week: 49,
        labNumber: 9,
        title: "Final Project — Build Sprint 2",
        body: """
Add polish, error handling, documentation, and testing. Prepare README with install instructions. Level 4 capstone build week 2.
""",
        teacherScript: "README template: Title, Description, How to Run, pip installs, Screenshot.",
        starterCode: SessionScaffolds.week49,
        challengeQuestion: "What file explains how to run your project?",
        challengeAnswer: "README",
        challengeAcceptedAnswers: ["readme.md", "README.md"]
    )

    private static let portfolio10 = level4Portfolio(
        week: 50,
        labNumber: 10,
        title: "Level 4 Graduation & Showcase",
        body: """
Finalize your project and deliver a professional presentation. Code documentation, technical demo, peer feedback. Graduate Level 4 and the portfolio track! AI/ML Level 1 is a great next step.
""",
        teacherScript: "Celebrate! Export Python Coach progress. Screenshot all 7 portfolio pieces + final project folder.",
        tryItPrompt: "Progress tab → Export progress JSON.",
        starterCode: """
print("=== Level 4 Graduation ===")
print("Portfolio completed:")
print("  1. Multi-paradigm Calculator")
print("  2. Text Adventure Game")
print("  3. Algorithm Visualizer")
print("  4. Pathfinding Game")
print("  5. Weather Prediction ML")
print("  6. Custom GUI Application")
print("  7. Final Project (your choice)")
print()
print("Next step: AI and Machine Learning Level 1 (deeper projects)")
""",
        challengeQuestion: "What topic is recommended after completing Level 4?",
        challengeAnswer: "AI and Machine Learning Level 1",
        challengeAcceptedAnswers: ["ML Level 1", "AI ML Level 1", "machine learning", "AI ML"]
    )

    private static let proLive1 = level4Live(
        week: 31,
        sessionNumber: 1,
        title: "Programming Paradigms Introduction",
        body: """
Explore different approaches to writing code and choosing the right tool for each challenge. Learn procedural, object-oriented, and functional styles. Build a multi-functional calculator while practicing clear, maintainable code organization.
""",
        teacherScript: "Compare three versions of the same calculator feature: plain functions, a Calculator class, and map/filter. Ask: which is easiest to extend?",
        starterCode: SessionScaffolds.week31,
        challengeQuestion: "Name two programming paradigms introduced today.",
        challengeAnswer: "procedural object-oriented",
        challengeAcceptedAnswers: ["oop", "functional", "object oriented"]
    )

    private static let proLive2 = level4Live(
        week: 32,
        sessionNumber: 2,
        title: "Object-Oriented Programming Deep Dive",
        body: """
Deep dive into OOP — the style used in video games and mobile apps. Create classes, inheritance, and encapsulation while building a text-based adventure game with rooms, items, and player choices.
""",
        teacherScript: "Draw Room → North/South/East/West connections on paper first. One class per file is OK for bigger projects.",
        tryItPrompt: "Add a second room and one collectible item.",
        starterCode: SessionScaffolds.week32,
        challengeQuestion: "In OOP, what connects one Room to another?",
        challengeAnswer: "exits",
        challengeAcceptedAnswers: ["exit", "dictionary", "add_exit"]
    )

    private static let proLive3 = level4Live(
        week: 33,
        sessionNumber: 3,
        title: "Functional Programming Foundations",
        body: """
Learn functional programming — the approach used at scale by companies like Amazon and Facebook. Build data processing pipelines with map, filter, and reduce. Write code that is easier to test and debug.
""",
        teacherScript: "Same task three ways: for-loop, list comprehension, map/filter. Discuss which is clearest for Soha.",
        starterCode: SessionScaffolds.week33,
        challengeQuestion: "Which function combines a list into one value?",
        challengeAnswer: "reduce",
        challengeAcceptedAnswers: ["functools.reduce"]
    )

    private static let proLive4 = level4Live(
        week: 34,
        sessionNumber: 4,
        title: "Algorithms in Python",
        body: """
Dive into algorithms: how computers sort and search data efficiently. Explore bubble sort, binary search, and Big-O intuition with interactive print-based visualizations. Skills that matter for CS classes and coding interviews.
""",
        teacherScript: "Sort a small list by hand first, then run bubble sort line by line. Ask: why is binary search faster than linear search?",
        starterCode: SessionScaffolds.week34,
        challengeQuestion: "Which search requires a sorted list?",
        challengeAnswer: "binary search",
        challengeAcceptedAnswers: ["binary"]
    )

    private static let proLive5 = level4Live(
        week: 35,
        sessionNumber: 5,
        title: "Data Structures",
        body: """
Organize data with stacks, queues, and grids. Build an interactive pathfinding game like those in video games and GPS — find a route from start to goal on a 2D map using BFS-style search.
""",
        teacherScript: "Draw a 4×4 grid on paper. Mark start (S) and goal (G). Trace the path before coding.",
        starterCode: SessionScaffolds.week35,
        challengeQuestion: "What character blocks movement in the grid?",
        challengeAnswer: "#",
        challengeAcceptedAnswers: ["hash", "wall"]
    )

    private static let proLive6 = level4Live(
        week: 36,
        sessionNumber: 6,
        title: "AI and Machine Learning",
        body: """
Enter AI and machine learning: train prediction systems with scikit-learn. Build a classifier or regressor using the same workflow data scientists use — data → features → train → evaluate → predict.
""",
        teacherScript: "Split data into train/test. Never evaluate on training data only. Connect to Science Bowl: predict subject from question keywords.",
        tryItPrompt: "pip3 install scikit-learn",
        starterCode: SessionScaffolds.week36,
        challengeQuestion: "What sklearn method measures accuracy on held-out data?",
        challengeAnswer: "score",
        challengeAcceptedAnswers: [".score()", "model.score"]
    )

    private static let proLive7 = level4Live(
        week: 37,
        sessionNumber: 7,
        title: "GUI Development",
        body: """
Create user-friendly graphical interfaces so anyone can use your programs. Build interactive displays for machine learning results — buttons, labels, and charts in Tkinter that make complex data understandable.
""",
        teacherScript: "Wire a Predict button to your ML model from last week. Show prediction result in a Label widget.",
        starterCode: SessionScaffolds.week37,
        challengeQuestion: "Which widget shows text output in Tkinter?",
        challengeAnswer: "Label",
        challengeAcceptedAnswers: ["tk.Label", "label"]
    )

    private static let proLive8 = level4Live(
        week: 38,
        sessionNumber: 8,
        title: "Web APIs and Data Processing",
        body: """
Connect programs to the internet and pull real-world data from online sources. Build a weather analysis system — fetch JSON, process it with pandas, and summarize trends over multiple days or cities.
""",
        teacherScript: "Compare raw JSON to a cleaned DataFrame. Discuss API keys and rate limits responsibly.",
        tryItPrompt: "pip3 install requests pandas",
        starterCode: SessionScaffolds.week38,
        challengeQuestion: "What pandas method groups rows by a column?",
        challengeAnswer: "groupby",
        challengeAcceptedAnswers: [".groupby()", "group by"]
    )

    private static let proLive9 = level4Live(
        week: 39,
        sessionNumber: 9,
        title: "Code Review and Final Projects",
        body: """
Plan and begin your capstone project applying everything from Courses 1–3. Experience professional workflow: project planning, system design, implementation, and code review. Break complex problems into milestones and manage time independently.
""",
        teacherScript: "Use week notes to track milestones. Review one peer's code structure — what would you improve?",
        tryItPrompt: "Write a 1-page project plan: goal, features, timeline, tech stack.",
        starterCode: SessionScaffolds.week39,
        challengeQuestion: "What document breaks a big project into steps before coding?",
        challengeAnswer: "project plan",
        challengeAcceptedAnswers: ["plan", "design doc", "milestones"]
    )

    private static let proLive10 = level4Live(
        week: 40,
        sessionNumber: 10,
        title: "Project Completion and Professional Presentation",
        body: """
Finalize your capstone project and deliver a professional presentation. Learn code documentation, technical demo techniques, and how to showcase software to an audience. Course 4 culminates in a showcase event celebrating your work.
""",
        teacherScript: "2–3 minute demo. Show README or docstring. Q&A practice: 'What was hardest?' 'What would you add next?'",
        tryItPrompt: "Add a README.md to your project folder with install + run instructions.",
        starterCode: """
print("=== Professional Presentation Checklist ===")
print("[ ] Project runs from clean Terminal test")
print("[ ] README: what it does, how to run, pip installs")
print("[ ] Docstrings on main functions/classes")
print("[ ] 2–3 minute demo script rehearsed")
print("[ ] Backup screen recording ready")
print("[ ] Code pushed or exported (Progress backup)")
print()
print("Demo structure:")
print("  1. Hook — what problem does it solve?")
print("  2. Live demo — happy path")
print("  3. One technical highlight you learned")
print("  4. Thank you + questions")
""",
        challengeQuestion: "Name one professional skill practiced this week.",
        challengeAnswer: "documentation",
        challengeAcceptedAnswers: ["presentation", "demo", "code review", "readme"]
    )

    private static let week1 = WeekUnit(
        id: 1,
        title: "Hello, Python!",
        subtitle: "Pass 1 · Jun 8–12 · Foundations",
        emoji: "👋",
        goal: "Run Python and make the computer talk back.",
        skills: ["print()", "strings", "variables", "formatting"],
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
            LessonStep(
                id: "w1-l4",
                title: "Combining text",
                body: """
You can build messages three ways:

1. **Commas in print** — `print("Hi", name)` adds a space automatically.
2. **Concatenation with +** — `"Hi " + name` joins strings (both must be text).
3. **Mix text and variables** — `print("Grade:", grade)` is the easiest.

Use straight double quotes `"` in Python, not curly “smart quotes” from Word.
""",
                teacherScript: "Have Soha predict the output before each Run. Fix one line together if quotes cause an error.",
                tryItPrompt: "Print: Soha loves Science Bowl — using variables for name and hobby.",
                starterCode: """
name = "Soha"
hobby = "Science Bowl"
print("Hi,", name)
print("I love " + hobby)
print(name, "is learning Python!")
""",
                challengeQuestion: "Which print style adds spaces for you: commas or plus?",
                challengeAnswer: "commas",
                challengeAcceptedAnswers: ["comma", "print with commas"],
                codeTests: [
                    CodeTest(
                        id: "w1-l4-strings",
                        label: "Uses name and hobby in print output",
                        assertionScript: """
assert "name" in user_code
assert "print" in user_code
assert "hobby" in user_code or "Science" in user_code
""",
                        inspectSourceOnly: true
                    ),
                ]
            ),
            live1,
        ]
    )

    private static let week2 = WeekUnit(
        id: 2,
        title: "Decisions",
        subtitle: "Pass 1 · Jun 15–19 · Building depth",
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
            LessonStep(
                id: "w2-l4",
                title: "Lists & dictionaries",
                body: """
**List** — ordered items: `order = ["cheese", "pepperoni"]`

**Dictionary** — label → value: `menu = {"cheese": 8, "pepperoni": 10}`

Use `menu["cheese"]` to look up a price. Use `.append()` to add to a list.
""",
                teacherScript: "Build the menu dict together before the Pizza project.",
                tryItPrompt: "Add a veggie pizza for $9.",
                starterCode: """
menu = {"cheese": 8, "pepperoni": 10}
order = []
order.append("cheese")
print("Order:", order)
print("Price:", menu[order[0]])
""",
                challengeQuestion: "Which type maps a name to a price?",
                challengeAnswer: "dictionary",
                challengeAcceptedAnswers: ["dict"]
            ),
            LessonStep(
                id: "w2-l5",
                title: "while loops for menus",
                body: """
`while True:` repeats until you `break`.

Pattern for a menu:
1. Ask for input
2. If input is \"done\", break
3. Otherwise handle the choice
""",
                teacherScript: "Trace one loop by hand: what happens when user types done?",
                starterCode: """
count = 0
while count < 3:
    print("Round", count + 1)
    count += 1
print("Loop finished")
""",
                challengeQuestion: "Which keyword exits a while loop early?",
                challengeAnswer: "break",
                challengeAcceptedAnswers: ["break statement"]
            ),
            live2,
        ]
    )

    private static let week3 = WeekUnit(
        id: 3,
        title: "Loops",
        subtitle: "Pass 1 · Jun 22–26 · Mid-level mastery",
        emoji: "🔁",
        goal: "Use while and for to repeat actions — then build Fizz Buzz.",
        skills: ["while", "for", "range()", "modulo %", "Fizz Buzz", "methods", "ternary"],
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
            LessonStep(
                id: "w3-l4",
                title: "Fizz Buzz — learn the pieces",
                body: """
**Fizz Buzz** is a classic coding puzzle. For each number 1–20:

| Condition | Print |
|-----------|-------|
| divisible by 3 **and** 5 | FizzBuzz |
| divisible by 3 only | Fizz |
| divisible by 5 only | Buzz |
| otherwise | the number |

**New operator: `%` (modulo)**  
`n % 3` is the remainder after dividing n by 3. If the remainder is 0, n is divisible by 3.

Try in Playground:
```
print(10 % 3)   # 1
print(9 % 3)    # 0  → divisible by 3
```

**for loop review**  
`for n in range(1, 21):` sets n to 1, 2, …, 20.

**if / elif chain**  
Check **15 first** (both 3 and 5). If you check `% 3` first, 15 would wrongly print only "Fizz".

Work through the scaffold below line by line before running the full program.
""",
                teacherScript: "Paper trace n=15 and n=10 before coding. Common bug: wrong order of if tests. Second common bug: range(1, 20) stops at 19 — use 21.",
                tryItPrompt: "After it works for 1–20, change the loop to 1–30.",
                starterCode: """
# Step 1 — try modulo (Run this first)
print("10 % 3 =", 10 % 3)
print("9 % 3 =", 9 % 3)

# Step 2 — complete the Fizz Buzz loop
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
                challengeQuestion: "What do you print when n is divisible by both 3 and 5?",
                challengeAnswer: "FizzBuzz",
                challengeAcceptedAnswers: ["fizzbuzz"],
                codeTests: [
                    CodeTest(
                        id: "w3-l4-fizz",
                        label: "Uses for, if, and modulo for Fizz Buzz",
                        assertionScript: """
assert "for" in user_code
assert "%" in user_code
assert "FizzBuzz" in user_code
assert "range" in user_code
""",
                        inspectSourceOnly: true
                    ),
                ]
            ),
            live3,
        ]
    )

    private static let week4 = WeekUnit(
        id: 4,
        title: "Functions",
        subtitle: "Pass 1 · Jun 29–Jul 3 · Round-ready",
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
            LessonStep(
                id: "w4-l4",
                title: "Read & write files",
                body: """
Files store text on disk.

```python
with open("notes.txt", "w") as f:
    f.write("Hello!\\n")

with open("notes.txt") as f:
    print(f.read())
```

- `"w"` write (overwrites)
- `"a"` append (add to end)
- `"r"` read (default)
""",
                teacherScript: "After saving, open notes.txt in TextEdit together.",
                tryItPrompt: "Append a second line with mode \"a\".",
                starterCode: """
with open("notes.txt", "w") as f:
    f.write("Line 1 from Soha\\n")

with open("notes.txt", "a") as f:
    f.write("Line 2 appended\\n")

with open("notes.txt") as f:
    print(f.read())
""",
                challengeQuestion: "Which mode appends without erasing?",
                challengeAnswer: "append",
                challengeAcceptedAnswers: ["a mode", "append mode"]
            ),
            live4,
        ]
    )

    private static let week5 = WeekUnit(
        id: 5,
        title: "First Games",
        subtitle: "Pass 2 · Jul 6–10 · Foundations (again)",
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
            LessonStep(
                id: "w5-l4",
                title: "Tuples",
                body: """
A **tuple** holds fixed items: `point = (3, 4)`

Unlike lists, tuples cannot change after creation — good for coordinates.
""",
                teacherScript: "Compare list vs tuple — when would you use each?",
                tryItPrompt: nil,
                starterCode: """
point = (3, 4)
print("x:", point[0], "y:", point[1])
""",
                challengeQuestion: "Can you change point[0] after creating a tuple?",
                challengeAnswer: "no",
                challengeAcceptedAnswers: ["cannot", "immutable"]
            ),
            LessonStep(
                id: "w5-l5",
                title: "Default parameters & *args",
                body: """
**Default parameter:** `def greet(name, msg="Hello"):`

**\\*args** collects extra numbers: `def total(*nums): return sum(nums)`
""",
                teacherScript: "Call total with different numbers of arguments.",
                tryItPrompt: nil,
                starterCode: """
def greet(name, greeting="Hello"):
    print(greeting + ",", name)

greet("Soha")
greet("Soha", "Hi")

def total(*numbers):
    return sum(numbers)

print(total(1, 2, 3))
""",
                challengeQuestion: "What symbol collects extra arguments?",
                challengeAnswer: "*args",
                challengeAcceptedAnswers: ["star args"]
            ),
            live5,
        ]
    )

    private static let week6 = WeekUnit(
        id: 6,
        title: "Lists & Quiz Game",
        subtitle: "Pass 2 · Jul 13–17 · Building depth (again)",
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
            LessonStep(
                id: "w6-l4",
                title: "Tkinter: windows & buttons",
                body: """
**Tkinter** builds desktop GUIs.

- `tk.Tk()` — main window
- `tk.Label` — text
- `tk.Button` — clickable
- `.pack()` — place widget
- `root.mainloop()` — show window (use Open in Terminal)

Complete the list lessons above before Session 6.
""",
                teacherScript: "First button click is a big win — celebrate it!",
                tryItPrompt: "Add a label with today's date.",
                starterCode: """
import tkinter as tk

root = tk.Tk()
root.title("Hello GUI")
tk.Label(root, text="Hi from Soha!").pack(pady=10)
tk.Button(root, text="Click me", command=lambda: print("Clicked!")).pack()
root.mainloop()
""",
                challengeQuestion: "Which library creates GUI windows?",
                challengeAnswer: "tkinter",
                challengeAcceptedAnswers: ["Tkinter"]
            ),
            live6,
        ]
    )

    private static let week7 = WeekUnit(
        id: 7,
        title: "Maps & pygame intro",
        subtitle: "Pass 2 · Jul 20–24 · Mid-level mastery (again)",
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
            LessonStep(
                id: "w7-l4",
                title: "Plotting with matplotlib",
                body: """
**matplotlib** draws charts. Install once: `pip3 install matplotlib`

Use `plt.plot(x, y)` then `plt.show()`.

Run in Terminal or use Open in Terminal from Playground — `plt.show()` needs a display.
""",
                teacherScript: "Connect to Science Bowl — plot practice quiz scores over time.",
                tryItPrompt: "pip3 install matplotlib",
                starterCode: """
# pip3 install matplotlib
import matplotlib.pyplot as plt

scores = [70, 85, 90]
days = [1, 2, 3]
plt.plot(days, scores, marker="o")
plt.title("My Quiz Scores")
plt.ylim(0, 100)
plt.show()
""",
                challengeQuestion: "Which library draws graphs?",
                challengeAnswer: "matplotlib",
                challengeAcceptedAnswers: ["pyplot"]
            ),
            live7,
        ]
    )

    private static let week8 = WeekUnit(
        id: 8,
        title: "Final Challenge",
        subtitle: "Pass 2 · Jul 27–31 · Round-ready (again)",
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
        subtitle: "Pass 3 · Aug 3–7 · Final review (1 of 2)",
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
            LessonStep(
                id: "w9-l2",
                title: "Your first Flask route",
                body: """
**Flask** serves web pages from Python.

1. `pip3 install flask`
2. Save app as `.py` file
3. Run in Terminal: `python3 todo_app.py`
4. Open Safari to `http://127.0.0.1:5000`

Each `@app.route` maps a URL to a function that returns HTML.
""",
                teacherScript: "Flask does not run inside the in-app Playground Run button — use Terminal.",
                tryItPrompt: "Change the heading to include your name.",
                starterCode: """
# pip3 install flask
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Hello from Soha!</h1><p>My first web page.</p>"

if __name__ == "__main__":
    app.run(debug=True)
""",
                challengeQuestion: "What URL opens your local Flask app?",
                challengeAnswer: "127.0.0.1:5000",
                challengeAcceptedAnswers: ["localhost:5000", "localhost"]
            ),
            live9,
            LessonStep(
                id: "w9-l3",
                title: "Extend your Todo app",
                body: "Add delete tasks, mark complete, or a counter in the page title.",
                teacherScript: "One feature at a time. Save todo_app.py in the scripts folder.",
                tryItPrompt: "Add a route /clear that empties the todo list.",
                starterCode: """
# Extend the Session 9 Todo app from the lesson above
print("Add POST /add route and a form with <input name=task>")
""",
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
        ]
    )

    private static let week10 = WeekUnit(
        id: 10,
        title: "Graduation & Presentations",
        subtitle: "Pass 3 · Aug 10–14 · Final review (2 of 2)",
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
                body: "Full path complete! Levels 1–4 plus portfolio. Export progress and screenshot your best projects.",
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

    private static let week11 = WeekUnit(
        id: 11,
        title: "Review & Refresh",
        subtitle: "Level 2 · Conditionals, functions, loops",
        emoji: "🔁",
        goal: "Warm up core Python before advanced topics.",
        skills: ["if/elif/else", "def", "while", "for", "review"],
        lessons: sessionWeek(SessionTeachingLessons.week11, advLive1)
    )

    private static let week12 = WeekUnit(
        id: 12,
        title: "Error Handling",
        subtitle: "Level 2 · try/except · Caesar Cipher",
        emoji: "🛡️",
        goal: "Handle errors gracefully and start the Caesar Cipher project.",
        skills: ["try/except", "finally", "Caesar cipher", "encryption"],
        lessons: sessionWeek(SessionTeachingLessons.week12, advLive2)
    )

    private static let week13 = WeekUnit(
        id: 13,
        title: "OOP & Caesar Cipher",
        subtitle: "Level 2 · Classes · Student Enrollment",
        emoji: "🏛️",
        goal: "Finish the cipher and learn object-oriented programming.",
        skills: ["class", "__init__", "methods", "modules"],
        lessons: sessionWeek(SessionTeachingLessons.week13, advLive3)
    )

    private static let week14 = WeekUnit(
        id: 14,
        title: "APIs & Weather App",
        subtitle: "Level 2 · Tkinter · live data",
        emoji: "🌤️",
        goal: "Fetch real data from the internet into a GUI app.",
        skills: ["API", "JSON", "requests", "Tkinter"],
        lessons: sessionWeek(SessionTeachingLessons.week14, advLive4)
    )

    private static let week15 = WeekUnit(
        id: 15,
        title: "Weather Project",
        subtitle: "Level 2 · Build & test the app",
        emoji: "⛅",
        goal: "Ship a working Real-Time Weather Application.",
        skills: ["API integration", "testing", "debugging", "JSON parsing"],
        lessons: sessionWeek(SessionTeachingLessons.week15, advLive5)
    )

    private static let week16 = WeekUnit(
        id: 16,
        title: "Lists & Pandas",
        subtitle: "Level 2 · NumPy · CSV data",
        emoji: "📊",
        goal: "Work with tables of data using Pandas and NumPy.",
        skills: ["list comprehension", "NumPy", "Pandas", "CSV"],
        lessons: sessionWeek(SessionTeachingLessons.week16, advLive6)
    )

    private static let week17 = WeekUnit(
        id: 17,
        title: "Data Science & Graphs",
        subtitle: "Level 2 · Matplotlib · student project",
        emoji: "📈",
        goal: "Visualize data and start your data-science project.",
        skills: ["Matplotlib", "data science", "graphing", "Pandas"],
        lessons: sessionWeek(SessionTeachingLessons.week17, advLive7)
    )

    private static let week18 = WeekUnit(
        id: 18,
        title: "Lambda & ML Intro",
        subtitle: "Level 2 · *args · **kwargs · planning",
        emoji: "⚡",
        goal: "Advanced function tools and intro to machine learning.",
        skills: ["lambda", "*args", "**kwargs", "machine learning"],
        lessons: sessionWeek(SessionTeachingLessons.week18, advLive8)
    )

    private static let week19 = WeekUnit(
        id: 19,
        title: "Scikit-Learn",
        subtitle: "Level 2 · Music Prediction ML",
        emoji: "🎵",
        goal: "Train a machine learning model and practice presenting.",
        skills: ["scikit-learn", "DecisionTree", "ML project", "demo"],
        lessons: sessionWeek(SessionTeachingLessons.week19, advLive9)
    )

    private static let week20 = WeekUnit(
        id: 20,
        title: "Graduation · Level 2",
        subtitle: "Student project presentations",
        emoji: "🎓",
        goal: "Present your final project and graduate Level 2!",
        skills: ["presentation", "portfolio", "peer feedback", "graduation"],
        lessons: sessionWeek(SessionTeachingLessons.week20, advLive10)
    )

    private static let week21 = WeekUnit(
        id: 21,
        title: "Tkinter Text Editor",
        subtitle: "Level 3 · GUI & file I/O",
        emoji: "📝",
        goal: "Build a graphical text editor with open and save.",
        skills: ["Tkinter", "file I/O", "widgets", "GUI"],
        lessons: sessionWeek(SessionTeachingLessons.week21, level3Live1)
    )

    private static let week22 = WeekUnit(
        id: 22,
        title: "Tic-Tac-Toe",
        subtitle: "Level 3 · Tkinter game",
        emoji: "⭕",
        goal: "Create a playable Tic-Tac-Toe game with win detection.",
        skills: ["game logic", "Tkinter", "state", "JSON"],
        lessons: sessionWeek(SessionTeachingLessons.week22, level3Live2)
    )

    private static let week23 = WeekUnit(
        id: 23,
        title: "Cipher App",
        subtitle: "Level 3 · Encryption GUI",
        emoji: "🔐",
        goal: "Build a cipher app combining GUI and encryption.",
        skills: ["encryption", "Tkinter", "error handling", "Caesar cipher"],
        lessons: sessionWeek(SessionTeachingLessons.week23, level3Live3)
    )

    private static let week24 = WeekUnit(
        id: 24,
        title: "Recursion & Files",
        subtitle: "Level 3 · Directory organizer",
        emoji: "📁",
        goal: "Organize files with os module and recursion.",
        skills: ["recursion", "os module", "automation", "base case"],
        lessons: sessionWeek(SessionTeachingLessons.week24, level3Live4)
    )

    private static let week25 = WeekUnit(
        id: 25,
        title: "APIs & Live Data",
        subtitle: "Level 3 · Fetch & display",
        emoji: "🌐",
        goal: "Connect your app to live web data.",
        skills: ["API", "JSON", "requests", "networking"],
        lessons: sessionWeek(SessionTeachingLessons.week25, level3Live5)
    )

    private static let week26 = WeekUnit(
        id: 26,
        title: "Data Persistence",
        subtitle: "Level 3 · Save game state",
        emoji: "💾",
        goal: "Persist app state with JSON files.",
        skills: ["JSON", "save/load", "state", "persistence"],
        lessons: sessionWeek(SessionTeachingLessons.week26, level3Live6)
    )

    private static let week27 = WeekUnit(
        id: 27,
        title: "pygame Review",
        subtitle: "Level 3 · Game polish",
        emoji: "🎮",
        goal: "Review pygame and polish an interactive game.",
        skills: ["pygame", "game loop", "events", "sprites"],
        lessons: sessionWeek(SessionTeachingLessons.week27, level3Live7)
    )

    private static let week28 = WeekUnit(
        id: 28,
        title: "OOP Integration",
        subtitle: "Level 3 · Project structure",
        emoji: "🏗️",
        goal: "Refactor projects with classes and modules.",
        skills: ["OOP", "modules", "refactoring", "architecture"],
        lessons: sessionWeek(SessionTeachingLessons.week28, level3Live8)
    )

    private static let week29 = WeekUnit(
        id: 29,
        title: "Final Project Start",
        subtitle: "Level 3 · Plan & build",
        emoji: "📋",
        goal: "Plan and start your Level 3 capstone.",
        skills: ["planning", "milestones", "implementation", "MVP"],
        lessons: sessionWeek(SessionTeachingLessons.week29, level3Live9)
    )

    private static let week30 = WeekUnit(
        id: 30,
        title: "Graduation · Level 3",
        subtitle: "Showcase & next steps",
        emoji: "🎓",
        goal: "Present your capstone and graduate Level 3!",
        skills: ["presentation", "demo", "portfolio", "graduation"],
        lessons: sessionWeek(SessionTeachingLessons.week30, level3Live10)
    )

    private static let week31 = WeekUnit(
        id: 31,
        title: "Programming Paradigms",
        subtitle: "Level 4 · Multi-function calculator",
        emoji: "🧮",
        goal: "Compare procedural, OOP, and functional styles.",
        skills: ["paradigms", "procedural", "maintainability", "calculator"],
        lessons: sessionWeek(SessionTeachingLessons.week31, proLive1)
    )

    private static let week32 = WeekUnit(
        id: 32,
        title: "OOP Deep Dive",
        subtitle: "Level 4 · Text adventure game",
        emoji: "🗺️",
        goal: "Build a text adventure with classes and rooms.",
        skills: ["OOP", "classes", "inheritance", "game design"],
        lessons: sessionWeek(SessionTeachingLessons.week32, proLive2)
    )

    private static let week33 = WeekUnit(
        id: 33,
        title: "Functional Programming",
        subtitle: "Level 4 · Data pipelines",
        emoji: "λ",
        goal: "Process data with map, filter, and reduce.",
        skills: ["functional", "map", "filter", "reduce", "pure functions"],
        lessons: sessionWeek(SessionTeachingLessons.week33, proLive3)
    )

    private static let week34 = WeekUnit(
        id: 34,
        title: "Algorithms",
        subtitle: "Level 4 · Sort & search",
        emoji: "⚙️",
        goal: "Understand sorting and searching algorithms.",
        skills: ["bubble sort", "binary search", "Big-O", "algorithms"],
        lessons: sessionWeek(SessionTeachingLessons.week34, proLive4)
    )

    private static let week35 = WeekUnit(
        id: 35,
        title: "Data Structures",
        subtitle: "Level 4 · Pathfinding game",
        emoji: "🎯",
        goal: "Use grids and search for pathfinding.",
        skills: ["stack", "queue", "grid", "BFS", "pathfinding"],
        lessons: sessionWeek(SessionTeachingLessons.week35, proLive5)
    )

    private static let week36 = WeekUnit(
        id: 36,
        title: "AI & Machine Learning",
        subtitle: "Level 4 · Prediction systems",
        emoji: "🤖",
        goal: "Train and evaluate ML models professionally.",
        skills: ["AI", "train/test split", "KNeighbors", "evaluation"],
        lessons: sessionWeek(SessionTeachingLessons.week36, proLive6)
    )

    private static let week37 = WeekUnit(
        id: 37,
        title: "GUI for ML",
        subtitle: "Level 4 · Interactive displays",
        emoji: "🖥️",
        goal: "Present ML results in a Tkinter GUI.",
        skills: ["Tkinter", "GUI", "ML display", "user experience"],
        lessons: sessionWeek(SessionTeachingLessons.week37, proLive7)
    )

    private static let week38 = WeekUnit(
        id: 38,
        title: "Web APIs & Analysis",
        subtitle: "Level 4 · Weather data system",
        emoji: "🌐",
        goal: "Fetch and analyze real-world API data.",
        skills: ["API", "pandas", "groupby", "data processing"],
        lessons: sessionWeek(SessionTeachingLessons.week38, proLive8)
    )

    private static let week39 = WeekUnit(
        id: 39,
        title: "Final Project Start",
        subtitle: "Level 4 · Plan & code review",
        emoji: "📋",
        goal: "Plan and begin your capstone project.",
        skills: ["project planning", "system design", "code review"],
        lessons: sessionWeek(SessionTeachingLessons.week39, proLive9)
    )

    private static let week40 = WeekUnit(
        id: 40,
        title: "Graduation · Level 4 Session",
        subtitle: "Professional presentation showcase",
        emoji: "🏆",
        goal: "Ship your capstone and present like a pro.",
        skills: ["documentation", "demo", "presentation", "portfolio"],
        lessons: sessionWeek(SessionTeachingLessons.week40, proLive10)
    )

    private static let week41 = WeekUnit(
        id: 41,
        title: "Calculator Portfolio",
        subtitle: "Portfolio · Level 4 Project 1",
        emoji: "🧮",
        goal: "Ship the multi-paradigm calculator with history and error handling.",
        skills: ["OOP", "error handling", "calculator", "portfolio"],
        lessons: sessionWeek(SessionTeachingLessons.week41, portfolio1)
    )

    private static let week42 = WeekUnit(
        id: 42,
        title: "Adventure Game Portfolio",
        subtitle: "Portfolio · Level 4 Project 2",
        emoji: "🗺️",
        goal: "Complete a text adventure with save/load.",
        skills: ["game state", "JSON", "inventory", "rooms"],
        lessons: sessionWeek(SessionTeachingLessons.week42, portfolio2)
    )

    private static let week43 = WeekUnit(
        id: 43,
        title: "Algorithm Visualizer",
        subtitle: "Portfolio · Level 4 Project 3",
        emoji: "📊",
        goal: "Visualize sorting algorithms step by step.",
        skills: ["bubble sort", "visualization", "performance", "algorithms"],
        lessons: sessionWeek(SessionTeachingLessons.week43, portfolio3)
    )

    private static let week44 = WeekUnit(
        id: 44,
        title: "Pathfinding Game",
        subtitle: "Portfolio · Level 4 Project 4",
        emoji: "🎯",
        goal: "Build a maze pathfinding game with BFS.",
        skills: ["BFS", "maze", "grid", "pathfinding"],
        lessons: sessionWeek(SessionTeachingLessons.week44, portfolio4)
    )

    private static let week45 = WeekUnit(
        id: 45,
        title: "Weather ML System",
        subtitle: "Portfolio · Level 4 Project 5",
        emoji: "⛅",
        goal: "Predict weather patterns with ML.",
        skills: ["sklearn", "pandas", "weather data", "prediction"],
        lessons: sessionWeek(SessionTeachingLessons.week45, portfolio5)
    )

    private static let week46 = WeekUnit(
        id: 46,
        title: "Custom GUI App",
        subtitle: "Portfolio · Level 4 Project 6",
        emoji: "🖥️",
        goal: "Build a polished Tkinter dashboard.",
        skills: ["Tkinter", "GUI design", "events", "layout"],
        lessons: sessionWeek(SessionTeachingLessons.week46, portfolio6)
    )

    private static let week47 = WeekUnit(
        id: 47,
        title: "Final Project Plan",
        subtitle: "Portfolio · Review & design doc",
        emoji: "📋",
        goal: "Choose and plan your Level 4 capstone.",
        skills: ["design doc", "planning", "portfolio review"],
        lessons: sessionWeek(SessionTeachingLessons.week47, portfolio7)
    )

    private static let week48 = WeekUnit(
        id: 48,
        title: "Final Project Sprint 1",
        subtitle: "Portfolio · Core feature",
        emoji: "🔨",
        goal: "Get one core feature working end-to-end.",
        skills: ["implementation", "debugging", "sprint"],
        lessons: sessionWeek(SessionTeachingLessons.week48, portfolio8)
    )

    private static let week49 = WeekUnit(
        id: 49,
        title: "Final Project Sprint 2",
        subtitle: "Portfolio · Polish & docs",
        emoji: "✨",
        goal: "Add README, tests, and polish.",
        skills: ["documentation", "testing", "README"],
        lessons: sessionWeek(SessionTeachingLessons.week49, portfolio9)
    )

    private static let week50 = WeekUnit(
        id: 50,
        title: "Level 4 Graduation",
        subtitle: "Portfolio · Showcase & next steps",
        emoji: "🎓",
        goal: "Present your portfolio and graduate Level 4!",
        skills: ["presentation", "graduation", "portfolio", "showcase"],
        lessons: sessionWeek(SessionTeachingLessons.week50, portfolio10)
    )

    // MARK: - Summer calendar (10 weeks · 5 app sessions each)

    private static func bundleTrackWeeks(
        id: Int,
        title: String,
        subtitle: String,
        emoji: String,
        goal: String,
        sources: [WeekUnit]
    ) -> WeekUnit {
        WeekUnit(
            id: id,
            title: title,
            subtitle: subtitle,
            emoji: emoji,
            goal: goal,
            skills: Array(Set(sources.flatMap(\.skills))),
            lessons: sources.flatMap(\.lessons)
        )
    }

    static let weeks: [WeekUnit] = summerWeeks

    private static let summerWeeks: [WeekUnit] = [
        bundleTrackWeeks(
            id: 1,
            title: "L1 (1–5)",
            subtitle: "Pass 1 · Jun 8–12 · Foundations",
            emoji: "👋",
            goal: "Python basics through your first games — print, decisions, loops, functions, and text games.",
            sources: [week1, week2, week3, week4, week5]
        ),
        bundleTrackWeeks(
            id: 2,
            title: "L1 (6–10)",
            subtitle: "Pass 1 · Jun 15–19 · Building depth",
            emoji: "🎮",
            goal: "Lists, Science Bowl quiz game, pygame intro, Final Boss, Flask, and Level 1 graduation.",
            sources: [week6, week7, week8, week9, week10]
        ),
        bundleTrackWeeks(
            id: 3,
            title: "L2 (1–5)",
            subtitle: "Pass 1 · Jun 22–26 · Mid-level mastery",
            emoji: "🛡️",
            goal: "Error handling, Caesar cipher, OOP, APIs, and the weather app project.",
            sources: [week11, week12, week13, week14, week15]
        ),
        bundleTrackWeeks(
            id: 4,
            title: "L2 (6–10)",
            subtitle: "Pass 1 · Jun 29–Jul 3 · Round-ready",
            emoji: "📊",
            goal: "Pandas, Matplotlib, lambda, scikit-learn ML, and Level 2 graduation.",
            sources: [week16, week17, week18, week19, week20]
        ),
        bundleTrackWeeks(
            id: 5,
            title: "L3 (1–5)",
            subtitle: "Pass 2 · Jul 6–10 · Foundations (again)",
            emoji: "📝",
            goal: "Tkinter text editor, Tic-Tac-Toe, cipher app, recursion, and live API data.",
            sources: [week21, week22, week23, week24, week25]
        ),
        bundleTrackWeeks(
            id: 6,
            title: "L3 (6–10)",
            subtitle: "Pass 2 · Jul 13–17 · Building depth (again)",
            emoji: "💾",
            goal: "JSON persistence, pygame review, OOP integration, and Level 3 capstone.",
            sources: [week26, week27, week28, week29, week30]
        ),
        bundleTrackWeeks(
            id: 7,
            title: "L4 (1–5)",
            subtitle: "Pass 2 · Jul 20–24 · Mid-level mastery (again)",
            emoji: "🧮",
            goal: "Programming paradigms, OOP adventure, functional Python, algorithms, and pathfinding.",
            sources: [week31, week32, week33, week34, week35]
        ),
        bundleTrackWeeks(
            id: 8,
            title: "L4 (6–10)",
            subtitle: "Pass 2 · Jul 27–31 · Round-ready (again)",
            emoji: "🤖",
            goal: "AI/ML, Tkinter for ML, weather APIs, capstone planning, and Level 4 live graduation.",
            sources: [week36, week37, week38, week39, week40]
        ),
        bundleTrackWeeks(
            id: 9,
            title: "Portfolio (1–5)",
            subtitle: "Pass 3 · Aug 3–7 · Final review (1 of 2)",
            emoji: "🔨",
            goal: "Ship calculator, adventure game, algorithm viz, pathfinding, and weather ML portfolio labs.",
            sources: [week41, week42, week43, week44, week45]
        ),
        bundleTrackWeeks(
            id: 10,
            title: "Portfolio (6–10)",
            subtitle: "Pass 3 · Aug 10–14 · Final review (2 of 2)",
            emoji: "🎓",
            goal: "GUI portfolio lab, final project sprints, polish, and Level 4 graduation showcase.",
            sources: [week46, week47, week48, week49, week50]
        ),
    ]
}
