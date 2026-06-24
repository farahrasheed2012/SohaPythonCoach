#!/usr/bin/env python3
"""Add practiceSteps, scaffolded starters, and codeTests to weeks 2–10 lessons."""

from __future__ import annotations

import re
from pathlib import Path

from lesson_enrichments import enrichment_for
from lesson_teaching_utils import (
    auto_code_tests,
    default_practice_steps,
    emit_code_tests_swift,
    emit_practice_steps_swift,
    scaffold_starter,
)

ROOT = Path(__file__).resolve().parents[1]
SEED = ROOT / "Data" / "CurriculumSeed.swift"

LESSON_IDS = [
    "w1-l1", "w1-l2", "w1-l3", "w1-l4",
    "w2-l1", "w2-l2", "w2-l3", "w2-l4", "w2-l5",
    "w3-l1", "w3-l2", "w3-l3", "w3-l4",
    "w4-l1", "w4-l2", "w4-l3", "w4-l4",
    "w5-l1", "w5-l2", "w5-l3", "w5-l4", "w5-l5",
    "w6-l1", "w6-l2", "w6-l3", "w6-l4",
    "w7-l1", "w7-l2", "w7-l3", "w7-l4",
    "w8-l1", "w8-l2", "w8-l3",
    "w9-l1", "w9-l2", "w9-l3",
    "w10-l1", "w10-l3",
]

SKIP_SCAFFOLD = {"w3-l4", "w6-l1"}
SKIP_CODE_TESTS = {"w3-l4", "w6-l1", "w4-l1", "w1-l1", "w1-l2", "w1-l3", "w1-l4"}


def extract_lesson_block(text: str, lesson_id: str) -> tuple[int, int] | None:
    marker = f'id: "{lesson_id}"'
    pos = text.find(marker)
    if pos == -1:
        return None
    start = text.rfind("LessonStep(", 0, pos)
    if start == -1:
        return None
    depth = 0
    i = start
    while i < len(text):
        if text.startswith("LessonStep(", i):
            depth += 1
            i += len("LessonStep(")
            continue
        if text[i] == "(":
            depth += 1
        elif text[i] == ")":
            depth -= 1
            if depth == 0:
                return start, i + 1
        i += 1
    return None


def parse_field(block: str, field: str) -> str | None:
    m = re.search(rf'{field}: """(.*?)"""', block, re.DOTALL)
    if m:
        return m.group(1)
    m = re.search(rf'{field}: "((?:[^"\\]|\\.)*)"', block)
    if m:
        return (
            m.group(1)
            .replace("\\n", "\n")
            .replace('\\"', '"')
            .replace("\\\\", "\\")
        )
    if re.search(rf"{field}: nil", block):
        return None
    if field == "starterCode" and "games[" in block:
        m = re.search(r"starterCode: (games\[\d+\]\.starterCode)", block)
        if m:
            return m.group(1)
    return None


def swift_multiline_literal(text: str) -> str:
    """Escape backslashes for Swift multiline string literals."""
    return text.replace("\\", "\\\\")


def replace_triple_quoted_field(block: str, field: str, value: str) -> str:
    safe = swift_multiline_literal(value.strip())
    if re.search(rf'{field}: """', block):
        return re.sub(
            rf'{field}: """.*?"""',
            f'{field}: """\n{safe}\n"""',
            block,
            count=1,
            flags=re.DOTALL,
        )
    # Single-line string → multiline for rich content
    return re.sub(
        rf'{field}: "((?:[^"\\]|\\.)*)"',
        f'{field}: """\n{safe}\n"""',
        block,
        count=1,
    )


def replace_starter_code_field(block: str, value: str) -> str:
    safe = swift_multiline_literal(value.strip())
    if "games[" in block and "starterCode: games[" in block:
        return block
    if re.search(r"starterCode: SessionScaffolds\.", block):
        return block
    if re.search(r'starterCode: """', block):
        return re.sub(
            r'starterCode: """.*?"""',
            'starterCode: """\n' + safe + '\n"""',
            block,
            count=1,
            flags=re.DOTALL,
        )
    if re.search(r'starterCode: "', block):
        return re.sub(
            r'starterCode: "(?:[^"\\]|\\.)*"',
            'starterCode: """\n' + safe + '\n"""',
            block,
            count=1,
        )
    return block


def replace_string_field(block: str, field: str, value: str | None) -> str:
    if value is None:
        return re.sub(rf"{field}: [^\n]+\n", f"{field}: nil,\n", block, count=1)
    escaped = value.replace("\\", "\\\\").replace('"', '\\"')
    return re.sub(
        rf'{field}: (?:\"\"\".*?\"\"\"|\"(?:[^"\\]|\\.)*\"|nil)',
        f'{field}: "{escaped}"',
        block,
        count=1,
        flags=re.DOTALL,
    )


def apply_enrichment(block: str, lesson_id: str) -> str:
    data = enrichment_for(lesson_id)
    if not data:
        return block

    new_block = block
    if "body" in data:
        new_block = replace_triple_quoted_field(new_block, "body", data["body"].strip())
    if "teacherScript" in data:
        new_block = replace_string_field(new_block, "teacherScript", data["teacherScript"])
    if "tryItPrompt" in data:
        new_block = replace_string_field(new_block, "tryItPrompt", data.get("tryItPrompt"))
    if "practiceSteps" in data:
        steps_swift = emit_practice_steps_swift(data["practiceSteps"])
        if "practiceSteps:" in new_block:
            new_block = re.sub(
                r"practiceSteps: \[.*?\],\n",
                steps_swift + "\n",
                new_block,
                count=1,
                flags=re.DOTALL,
            )
        elif "tryItPrompt:" in new_block:
            new_block = re.sub(
                r"(tryItPrompt: [^\n]+\n)",
                r"\1" + steps_swift + "\n",
                new_block,
                count=1,
            )
        else:
            new_block = re.sub(
                r'(teacherScript: "(?:[^"\\]|\\.)*"),\n',
                r"\1,\n" + steps_swift + "\n",
                new_block,
                count=1,
            )
    if "starterCode" in data:
        new_block = replace_starter_code_field(new_block, data["starterCode"])
    if "codeTests" in data:
        tests_swift = emit_code_tests_swift(lesson_id, data["codeTests"])
        if "codeTests:" in new_block:
            new_block = re.sub(
                r"codeTests: \[.*?\],\n",
                tests_swift + "\n",
                new_block,
                count=1,
                flags=re.DOTALL,
            )
        else:
            close = new_block.rfind("\n            ),")
            if close != -1:
                new_block = new_block[:close] + ",\n" + tests_swift + new_block[close:]
    return new_block


def patch_lesson_block(block: str, lesson_id: str) -> str:
    title = parse_field(block, "title") or lesson_id
    try_it = parse_field(block, "tryItPrompt")
    starter_raw = parse_field(block, "starterCode") or ""
    challenge_answer = parse_field(block, "challengeAnswer")

    new_block = block

    if "practiceSteps:" not in new_block:
        steps = default_practice_steps(title, try_it, starter_raw)
        steps_swift = emit_practice_steps_swift(steps)
        if "tryItPrompt:" in new_block:
            new_block = re.sub(
                r"(tryItPrompt: [^\n]+)\n",
                r"\1\n" + steps_swift + "\n",
                new_block,
                count=1,
            )
        else:
            new_block = re.sub(
                r'(teacherScript: "[^"]*"),\n',
                r"\1,\n" + steps_swift + "\n",
                new_block,
                count=1,
            )

    if starter_raw and not starter_raw.startswith("games[") and lesson_id not in SKIP_SCAFFOLD:
        scaffolded = scaffold_starter(starter_raw, lesson_id)
        if scaffolded != starter_raw:
            new_block = re.sub(
                r'starterCode: """.*?"""',
                'starterCode: """\n' + scaffolded + '\n"""',
                new_block,
                count=1,
                flags=re.DOTALL,
            )
            starter_raw = scaffolded

    if "codeTests:" not in new_block and lesson_id not in SKIP_CODE_TESTS:
        tests = auto_code_tests(lesson_id, starter_raw, challenge_answer)
        tests_swift = emit_code_tests_swift(lesson_id, tests)
        if tests_swift:
            close = new_block.rfind("\n            ),")
            if close != -1:
                new_block = new_block[:close] + ",\n" + tests_swift + new_block[close:]

    return new_block


def main() -> None:
    text = SEED.read_text()
    patched = 0
    for lesson_id in LESSON_IDS:
        span = extract_lesson_block(text, lesson_id)
        if not span:
            print(f"Warning: {lesson_id} not found")
            continue
        start, end = span
        block = text[start:end]
        new_block = apply_enrichment(patch_lesson_block(block, lesson_id), lesson_id)
        if new_block != block:
            text = text[:start] + new_block + text[end:]
            patched += 1
    SEED.write_text(text)
    print(f"Enriched {patched} lessons in {SEED}")


if __name__ == "__main__":
    main()
