# Soha Python Coach

Mac app to teach Soha Python over **10 summer calendar weeks** (Jun 8 – Aug 14) — aligned with Science Bowl Pass 1–3. Each calendar week bundles **5 self-paced app sessions** (50 total): Level 1 → Level 2 → Level 3 → Level 4 → Portfolio, plus 5 games and Final Boss.

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
| **Journey** | 10 calendar weeks · 50 app sessions · Pass 1–3 · 5 games |
| **Games** | 5 game projects with starter code + auto-checks |
| **Final Boss** | Sound + 3 coins + timer checklist |
| **Playground** | Write & run Python · auto-save · pygame window · Open in Terminal |
| **Progress** | Dashboard · backup JSON · printables · stuck list |

## 10 calendar weeks (50 app sessions)

Each row is one **Science Bowl week**. Open it to see **5 Python track weeks** inside (short lessons + project sessions).

| Cal week | Dates | Pass | Python label (same in calendar) |
|----------|-------|------|----------------------------------|
| 1 | Jun 8–12 | Pass 1 | **L1 (1–5)** |
| 2 | Jun 15–19 | Pass 1 | **L1 (6–10)** |
| 3 | Jun 22–26 | Pass 1 | **L2 (1–5)** |
| 4 | Jun 29–Jul 3 | Pass 1 | **L2 (6–10)** |
| 5 | Jul 6–10 | Pass 2 | **L3 (1–5)** |
| 6 | Jul 13–17 | Pass 2 | **L3 (6–10)** |
| 7 | Jul 20–24 | Pass 2 | **L4 (1–5)** |
| 8 | Jul 27–31 | Pass 2 | **L4 (6–10)** |
| 9 | Aug 3–7 | Pass 3 | **Portfolio (1–5)** |
| 10 | Aug 10–14 | Pass 3 | **Portfolio (6–10)** |

## Summer schedule

**Tue & Thu 4:45–5:15 PM** — 30 min Python Coach block (see `SohaAli/Schedule/weekly-timetable.md`).

Calendar detail: `SohaAli/Schedule/summer-2026-calendar.md` · `science-bowl-prep.html`

## Printables

Progress tab → **Open student workbook** or **Open teacher script** (HTML, print with ⌘P).

## After 10 calendar weeks

Soha completes **all 50 app sessions** (Levels 1–4 + portfolio), 5 games, Final Boss, and Flask — ready for AI/ML Level 1 or deeper projects.

## Notes

- Text Python runs in the in-app Playground.
- **pygame** games: use **Run game window** or **Open in Terminal** in Playground.
- Progress saves locally; export/import JSON from Progress tab.
- Scripts saved to `~/Library/Application Support/SohaPythonCoach/scripts/`
