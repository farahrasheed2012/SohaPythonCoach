# Soha Python Coach

Mac app to teach Soha Python over **10 weeks** — self-paced lessons, **10 Outschool live classes (60 min each)**, 5 games, and a **Final Boss** capstone in week 8.

**v1.1** — saved Playground code per lesson, auto-checks, pygame launcher, progress backup, printables, NSB quiz tie-in.

## Location

```
/Users/farah/Documents/FarahRasheed/SohaPythonCoach/
```

## Requirements

- macOS 14+
- Xcode 15+
- **Python 3** on the Mac (`python3 --version` in Terminal)
- For pygame (Weeks 7–8), Flask (Week 9), Tkinter/Matplotlib (Weeks 6–7):
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
| **Journey** | 10-week map · self-paced + **live lessons** · teacher scripts · stuck flags · week notes |
| **Games** | 5 game projects with starter code + auto-checks |
| **Final Boss** | Sound + 3 coins + timer checklist |
| **Playground** | Write & run Python · auto-save · pygame window · Open in Terminal |
| **Progress** | Dashboard · backup JSON · printables · stuck list |

## 10-week path

**Weeks 1–8:** 3 self-paced lessons + **1 live Outschool lesson** each week  
**Week 9:** Flask web dev · Todo List app  
**Week 10:** Polish & **live presentation**

Self-paced track:
1. Hello Python · variables  
2. input · if/else  
3. while · for loops  
4. functions  
5. Guess the Number · Rock Paper Scissors  
6. Lists · Science Bowl Quiz  
7. Coordinates · pygame intro · Treasure Hunt  
8. **Coin Collector** — Final Boss (sound · 3 coins · timer)

Live Outschool track (60 min each):
1. Foundations · Fizz Buzz · scope  
2. Planning · Pizza Shop  
3. Methods · ternary · keywords  
4. Files · loop review  
5. Tuples · *args · default params  
6. Tkinter · Calendar GUI  
7. NumPy/Matplotlib · graphs  
8. PyGame Zero · Space Explorer  
9. Flask · Todo List  
10. Presentations · graduation  

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
