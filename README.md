# Soha Python Coach

Mac app to teach Soha Python over **8 weeks** — from `print("Hello")` to a **Final Boss** game with **sound, 3 coins, and a timer**.

**v1.1** — saved Playground code per lesson, auto-checks, pygame launcher, progress backup, printables, NSB quiz tie-in.

## Location

```
/Users/farah/Documents/FarahRasheed/SohaPythonCoach/
```

## Requirements

- macOS 14+
- Xcode 15+
- **Python 3** on the Mac (`python3 --version` in Terminal)
- For pygame games (Weeks 7–8): `pip3 install pygame`

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
| **Journey** | 8-week map · 24 lessons · teacher scripts · stuck flags · week notes |
| **Games** | 5 game projects with starter code + auto-checks |
| **Final Boss** | Sound + 3 coins + timer checklist |
| **Playground** | Write & run Python · auto-save · pygame window · Open in Terminal |
| **Progress** | Dashboard · backup JSON · printables · stuck list |

## 8-week path

1. Hello Python · variables  
2. input · if/else  
3. while · for loops  
4. functions  
5. Guess the Number · Rock Paper Scissors  
6. Lists · Science Bowl Quiz  
7. Coordinates · pygame intro · Treasure Hunt  
8. **Coin Collector** — final challenge  

## Summer schedule (optional)

**Tue & Thu 4:45–5:15 PM** — 30 min Python Coach block (see `SohaAli/Schedule/weekly-timetable.md`).

## Printables

Progress tab → **Open student workbook** or **Open teacher script** (HTML, print with ⌘P).

## After 8 weeks

Soha should be able to write Python independently, build 4–5 games, and be ready for **Scratch → AI → app dev** (like Science Bowl Coach).

## Notes

- Text Python runs in the in-app Playground.
- **pygame** games: use **Run game window** or **Open in Terminal** in Playground.
- Progress saves locally; export/import JSON from Progress tab.
- Scripts saved to `~/Library/Application Support/SohaPythonCoach/scripts/`
