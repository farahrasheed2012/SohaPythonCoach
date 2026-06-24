#!/usr/bin/env python3
"""Shared helpers for student-facing practice steps, scaffolds, and code tests."""

from __future__ import annotations

import re
from typing import Optional


def swift_string(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")


def is_game_starter(code: str) -> bool:
    return bool(code) and "games[" in code


def is_planning_starter(code: str) -> bool:
    if not code:
        return False
    lowered = code.lower()
    return "sketch on paper" in lowered or "checklist" in lowered or "game plan" in lowered


def already_scaffolded(code: str) -> bool:
    markers = ("TODO", "YOUR TURN", "# Step", "finish the TODO", "capstone —")
    return any(m in code for m in markers)


def default_practice_steps(
    title: str,
    try_it: Optional[str] = None,
    code: str = "",
) -> list[str]:
    code = code or ""
    if is_game_starter(code):
        return [
            "Read Learn, then open the **Games** tab for step-by-step instructions.",
            "Copy or open the starter in Playground.",
            "Get one feature working before adding extras.",
            "Test a happy path and one wrong input.",
            "Run auto-checks (if any), then answer the quick check.",
        ]
    if is_planning_starter(code):
        return [
            "Read Learn and sketch or write your plan on paper first.",
            "Open Playground and replace each placeholder with your own words.",
            "Run and read the output — does it match your plan?",
            "Add one more line that is specific to your project.",
            "Answer the quick check when done.",
        ]
    steps = [
        f'Read Learn — study the example for "{title}".',
        "Open Playground. Run the starter once and read every line of output.",
    ]
    if already_scaffolded(code):
        steps.append("Complete each TODO or YOUR TURN line in order — run after each fix.")
    else:
        steps.append("Change one value or line, predict the output, then Run again.")
    if try_it:
        steps.append(try_it)
    steps.append("Run auto-checks (if any), then answer the quick check.")
    return steps


def capstone_practice_steps() -> list[str]:
    return [
        "Complete all teach lessons in this week first.",
        "Read the Session capstone checklist in Learn.",
        "Open Playground and fill each TODO in the scaffold.",
        "Run often — fix one error at a time.",
        "Run auto-checks, then mark complete.",
    ]


def _is_hideable_line(line: str) -> bool:
    stripped = line.strip()
    if not stripped or stripped.startswith("#"):
        return False
    if stripped.endswith(":"):
        return False
    structure_prefixes = (
        "if ",
        "elif ",
        "else",
        "for ",
        "while ",
        "def ",
        "class ",
        "with ",
        "try:",
        "except",
        "finally:",
        "import ",
        "from ",
    )
    if stripped.startswith(structure_prefixes):
        return False
    return stripped.startswith("print(") or "=" in stripped or stripped.startswith("return")


def scaffold_starter(code: str | None, lesson_id: str = "") -> str:
    if not code:
        return ""
    if is_game_starter(code) or already_scaffolded(code):
        return code
    if lesson_id in {"w3-l4"}:
        return code

    lines = code.rstrip().split("\n")
    hideable = [i for i, line in enumerate(lines) if _is_hideable_line(line)]
    if not hideable:
        return code

    hide = hideable[-1:]
    new_lines: list[str] = ["# Read the steps in Learn, then complete below.", ""]
    for i, line in enumerate(lines):
        if i in hide:
            indent = line[: len(line) - len(line.lstrip())]
            new_lines.append(f"{indent}# YOUR TURN: {line.strip()}")
        else:
            new_lines.append(line)
    return "\n".join(new_lines)


def _keyword_tests(code: str) -> list[tuple[str, str]]:
    checks: list[tuple[str, str]] = []
    patterns = [
        ("def ", "Defines a function"),
        ("class ", "Defines a class"),
        ("for ", "Uses a for loop"),
        ("while ", "Uses a while loop"),
        ("if ", "Uses if"),
        ("elif ", "Uses elif"),
        ("input(", "Uses input()"),
        ("import ", "Imports a module"),
        ("%", "Uses modulo"),
        ("return", "Uses return"),
        (".append", "Uses append"),
        ("try:", "Uses try/except"),
        ("open(", "Uses file open"),
        ("@app.route", "Defines a Flask route"),
        ("tk.", "Uses Tkinter"),
        ("pygame", "Uses pygame"),
        ("plt.", "Uses matplotlib"),
    ]
    for kw, label in patterns:
        if kw in code:
            checks.append((kw.replace('"', '\\"'), label))
    return checks


def auto_code_tests(
    lesson_id: str,
    code: str,
    challenge_answer: Optional[str] = None,
) -> list[tuple[str, str, str, bool]]:
    """Return (id, label, assertion_script, inspect_source_only)."""
    tests: list[tuple[str, str, str, bool]] = []
    if not code:
        return tests

    if is_game_starter(code):
        tests.append(
            (
                f"{lesson_id}-game",
                "Uses game starter code",
                'assert "def " in user_code or "while " in user_code or "import " in user_code',
                True,
            )
        )
        return tests

    for kw, label in _keyword_tests(code)[:2]:
        esc = kw.replace("\\", "\\\\").replace('"', '\\"')
        tests.append((f"{lesson_id}-kw", label, f'assert "{esc}" in user_code', True))

    if "print" in code:
        tests.append(
            (f"{lesson_id}-print", "Uses print()", 'assert "print" in user_code', True)
        )

    scaffolded = scaffold_starter(code, lesson_id)
    if "# YOUR TURN:" in scaffolded and scaffolded != code:
        tests.append(
            (
                f"{lesson_id}-edit",
                "Completed at least one YOUR TURN line",
                'assert user_code.count("# YOUR TURN:") < 2',
                True,
            )
        )

    if not tests:
        tests.append(
            (
                f"{lesson_id}-code",
                "Has Python code",
                "assert len(user_code.strip()) > 10",
                True,
            )
        )

    return tests[:2]


def emit_practice_steps_swift(steps: list[str], indent: str = "                ") -> str:
    lines = [f"{indent}practiceSteps: ["]
    for step in steps:
        lines.append(f'{indent}    "{swift_string(step)}",')
    lines.append(f"{indent}],")
    return "\n".join(lines)


def emit_code_tests_swift(
    lesson_id: str,
    tests: list[tuple[str, str, str, bool]],
    indent: str = "                ",
) -> str:
    if not tests:
        return ""
    lines = [f"{indent}codeTests: ["]
    for i, (tid, label, assertion, inspect_only) in enumerate(tests):
        slug = re.sub(r"[^a-z0-9]+", "-", label.lower()).strip("-")[:24] or f"t{i}"
        test_id = f"{lesson_id}-{slug}"
        inspect = "true" if inspect_only else "false"
        lines.append(f"{indent}    CodeTest(")
        lines.append(f'{indent}        id: "{swift_string(test_id)}",')
        lines.append(f'{indent}        label: "{swift_string(label)}",')
        lines.append(f'{indent}        assertionScript: """')
        for line in assertion.strip().splitlines():
            lines.append(f"{indent}        {line}")
        lines.append(f'{indent}        """,')
        lines.append(f"{indent}        inspectSourceOnly: {inspect}")
        lines.append(f"{indent}    ),")
    lines.append(f"{indent}],")
    return "\n".join(lines)
