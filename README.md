# Soha Python Coach

Mac app to teach Soha Python over **10 weeks** — aligned with the **Science Bowl summer schedule** (Jun 8 – Aug 14, 2026): Pass 1 (weeks 1–4), Pass 2 (weeks 5–8), Pass 3 (weeks 9–10), plus 5 games and Final Boss.

**v1.1** — saved Playground code per lesson, auto-checks, pygame launcher, progress backup, printables, NSB quiz tie-in.

## Location

```
/Users/farah/Documents/FarahRasheed/SohaPythonCoach/
```

## Requirements

- macOS 14+
- Xcode 15+
- **Python 3** on the Mac (`python3 --version` in Terminal)
- For pygame, Flask, Tkinter:
  ```bash
  pip3 install pygame flask matplotlib numpy
  ```

## Run

1. Open `SohaPythonCoach.xcodeproj` in Xcode
2. Destination: **My Mac**
3. Press **Run** (⌘R)

Or after building:

```bash
open ~/Library/Developer/Xcode/DerivedData/SohaPythonCoach-*/Build/Products/Debug/SohaPythonCoach.app
```

## App tabs

| Tab | What it does |
|-----|----------------|
| **Journey** | 10-week map · Pass 1–3 · Outschool live lessons |
| **Games** | 5 game projects with starter code + auto-checks |
| **Final Boss** | Sound + 3 coins + timer checklist |
| **Playground** | Write & run Python · auto-save · pygame window · Open in Terminal |
| **Progress** | Dashboard · backup JSON · printables · stuck list |

## 10-week path (matches Science Bowl)

| Week | Dates | Science Bowl pass | Python focus |
|------|-------|-------------------|--------------|
| 1 | Jun 8–12 | Pass 1 · Foundations | Hello Python · variables · Fizz Buzz |
| 2 | Jun 15–19 | Pass 1 · Building depth | input · if/else · Pizza Shop planning |
| 3 | Jun 22–26 | Pass 1 · Mid-level mastery | while · for loops |
| 4 | Jun 29–Jul 3 | Pass 1 · Round-ready | functions · files |
| 5 | Jul 6–10 | Pass 2 · Foundations | Guess the Number · Rock Paper Scissors |
| 6 | Jul 13–17 | Pass 2 · Building depth | Lists · **Science Bowl Quiz game** |
| 7 | Jul 20–24 | Pass 2 · Mid-level mastery | Coordinates · pygame intro |
| 8 | Jul 27–31 | Pass 2 · Round-ready | **Coin Collector** Final Boss |
| 9 | Aug 3–7 | Pass 3 · Final review 1 | Flask · Todo List web app |
| 10 | Aug 10–14 | Pass 3 · Final review 2 | Graduation · portfolio showcase |

Each week includes self-paced lessons + one **60 min Outschool live lesson** (David Sofield Level 1 track).

## Summer schedule

**Tue & Thu 4:45–5:15 PM** — 30 min Python Coach block (see `SohaAli/Schedule/weekly-timetable.md`).

Calendar detail: `SohaAli/Schedule/summer-2026-calendar.md` · `science-bowl-prep.html`

## Printables

Progress tab → **Open student workbook** or **Open teacher script** (HTML, print with ⌘P).

## After 10 weeks

Soha should be able to write Python independently, build 4–5 games, ship a pygame capstone, and demo a Flask app — ready for **Outschool Level 2+** in the fall if she wants more.

## Notes

- Text Python runs in the in-app Playground.
- **pygame** games: use **Run game window** or **Open in Terminal** in Playground.
- Progress saves locally; export/import JSON from Progress tab.
- Scripts saved to `~/Library/Application Support/SohaPythonCoach/scripts/`
