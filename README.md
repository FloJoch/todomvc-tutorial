# Vom Klick zum Keyword: Einführung in automatisiertes Testen mit Robot Framework
_Aus manuellen Schritten werden lauffähige Suites._


---

## Libraries
- **BuiltIn-Library** https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
- **Browser-Library** https://marketsquare.github.io/robotframework-browser/Browser.html

---

## TL;DR
- **Was?** Mini-Demo: Manuelle Testfälle → Robot-Tests (TodoMVC).
- **Für wen?** Einsteiger & Praktiker, die manuelle Tests zügig automatisieren wollen.

---

## Inhalt
- [Robot Framework – Kurzüberblick](#robot-framework--kurzüberblick)
- [Robot Framework Foundation – Kurzüberblick](#robot-framework-foundation--kurzüberblick)
- [Demo-Setup (TodoMVC)](#demo-setup-todomvc)
- [Manuelle Testfälle (Jira-Darstellung)](#manuelle-testfälle-jira-darstellung)
- [Vom manuellen Test zu Robot-Schritten](#vom-manuellen-test-zu-robot-schritten)
- [Selektor-Strategie & Stabilität](#selektor-strategie--stabilität)
- [Projektstruktur](#projektstruktur)
- [Ausführen](#ausführen)
- [Erweiterungen: Suite Hooks, Tags, Reports](#erweiterungen-suite-hooks-tags-reports)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Links & Ressourcen](#links--ressourcen)
- [License](#license)

---

## Robot Framework – Kurzüberblick
- **Open Source**: Testautomatisierungs-Framework unter anderem **Akkzeptanztests**, **Systemtests** und **E2E-Tests**.
- **Anwendungsbereiche**: Testautomatisierung und Robotic Process Automation  
- **Spezifikationsstyle** Keyword-Driven, Behavior-Driven (Gherkin), Data-Driven  
- **Stärken:** Lesbarkeit, Wiederverwendung, Sehr aktive Community, leichter Einstieg für Nutzer ohne viel Entwicklungserfahrung

---

## Robot Framework Foundation – Kurzüberblick
- **Non-Profit** Organisation zur Förderung von Robot Framework & Ökosystem.  
- **Rolle:** Events, Konferenzen (Robocon), Communitysupport, Freie Nutzung und Weiterentwicklung, Finanzierung des Core-Developments
- **URL:** https://robotframework.org/foundation/
- ![foundation-qr-code](resources\config\images\qr-code.png)


---

## Demo-Setup (TodoMVC)
- **Testobjekt:** 
  - TodoMVC: https://todomvc.com/examples/vue/dist/#/
  
- **Ziel-Testfälle:**  
  1. **TID-1: Anlegen** eines Todos  
  2. **TID-2: Erledigen** eines Todos  
  3. **TID-3: Löschen** eines Todos 


---

## Manuelle Testfälle (Jira-Darstellung)
> **Platzhalter für drei Bilder** (Jira-Screenshots eurer manuellen Testfälle).  
> Lege die Dateien z. B. nach `docs/img/`.

- **TC1 – Todo anlegen**  
  ![Jira TC1 – Anlegen](docs/img/tc1_jira.png "TC1 Jira Screenshot")

- **TC2 – Todo löschen**  
  ![Jira TC2 – Löschen](docs/img/tc2_jira.png "TC2 Jira Screenshot")

- **TC3 – Als erledigt markieren**  
  ![Jira TC3 – Erledigt](docs/img/tc3_jira.png "TC3 Jira Screenshot")

> Optional viertes Bild (Filtern): `docs/img/tc4_jira.png`

---

## Vom manuellen Test zu Robot-Schritten
| Manuell (Given/When/Then) | Robot-Schritt (Keyword) |
| --- | --- |
| **Given**: App ist geöffnet | `New Browser` → `New Context` → `New Page    ${BASE_URL}` |
| **When**: „Kaffee kaufen“ eingeben + Enter | `Fill Text    ${INPUT}    Kaffee kaufen` / `Press Keys    ${INPUT}    Enter` |
| **Then**: 1 neuer Eintrag sichtbar | `Get Count    ${LIST_ITEMS}    ==    1` |

**Beispiel-Suite (Minimalfassung):**
```robot
*** Settings ***
Library           Browser
Suite Setup       Open App
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}          https://todomvc.com/examples/vanillajs/
${INPUT}             css=input.new-todo
${LIST_ITEMS}        css=.todo-list li
${TOGGLE}            css=.toggle
${DESTROY_BTN}       css=button.destroy
${FILTER_ACTIVE}     text=Active
${FILTER_COMPLETED}  text=Completed
${FILTER_ALL}        text=All

*** Keywords ***
Open App
    New Browser    headless=${TRUE}
    New Context
    New Page    ${BASE_URL}

*** Test Cases ***
TC1 Todo anlegen
    Fill Text    ${INPUT}    Kaffee kaufen
    Press Keys   ${INPUT}    Enter
    Get Count    ${LIST_ITEMS}    ==    1

TC2 Todo löschen
    Fill Text    ${INPUT}    Milch kaufen
    Press Keys   ${INPUT}    Enter
    Hover        ${LIST_ITEMS} >> nth=0
    Click        ${DESTROY_BTN}
    # Erwartung: kein "Milch kaufen" mehr in der Liste
    Get Count    ${LIST_ITEMS}    ==    1

TC3 Todo als erledigt markieren
    Fill Text    ${INPUT}    Brot kaufen
    Press Keys   ${INPUT}    Enter
    Click        ${LIST_ITEMS} >> nth=0 >> ${TOGGLE}
    Locator Should Have Attribute    ${LIST_ITEMS} >> nth=0    class    .*completed.*

TC4 Filtern Active/Completed
    Fill Text    ${INPUT}    Offen
    Press Keys   ${INPUT}    Enter
    Fill Text    ${INPUT}    Erledigt
    Press Keys   ${INPUT}    Enter
    Click        ${LIST_ITEMS} >> nth=1 >> ${TOGGLE}
    Click        ${FILTER_ACTIVE}
    Get Count    ${LIST_ITEMS}    ==    1
    Click        ${FILTER_COMPLETED}
    Get Count    ${LIST_ITEMS}    ==    1
    Click        ${FILTER_ALL}
    Get Count    ${LIST_ITEMS}    ==    2
