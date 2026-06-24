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
        tryItPrompt: String? = nil,
        practiceSteps: [String]? = nil,
        starterCode: String,
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
            practiceSteps: practiceSteps,
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
        practiceSteps: [String]? = nil,
        starterCode: String? = nil,
        challengeQuestion: String? = nil,
        challengeAnswer: String? = nil,
        challengeAcceptedAnswers: [String]? = nil,
        codeTests: [CodeTest]? = nil,
        sessionTitlePrefix: String = "Session"
    ) -> LessonStep {
        let capstoneBody = """
Session capstone — complete the lessons above in this week first, then finish the project below in Playground.

\(body)
"""
        let defaultSteps = [
            "Complete all teach lessons in this week first.",
            "Read the Session capstone checklist in Learn.",
            "Open Playground and fill each TODO in the scaffold.",
            "Run often — fix one error at a time.",
            "Run auto-checks, then mark complete.",
        ]
        let resolvedTests = codeTests ?? defaultCapstoneCodeTests(week: week, starterCode: starterCode)
        return LessonStep(
            id: "w\(week)-live",
            title: "\(sessionTitlePrefix) \(sessionNumber): \(title)",
            body: capstoneBody,
            teacherScript: teacherScript,
            tryItPrompt: tryItPrompt,
            practiceSteps: practiceSteps ?? defaultSteps,
            starterCode: starterCode,
            challengeQuestion: challengeQuestion,
            challengeAnswer: challengeAnswer,
            challengeAcceptedAnswers: challengeAcceptedAnswers,
            codeTests: resolvedTests,
            format: .selfPaced,
            durationMinutes: 30
        )
    }

    private static func defaultCapstoneCodeTests(week: Int, starterCode: String?) -> [CodeTest]? {
        guard let code = starterCode, code.contains("TODO") else { return nil }
        return [
            CodeTest(
                id: "w\(week)-live-todo",
                label: "Completed capstone TODOs",
                assertionScript: """
assert user_code.count("TODO") < 3
""",
                inspectSourceOnly: true
            ),
        ]
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
        starterCode: SessionScaffolds.week11,
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
        starterCode: SessionScaffolds.week21,
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
        starterCode: SessionScaffolds.week41,
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
        starterCode: SessionScaffolds.week31,
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
                body: """
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
                teacherScript: "Ask Soha to predict the output before clicking Run. Then ask: what happens if we delete one quotation mark? Let her find the error message and read it aloud. Goal: make error messages feel friendly, not scary.",
                tryItPrompt: "Open Terminal and type: python3 --version",
                                practiceSteps: [
                    "Read Learn — what does print() do? What is a string?",
                    "Run the starter without changing anything — read every line of output.",
                    "Change 'Soha' to your own name and re-run. Predict first, then check.",
                    "Add a third print line with your favorite subject.",
                    "Deliberately delete one quote mark, Run, read the error, then fix it.",
                ],
                starterCode: """
# Step 1 — run this and read the output
print("Hello, Soha!")
print("I am learning Python!")

# Step 2 — YOUR TURN: add one more print line below
# print("My favorite subject is ___")
""",
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
                body: """
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
                teacherScript: "Draw a literal box on paper labeled 'name' with 'Soha' inside. Erase and rewrite the value when score updates. Before Run, ask: if score starts at 10 and we add 5, what does Python store?",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — draw the name and age boxes on paper with their values.",
                    "Run the starter. Does the output match what you predicted?",
                    "Change name to your actual name and grade to your grade — re-run.",
                    "Complete the YOUR TURN line: print next year's age using age + 1.",
                    "Run auto-checks. Fix any NameError by checking your spelling.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Let Soha pick her own facts (real name, grade, subject, hobby). Do not correct style — celebrate the first working version. When done, ask: how would you add a second hobby?",
                tryItPrompt: "Add your favorite subject and hobby.",
                                practiceSteps: [
                    "Read Learn — sketch the five output lines on paper before opening Playground.",
                    "Run the starter. Does the output match your sketch?",
                    "Change every placeholder value to YOUR real facts.",
                    "Complete the YOUR TURN lines (favorite subject and hobby).",
                    "Add one closing sentence that uses at least two variables.",
                ],
                starterCode: """
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
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w1-l4",
                title: "Combining text",
                body: """
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
                teacherScript: "Have Soha predict the output of each method before Run. Demonstrate the TypeError from mixing string + int — let her read the error and fix it herself using str() or a comma.",
                tryItPrompt: "Print: Soha loves Science Bowl — using variables for name and hobby.",
                                practiceSteps: [
                    "Read Learn — in the table, trace which method adds spaces automatically.",
                    "Run the starter. Match each print line to a method in the table.",
                    "Complete the YOUR TURN line using commas.",
                    "Add a line using + concatenation (remember to keep both sides strings).",
                    "Bonus: try one f-string line — print your name and grade in one sentence.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Have Soha predict the output before each Run. Ask: what type is the value from input() before int()? (str)",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace what happens when Python hits input() (who waits? who types?).",
                    "Run the starter. Type your real name at the prompt and press Enter.",
                    "Complete the YOUR TURN line — print a greeting that uses name.",
                    "Add one line: ask for age with int(input(...)) and print next year's age.",
                    "Run auto-checks, then answer the quick check.",
                ],
                starterCode: """
# Step 1 — run and type YOUR name when prompted
name = input("What is your name? ")

# Step 2 — YOUR TURN: print a greeting using name
# print("Hi", name + "!")

# Step 3 — optional: ask age as a number and print next year
# age = int(input("How old are you? "))
# print("Next year you will be", age + 1)
""",
                challengeQuestion: "Which function reads text from the user?",
                challengeAnswer: "input",
                challengeAcceptedAnswers: ["input()"]
            ),
            LessonStep(
                id: "w2-l2",
                title: "if / else",
                body: """
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
                teacherScript: "Trace score=85 and score=92 on paper before Run. Common mistake: using = instead of == in conditions.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace score=85 on paper: which branch runs?",
                    "Run the starter. Enter 85 at the prompt — does output match your prediction?",
                    "Run again with 92 — predict first, then check.",
                    "Complete the YOUR TURN else branch for scores below 80.",
                    "Run auto-checks, then answer the quick check.",
                ],
                starterCode: """
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
                challengeQuestion: "Which symbol checks equality?",
                challengeAnswer: "==",
                challengeAcceptedAnswers: ["double equals", "equals equals"]
            ),
            LessonStep(
                id: "w2-l3",
                title: "Mini project: Password Gate",
                body: """
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
                teacherScript: "Let Soha pick her own secret word (not python) after the first working version. Discuss: why never print the real password in code comments.",
                tryItPrompt: "Add a message when password is empty (\"\").",
                                practiceSteps: [
                    "Read Learn — fill in the trace table for python vs pizza.",
                    "Run the starter. Type python — predict output, then check.",
                    "Run again with a wrong password.",
                    "Complete the YOUR TURN else line.",
                    "Bonus: add elif password == \"\" with a helpful message.",
                ],
                starterCode: """
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
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w2-l4",
                title: "Lists & dictionaries",
                body: """
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
                teacherScript: "Draw the menu dict and order list on paper before coding. Ask: why is a dict better than two separate variables for prices?",
                tryItPrompt: "Add veggie pizza for $9 and append it to order.",
                                practiceSteps: [
                    "Read Learn — on paper, write menu dict with 3 pizzas and an empty order list.",
                    "Run the starter — predict order and price before Run.",
                    "Add veggie: 9 to menu and order.append(\"veggie\").",
                    "Print price of the last pizza in order using menu[...].",
                    "Run auto-checks, then answer the quick check.",
                ],
                starterCode: """
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
                challengeQuestion: "Which type maps a name to a price?",
                challengeAnswer: "dictionary",
                challengeAcceptedAnswers: ["dict"]
            ),
            LessonStep(
                id: "w2-l5",
                title: "while loops for menus",
                body: """
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
                teacherScript: "Trace cheese → pepperoni → done on paper before coding. Connect directly to live2 Pizza Shop: same loop, plus menu dict and order list from w2-l4.",
                                practiceSteps: [
                    "Read Learn — complete the trace table for cheese, pepperoni, done.",
                    "Run Step 1 only — predict 3 rounds, then Run and check.",
                    "Run Step 2 — type hi, then pizza, then done. Watch break stop the loop.",
                    "Change the prompt to say Pick a pizza or done (like the real capstone).",
                    "Run auto-checks — your code must use while True and break.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Before Run, trace on paper: write count=1, draw an arrow back, write count=2, etc. Ask: what is the LAST value of count when the loop finally stops? (6, because 6 <= 5 is False). Common mistake: <= vs <.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — fill in the trace table for count 1 through 6 on paper.",
                    "Run the starter — does 'Done!' print after the loop? (yes, it should).",
                    "Change 5 to 10 — predict how many lines print, then Run and check.",
                    "Complete the YOUR TURN line: print('Done!') after the loop.",
                    "Try removing count += 1, run once, then immediately press Ctrl+C — see what infinite looks like.",
                ],
                starterCode: """
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
                challengeQuestion: "What happens if you forget count += 1 in a while True loop?",
                challengeAnswer: "infinite loop",
                challengeAcceptedAnswers: ["never stops", "runs forever", "endless loop"]
            ),
            LessonStep(
                id: "w3-l2",
                title: "for loops",
                body: """
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
                teacherScript: "Draw range(3) as boxes: [0, 1, 2]. Ask: how do we make it print 1, 2, 3 instead? (range(1,4) or i+1). Contrast with while: for is cleaner when you know the count.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — on paper, write what range(3) produces (0, 1, 2) and range(1,4) produces (1, 2, 3).",
                    "Run the starter — count the output lines. Does it match range(3)?",
                    "Complete the YOUR TURN line: print 'Buzz!' inside the loop.",
                    "Change range(3) to range(1, 11) and print each number — predict 10 lines first.",
                    "Add a for loop that visits a list of 3 colors and prints each one.",
                ],
                starterCode: """
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
                challengeQuestion: "How many times does range(4) loop?",
                challengeAnswer: "4",
                challengeAcceptedAnswers: ["four", "4 times"]
            ),
            LessonStep(
                id: "w3-l3",
                title: "Mini project: Multiplication Table",
                body: """
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
                teacherScript: "Ask Soha to trace n=7, i=3 on paper before Run. Goal: she writes '7 x 3 = 21' without running. Then let her change n and predict the new last row.",
                tryItPrompt: "Change n to your favorite number.",
                                practiceSteps: [
                    "Read Learn — trace n=7, i=1 and n=7, i=10 on paper. What prints each time?",
                    "Run the starter — does it print 10 lines for n=7?",
                    "Complete the YOUR TURN print line inside the loop.",
                    "Change n to your favorite number — how does the output change?",
                    "Stretch: add int(input()) to let the user pick n at runtime.",
                ],
                starterCode: """
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
                practiceSteps: [
                    "Read Learn — study the example for \"Fizz Buzz — learn the pieces\".",
                    "Open Playground. Run the starter once and read every line of output.",
                    "Complete each TODO or YOUR TURN line in order — run after each fix.",
                    "After it works for 1–20, change the loop to 1–30.",
                    "Run auto-checks (if any), then answer the quick check.",
                ],
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
                body: """
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
                teacherScript: "Show the def/call as a machine: greet() is the machine, 'Soha' is the input, the print is the output. Call greet() with two different names to prove the body runs fresh each time. Ask: what if we called greet() with no argument?",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace greet('Soha') on paper: write name='Soha', then the print output.",
                    "Run the starter — does it print two greetings?",
                    "Complete the YOUR TURN line inside greet() so it prints 'Hello, Soha !'.",
                    "Add a third call: greet('Science Bowl') — what prints?",
                    "Run auto-checks. Fix any IndentationError by aligning the body under def.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Draw two boxes: one is bad_add (prints but returns nothing useful), one is good_add (hands back a value). Ask: if I want to multiply the result by 2, which version do I need? Let Soha try to use bad_add's result to see the None error.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace add(3, 7): write a=3, b=7, then 3+7=10, then total=10.",
                    "Run the starter — read the output and match each line to a call.",
                    "Complete the YOUR TURN line: print the result of add().",
                    "Write a rectangle_area(width, height) function that returns width * height.",
                    "Test letter_grade(95), letter_grade(85), letter_grade(70) — predict each grade.",
                ],
                starterCode: """
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
                challengeQuestion: "What keyword sends a value back from a function?",
                challengeAnswer: "return"
            ),
            LessonStep(
                id: "w4-l3",
                title: "Mini project: Calculator functions",
                body: """
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
                teacherScript: "Ask Soha to write divide on her own after seeing the pattern in add and subtract. Let her hit the ZeroDivisionError first, then guide the fix with the if b == 0 check. This is real error handling they'll see formally in Week 12.",
                tryItPrompt: "Add a divide function that checks for zero.",
                                practiceSteps: [
                    "Read Learn — on paper write what each function should return for add(3,4), subtract(10,4), multiply(6,7).",
                    "Run the starter — multiply already works. Does the output make sense?",
                    "Complete the YOUR TURN: print multiply(6, 7).",
                    "Add subtract(a, b) and add(a, b) functions following the same pattern.",
                    "Bonus: write divide(a, b) that returns an error message when b is 0.",
                ],
                starterCode: """
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
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w4-l4",
                title: "Read & write files",
                body: """
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
    f.write("Line 1 from Soha\n")
```

- `with` automatically closes the file when the block ends
- `\n` is the newline character — moves to the next line on disk

## Appending to a file

```
with open("notes.txt", "a") as f:
    f.write("Line 2 added later\n")
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
        print(line.strip())    # strip() removes \n at end
```

## Common bugs

- Forgetting `\n` → all text runs together on one line
- Using `"w"` to add more text → **erases** the file first! Use `"a"` to append
- `FileNotFoundError` on read → file path is wrong or you never created the file
- Forgetting `as f:` → `SyntaxError`
""",
                teacherScript: "After the code runs, open notes.txt in TextEdit together so Soha sees the file on disk. Ask: what mode would you use if you want to keep adding daily notes without losing old ones? (a for append). Compare write vs append with a real-world analogy: 'w' is whiteout, 'a' is a pen.",
                tryItPrompt: "Append a second line with mode \"a\".",
                                practiceSteps: [
                    "Read Learn — in the table, cover the 'Does' column and recall what each mode does.",
                    "Run the starter — do you see 'Line 1' and 'Line 2' printed?",
                    "Complete the YOUR TURN: print(f.read()) inside the read block.",
                    "Append a third line with your own text using mode 'a'.",
                    "Change the write block to mode 'a' — what happens to Line 1? (it disappears)",
                ],
                starterCode: """
# Step 1 — write (creates or overwrites the file)
with open("notes.txt", "w") as f:
    f.write("Line 1 from Soha\n")

# Step 2 — append (adds to the end)
with open("notes.txt", "a") as f:
    f.write("Line 2 appended\n")

# Step 3 — read and print
with open("notes.txt") as f:
    # YOUR TURN: print(f.read())

# Step 4 — readlines (challenge)
# with open("notes.txt") as f:
#     for line in f.readlines():
#         print(line.strip())
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
                body: """
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
                teacherScript: "Run random.randint(1,6) five times live and note each result — show that outcomes are truly different. Ask: could we get 7? (No — both endpoints, 1 and 6, are included; 7 is out of range). Compare to rolling a physical die.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — in the table, cover the 'Returns' column and recall each function.",
                    "Run the starter — what dice value do you get? Run again — is it different?",
                    "Complete the YOUR TURN: print('You rolled', dice).",
                    "Add die2 = random.randint(1,6) and print the total of both dice.",
                    "Bonus: use random.choice(['rock','paper','scissors']) and print the result.",
                ],
                starterCode: """
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
                challengeQuestion: "Which module gives random numbers?",
                challengeAnswer: "random",
                challengeAcceptedAnswers: ["import random"]
            ),
            LessonStep(
                id: "w5-l2",
                title: "Build: Guess the Number",
                body: """
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
                teacherScript: "Walk through one round together — teacher plays the game while Soha traces the loop on paper. Ask: without the break, what happens when you guess correctly? (Loops forever). Goal: connect while True + break to the Pizza Shop pattern from w2-l5.",
                tryItPrompt: "Complete Game 1 in the Games tab.",
                                practiceSteps: [
                    "Read Learn — trace secret=50, guess=25. Write: 25<50? Yes → Too low!",
                    "Run the full starter (it's in the Games tab). Play one real game.",
                    "After winning, read the code — find the break and explain why it's in the else.",
                    "Add a guesses counter and print 'You got it in N tries!' at the end.",
                    "Stretch: add a max-guesses limit so the game ends after 7 wrong guesses.",
                ],
                starterCode: games[0].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w5-l3",
                title: "Build: Rock Paper Scissors",
                body: """
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
    elif (player == "rock"     and computer == "scissors") or \
         (player == "paper"    and computer == "rock")     or \
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
                teacherScript: "Before coding, play one physical round on paper — trace each condition. Ask: what is .lower() for? What if the player types 'ROCK'? Then connect the elif chain to the real game rules.",
                tryItPrompt: "Complete Game 2 in the Games tab.",
                                practiceSteps: [
                    "Read Learn — fill in the rules table for all three winning combos.",
                    "Run the starter (from Games tab) and play all 3 rounds.",
                    "Find the line that updates player_score and explain when it runs.",
                    "Add .lower() if it's missing — type 'ROCK' to test.",
                    "Stretch: add input validation — reject anything that isn't rock/paper/scissors.",
                ],
                starterCode: games[1].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w5-l4",
                title: "Tuples",
                body: """
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
                teacherScript: "Compare to coordinates on a math graph: (x, y) doesn't change — it's a fixed location. Show the TypeError when trying to modify a tuple element. Connect to pygame: pygame.Rect positions are often tuples.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — what is one situation where you'd choose tuple over list?",
                    "Run the starter — print x and y from point using unpacking.",
                    "Complete the YOUR TURN: print('x:', point[0], 'y:', point[1]).",
                    "Try point[0] = 99 and run — read the TypeError message.",
                    "Create a list of 3 (question, answer) tuples and loop through them.",
                ],
                starterCode: """
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
                challengeQuestion: "Can you change point[0] after creating a tuple?",
                challengeAnswer: "no",
                challengeAcceptedAnswers: ["cannot", "immutable"]
            ),
            LessonStep(
                id: "w5-l5",
                title: "Default parameters & *args",
                body: """
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
                teacherScript: "Call total() with 2, then 3, then 5 arguments to show flexibility. Explain: the * star collects everything extra into a tuple. Ask Soha to predict the output of report(80, 90, 85) before Run.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace greet('Soha') vs greet('Soha', 'Hi') — which greeting shows each time?",
                    "Run the starter — which greet call uses the default?",
                    "Complete the YOUR TURN: print(total(1, 2, 3)).",
                    "Write a new function biggest(*nums) that returns max(nums).",
                    "Bonus: call report() with your actual quiz scores and label='NSB Score'.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Draw three boxes with indices 0,1,2 labeling fruits. Ask: what index is 'cherry'? (2). What is fruits[-1]? (cherry). Connect to Science Bowl quiz: each question is a list item.",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — on paper write the index for each fruit (apple=0, banana=1, cherry=2).",
                    "Run the starter — what does fruits[-1] print?",
                    "Add a fourth fruit with .append() and print the full list.",
                    "Remove 'banana' with .remove() and print the list again.",
                    "Print len(fruits) before and after adding — see how it changes.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Draw a loop arrow: list → first item → body → back to list → second item. Ask: how many times does the body run if there are 5 colors? (5). Connect enumerate to the quiz: we need i so we can display 'Question 1, 2, 3...'",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — trace the colors loop: write 'I like red', then 'I like green', then 'I like blue'.",
                    "Run the starter — complete the YOUR TURN print inside the loop.",
                    "Add enumerate: print the index and color together.",
                    "Build a bonuses list by looping over scores and appending each score + 5.",
                    "Change the list to 5 Science Bowl subjects and print each one.",
                ],
                starterCode: """
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
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w6-l3",
                title: "Build: Science Quiz Game",
                body: """
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
    print("\n" + q)
    for i, opt in enumerate(options):
        print(f"  {i}. {opt}")
    answer = int(input("Answer number: "))
    if answer == correct:
        print("Correct! ✓")
        score += 1
    else:
        print(f"Nope — answer was {options[correct]}")

print(f"\nYou scored {score} / {len(questions)}")
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
- Forgetting `\n` before the question → all questions run together without spacing
""",
                teacherScript: "Connect to Science Bowl prep — Soha already knows these topics. Ask her to add 2 real NSB practice questions from her DOE materials. Celebrate every correct answer. After the game, show how to change the scoring to percentage.",
                tryItPrompt: "Add 2 more science questions from your NSB prep.",
                                practiceSteps: [
                    "Read Learn — unpack one question tuple on paper: what is q? what is options? what is correct?",
                    "Run the starter (from Games tab) and answer all 5 questions.",
                    "Add 2 Science Bowl questions you know from practice.",
                    "Change the final print to show percentage: f'{score/len(questions)*100:.0f}%'.",
                    "Stretch: shuffle questions with random.shuffle(questions) before the loop.",
                ],
                starterCode: games[2].starterCode,
                challengeQuestion: "How many questions are in the starter quiz?",
                challengeAnswer: "5",
                challengeAcceptedAnswers: ["five"]
            ),
            LessonStep(
                id: "w6-l4",
                title: "Tkinter: windows & buttons",
                body: """
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
                teacherScript: "First button click is a milestone — celebrate it! Ask: what happens if we write command=on_click() with parentheses? (Run it and see: the function fires immediately instead of on click). Show that .pack() order determines top-to-bottom layout.",
                tryItPrompt: "Add a label with today's date.",
                                practiceSteps: [
                    "Read Learn — what does mainloop() do? Why run in Terminal for Tkinter?",
                    "Run the starter in Terminal (Open in Terminal from Playground).",
                    "Complete the YOUR TURN Button line so clicking prints 'Clicked!'.",
                    "Add a second Label with today's date (you can hardcode it as a string).",
                    "Bonus: add a Quit button with command=root.destroy.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Draw a 3x3 grid on paper. Label x=0,1,2 across the top and y=0,1,2 down the side. Put P at (0,0) and move it right twice — what are the new coordinates? Ask: what is grid[1][2]? (the middle-right cell).",
                tryItPrompt: nil,
                                practiceSteps: [
                    "Read Learn — draw the screen coordinate system on paper (0,0 top-left, y down).",
                    "Run the starter — what is the output after x += 1?",
                    "Complete the YOUR TURN: print('Moved right:', x, y).",
                    "Add boundary checking: only increase x if x < 5.",
                    "Print a simple 3x3 grid using a 2D list and a for loop.",
                ],
                starterCode: """
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
                challengeQuestion: "On a screen, which direction does y increase?",
                challengeAnswer: "down"
            ),
            LessonStep(
                id: "w7-l2",
                title: "pygame window",
                body: """
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
                teacherScript: "Run the starter together. Celebrate the window appearing! Ask: what is clock.tick(30) for? (limits to 30 FPS so the loop doesn't go faster than needed). Change the rect color live to show RGB.",
                tryItPrompt: "Run: pip3 install pygame",
                                practiceSteps: [
                    "Install pygame: pip3 install pygame in Terminal first.",
                    "Run the starter via Open in Terminal — does a window appear with a red square?",
                    "Complete the YOUR TURN: add the screen = pygame.display.set_mode(...) line.",
                    "Change the rect color to gold (255, 215, 0) and position it to (100, 100).",
                    "Add a second rect in a different color — draw both on screen.",
                ],
                starterCode: """
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
                challengeQuestion: "What pip command installs pygame?",
                challengeAnswer: "pip3 install pygame",
                challengeAcceptedAnswers: ["pip install pygame"]
            ),
            LessonStep(
                id: "w7-l3",
                title: "Build: Treasure Hunt",
                body: """
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
                teacherScript: "Draw the 3x3 grid on paper, place P at (0,0) and T at (2,2). Move P step by step with N/S/E/W — practice on paper before coding. Ask: what does 'and player_y > 0' prevent? (Going above row 0).",
                tryItPrompt: "Complete Game 4 in the Games tab.",
                                practiceSteps: [
                    "Read Learn — trace the path e,s,e,s on the grid table. Does it reach (2,2)?",
                    "Run the starter (from Games tab) — play a game from (0,0) to (2,2).",
                    "Add a move counter — print 'Moves: N' after the game ends.",
                    "Add a trap at (1,1): if player_x == 1 and player_y == 1, reset to (0,0).",
                    "Stretch: print the grid after each move with 'P' and 'T' marked.",
                ],
                starterCode: games[3].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w7-l4",
                title: "Plotting with matplotlib",
                body: """
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
                teacherScript: "Connect to Science Bowl: plot Soha's real practice quiz scores from past weeks. Ask: what story does the graph tell? (improving over time). Show how changing ylim(0,100) vs ylim(50,100) affects how dramatic the improvement looks.",
                tryItPrompt: "pip3 install matplotlib",
                                practiceSteps: [
                    "Install matplotlib: pip3 install matplotlib in Terminal.",
                    "Run the starter in Terminal (Open in Terminal) — does a chart window appear?",
                    "Complete the YOUR TURN: plt.plot(days, scores, marker='o').",
                    "Change the data to your own quiz scores (make up 5 sessions) and replot.",
                    "Try plt.bar() instead of plt.plot() — what does the chart look like now?",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Ask Soha to close Playground and sketch on paper for 5 minutes before opening code. The plan should include: player position, coins list, timer variable, and win condition. Save the sketch — compare to finished code at the end.",
                tryItPrompt: "Open Final Boss tab and read all three requirements.",
                                practiceSteps: [
                    "Read Learn — list the three Final Challenge requirements from memory.",
                    "Sketch the 400x300 game window on paper — mark player and 3 coin positions.",
                    "Write the game state variables on paper: player, coins, score, time_left.",
                    "Run the starter — read the printed plan. Add one more specific detail about YOUR game.",
                    "Answer the quick check: name the three Final Challenge requirements.",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Build in stages: (1) movement only, (2) add coins, (3) add collision. Test movement for 2 minutes before touching coins. Celebrate the first coin disappearing on contact!",
                tryItPrompt: "Use starter code from Game 5.",
                                practiceSteps: [
                    "Read Learn — trace one frame: events → input → collision → draw → flip.",
                    "Run the starter (Games tab) — can you move the player with arrow keys?",
                    "Watch a coin disappear when you touch it — verify score increments.",
                    "Add player.clamp_ip(screen.get_rect()) to prevent moving off-screen.",
                    "Test: collect all 3 coins — what happens when coins list is empty?",
                ],
                starterCode: games[4].starterCode,
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            LessonStep(
                id: "w8-l3",
                title: "Add sound, 3 coins, timer",
                body: """
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
                teacherScript: "Add features in order: timer first (easy), then win/lose screens, then sound last. Take a screen recording when all three work — this is the portfolio piece for Session 8. Celebrate with a high-five!",
                tryItPrompt: "Mark all three checkboxes when done.",
                                practiceSteps: [
                    "Add the timer to your working w8-l2 code — verify it counts down in the top-right corner.",
                    "Add the win screen (green background, 'You Win!') when score == 3.",
                    "Add the lose screen (red background, 'Time's Up!') when time_left <= 0.",
                    "Add coin_sound.play() inside the collision block (with a .wav file or the numpy beep).",
                    "Check off all three Final Boss checkboxes when everything works together.",
                ],
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
                body: """
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
                teacherScript: "Open a browser, type 127.0.0.1:5000, and show 'connection refused' before the server is running. Then start Flask in Terminal, refresh — page appears. This makes the request/response cycle concrete. Compare to Science Bowl Coach (native app, no server needed).",
                tryItPrompt: "pip3 install flask",
                                practiceSteps: [
                    "Read Learn — draw the request/response cycle: Browser → Flask → HTML → Browser.",
                    "Install Flask: pip3 install flask in Terminal.",
                    "Run the starter in Playground — read the printed explanation of the cycle.",
                    "Complete the YOUR TURN print line.",
                    "Look up what port 5000 is used for — why 5000 and not 80?",
                ],
                starterCode: """
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
                challengeQuestion: "What command installs Flask?",
                challengeAnswer: "pip3 install flask",
                challengeAcceptedAnswers: ["pip install flask"]
            ),
            LessonStep(
                id: "w9-l2",
                title: "Your first Flask route",
                body: """
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
                teacherScript: "Type the URL live in Safari while Flask is running — see the page appear. Then add an /about route live and visit it. Ask: what does @app.route('/') do? What would happen with @app.route('/secret')?",
                tryItPrompt: "Change the heading to include your name.",
                                practiceSteps: [
                    "Read Learn — what does @app.route('/') do?",
                    "Complete the YOUR TURN: add app.run(debug=True) at the bottom.",
                    "Save as todo_app.py and run python3 todo_app.py in Terminal.",
                    "Open Safari → 127.0.0.1:5000 — see your page!",
                    "Add a second route /about that returns your name and grade as HTML.",
                ],
                starterCode: """
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
                challengeQuestion: "What URL opens your local Flask app?",
                challengeAnswer: "127.0.0.1:5000",
                challengeAcceptedAnswers: ["localhost:5000", "localhost"]
            ),
            live9,
            LessonStep(
                id: "w9-l3",
                title: "Extend your Todo app",
                body: """
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
                teacherScript: "Build delete first, then clear. Show the link URL in Safari's status bar so Soha sees /delete/0. Ask: what happens to indices after deleting item 0? (Everything shifts down — a good problem to discuss).",
                tryItPrompt: "Add a route /clear that empties the todo list.",
                                practiceSteps: [
                    "Read Learn — what does redirect('/') do?",
                    "Add /clear route that empties todos and redirects home.",
                    "Add /delete/<int:index> route with bounds checking.",
                    "Add delete links next to each task in the home() HTML.",
                    "Polish: add CSS to style the page (background color, font, spacing).",
                ],
                starterCode: """
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
                body: """
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
                teacherScript: "Walk through the demo script timing: 30/60/30 seconds. Ask Soha to rehearse once without looking at notes. Common issue on demo day: the server isn't running — remind her to start Terminal first. Celebrate: she built a real web app!",
                tryItPrompt: "Add inline CSS: style the h1 and button colors.",
                                practiceSteps: [
                    "Read Learn — what are the three phases of a 2-minute demo?",
                    "Add the CSS styles to your home() route — run and refresh in Safari.",
                    "Test every button: add, delete, clear. Does empty-input submit anything?",
                    "Add edge case handling: ignore empty tasks, cap task length at 100 chars.",
                    "Rehearse your 2-minute demo once aloud — time yourself.",
                ],
                starterCode: """
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
        <input name="task" placeholder="What's next?" maxlength="100">
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
                challengeQuestion: nil,
                challengeAnswer: nil
            ),
            live10,
            LessonStep(
                id: "w10-l3",
                title: "Portfolio & next steps",
                body: """
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
                teacherScript: "Celebrate! Print the portfolio table and ask Soha to circle the project she is most proud of. Export progress JSON together. Take a screenshot of the Coin Collector running and the Todo app in Safari — save to a 'Soha Python Portfolio' folder.",
                tryItPrompt: "Progress tab → Export progress JSON as backup.",
                                practiceSteps: [
                    "Read Learn — which project used the most new skills?",
                    "Run the starter — edit it to include YOUR real portfolio (your actual project names).",
                    "Export progress JSON from the Progress tab.",
                    "Take a screenshot of your Coin Collector and Todo app — save to Desktop.",
                    "Write 3 sentences: what was hardest, what you're most proud of, what you want next.",
                ],
                starterCode: """
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
