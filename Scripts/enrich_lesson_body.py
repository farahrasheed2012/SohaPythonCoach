#!/usr/bin/env python3
"""Auto-expand thin lesson bodies into full student-facing teaching content."""

from __future__ import annotations

import re
from typing import Optional

WHY_MATTERS: dict[str, str] = {
    "if": "Every game, quiz, and app chooses different behavior based on conditions.",
    "function": "Functions keep code organized — write once, call many times.",
    "loop": "Loops power menus, games, and anything that repeats.",
    "class": "Classes model real things: players, cards, weather data.",
    "list": "Lists store collections: questions, scores, inventory items.",
    "dict": "Dictionaries map names to values — menus, settings, JSON data.",
    "file": "Files save work between runs — notes, saves, CSV exports.",
    "random": "Randomness makes games fair and unpredictable.",
    "gui": "GUIs let anyone use your program without reading code.",
    "api": "APIs connect your program to live data on the internet.",
    "pandas": "Pandas handles tables — scores, weather, science data.",
    "plot": "Graphs reveal patterns numbers alone hide.",
    "ml": "Machine learning finds patterns in data to make predictions.",
    "web": "Web apps reach anyone with a browser.",
    "error": "Handling errors keeps programs friendly when something goes wrong.",
    "sort": "Sorting and searching are core CS skills used everywhere.",
    "game": "Game loops combine input, update, and draw every frame.",
    "plan": "Planning before coding saves hours of debugging.",
}


def topic_keys(title: str, body: str) -> list[str]:
    text = (title + " " + body).lower()
    keys = []
    mapping = [
        ("if", "if"), ("elif", "if"), ("else", "if"), ("decision", "if"),
        ("function", "function"), ("def ", "function"), ("return", "function"),
        ("loop", "loop"), ("while", "loop"), ("for ", "loop"), ("range", "loop"),
        ("class", "class"), ("object", "class"), ("__init__", "class"),
        ("list", "list"), ("append", "list"), ("comprehension", "list"),
        ("dict", "dict"), ("json", "dict"), ("menu", "dict"),
        ("file", "file"), ("open(", "file"), ("csv", "file"),
        ("random", "random"),
        ("tkinter", "gui"), ("gui", "gui"), ("button", "gui"), ("window", "gui"),
        ("api", "api"), ("request", "api"), ("flask", "web"), ("route", "web"),
        ("pandas", "pandas"), ("dataframe", "pandas"),
        ("matplotlib", "plot"), ("plot", "plot"), ("chart", "plot"),
        ("sklearn", "ml"), ("machine learning", "ml"), ("model", "ml"),
        ("try", "error"), ("except", "error"), ("traceback", "error"),
        ("sort", "sort"), ("search", "sort"), ("bfs", "sort"), ("bubble", "sort"),
        ("pygame", "game"), ("sprite", "game"), ("game", "game"),
        ("plan", "plan"), ("demo", "plan"), ("rehears", "plan"),
    ]
    for needle, key in mapping:
        if needle in text and key not in keys:
            keys.append(key)
    return keys or ["plan"]


def trace_prompt(title: str, starter: str) -> str:
    t = title.lower()
    if "if" in t or "elif" in t:
        return (
            "Pick two test values (one True branch, one False). "
            "Write what prints for each **before** you Run."
        )
    if "while" in t or "loop" in t or "for" in t:
        return "How many times will the loop run? Write each expected output line on paper."
    if "function" in t or "def" in t:
        return "Pick sample arguments. Trace into the function and write the return value."
    if "class" in t or "object" in t:
        return "Draw a box labeled with the class name. List each attribute and method inside."
    if "input" in t or "ask" in t:
        return "Write sample user input. Trace: prompt → variable → next print line."
    if "file" in t or "read" in t or "write" in t:
        return "After Run, what should be on disk? Draw the file contents before and after."
    if "api" in t or "request" in t or "json" in t:
        return "Sketch: URL → response → Python dict → one value you will print."
    if "plot" in t or "matplotlib" in t:
        return "Sketch the x/y axes and where each point goes before plt.show()."
    if "plan" in t or "demo" in t or "rehears" in t:
        return "Bullet your plan or demo script on paper before opening Playground."
    return "Read the starter top to bottom. Predict the full output before pressing Run."


def common_bugs(title: str, body: str) -> str:
    text = (title + " " + body).lower()
    bugs = []
    if "if" in text or "==" in body:
        bugs.append("Using `=` instead of `==` inside conditions")
    if "while" in text:
        bugs.append("Infinite loop — forgetting to update the counter or add `break`")
    if "for" in text or "range" in text:
        bugs.append("Off-by-one: `range(1, 4)` runs 3 times (1,2,3), not 4")
    if "def" in text or "function" in text:
        bugs.append("Forgetting `return` when you need a value back")
    if "input" in text:
        bugs.append("Forgetting that `input()` always returns a string")
    if "class" in text:
        bugs.append("Forgetting `self.` when accessing attributes inside methods")
    if "dict" in text or "json" in text:
        bugs.append("KeyError — accessing a key that does not exist")
    if "file" in text or "open" in text:
        bugs.append("Wrong mode: `\"w\"` overwrites; use `\"a\"` to append")
    if "tkinter" in text or "gui" in text:
        bugs.append("Missing `root.mainloop()` — window flashes and closes")
    if "flask" in text:
        bugs.append("Running Flask with Playground Run — use Terminal instead")
    if not bugs:
        bugs.append("Running before reading — always predict output first")
        bugs.append("Changing too many lines at once — fix one error at a time")
    return "\n".join(f"- {b}" for b in bugs[:4])


def pedagogical_practice_steps(
    title: str,
    body: str,
    starter: str,
    try_it: Optional[str] = None,
    lesson_id: str = "",
) -> list[str]:
    week = 0
    if lesson_id.startswith("w") and "-l" in lesson_id:
        try:
            week = int(lesson_id[1 : lesson_id.index("-")])
        except ValueError:
            pass

    steps = [
        f"Read **Learn** for \"{title}\" — do the paper trace before coding.",
        "Open Playground. Read the starter top to bottom without running yet.",
    ]
    if "Step" in starter or "TODO" in starter or "YOUR TURN" in starter:
        steps.append("Complete each Step / TODO in order — Run after every fix.")
    else:
        steps.append("Run once, compare output to your prediction, then change one line.")
    if try_it:
        steps.append(try_it)
    elif week >= 11:
        steps.append(f"Connect this skill to the Week {week} session capstone in your own words.")
    else:
        steps.append("Explain the main idea out loud in one sentence — teach it back.")
    steps.append("Run auto-checks (if any), then answer the quick check.")
    return steps


def enrich_starter_code(starter: str, title: str, lesson_id: str) -> str:
    if not starter or starter.startswith("games["):
        return starter
    if "Step 1" in starter or "YOUR TURN" in starter or "TODO" in starter:
        return starter
    if lesson_id in {"w3-l4"}:
        return starter

    lines = starter.strip().split("\n")
    header = f"# {title} — work through each step below\n"
    return header + "\n".join(lines)


def enrich_body(
    title: str,
    body: str,
    starter_code: str,
    teacher_script: str,
    lesson_id: str = "",
    try_it: Optional[str] = None,
    challenge_q: Optional[str] = None,
    challenge_a: Optional[str] = None,
) -> str:
    """Expand thin body into structured teaching content."""
    if len(body.strip()) > 900 and "##" in body:
        return body.strip()

    parts: list[str] = [f"**Today's focus:** {title}\n"]

    core = body.strip()
    if core:
        parts.append("### The idea\n")
        parts.append(core)

    keys = topic_keys(title, body)
    why_bits = [WHY_MATTERS[k] for k in keys if k in WHY_MATTERS]
    if why_bits:
        parts.append("\n\n### Why it matters\n")
        parts.append(" ".join(dict.fromkeys(why_bits)))

    if starter_code and not starter_code.startswith("games[") and "```" not in core:
        sample = starter_code.strip()
        if len(sample) > 600:
            sample = "\n".join(sample.split("\n")[:18]) + "\n# ..."
        parts.append("\n\n### Example to study\n```\n" + sample + "\n```")

    parts.append("\n\n### Paper trace (do this first)\n")
    parts.append(trace_prompt(title, starter_code))

    parts.append("\n\n### Common mistakes\n")
    parts.append(common_bugs(title, body))

    if lesson_id:
        m = re.match(r"w(\d+)-", lesson_id)
        if m and int(m.group(1)) >= 11:
            parts.append(
                f"\n\n### Session prep\n"
                f"Finish this lesson before starting the Week {m.group(1)} capstone project."
            )

    if challenge_q and challenge_a:
        parts.append(
            f"\n\n### Check your understanding\n"
            f"Quick check: *{challenge_q}* — think before peeking at hints."
        )

    if teacher_script and len(teacher_script) > 20:
        parts.append(f"\n\n### Coach note\n{teacher_script}")

    parts.append(
        "\n\n### Your job in Playground\n"
        "Work the starter step by step. Predict → Run → fix one error at a time."
    )

    return "\n".join(parts)


def build_auto_enrichment(
    lesson_id: str,
    title: str,
    body: str,
    teacher_script: str,
    starter_code: str,
    try_it: Optional[str] = None,
    challenge_q: Optional[str] = None,
    challenge_a: Optional[str] = None,
) -> dict:
    enriched_body = enrich_body(
        title, body, starter_code, teacher_script, lesson_id,
        try_it, challenge_q, challenge_a,
    )
    enriched_starter = enrich_starter_code(starter_code, title, lesson_id)
    steps = pedagogical_practice_steps(
        title, enriched_body, enriched_starter, try_it, lesson_id,
    )
    return {
        "body": enriched_body,
        "teacherScript": teacher_script,
        "practiceSteps": steps,
        "starterCode": enriched_starter,
    }
