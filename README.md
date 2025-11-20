# Vom Klick zum Keyword: Einführung in automatisiertes Testen mit Robot Framework
_Aus manuellen Schritten werden lauffähige Suites._

---

## Motivation
- Durch Glück bei der Stadt ins Testing gerutscht
- Duales Studium Wirtschaftsinformatik, schlechte Vorbereitung aufs Berufsleben
- Wenig Programmierkenntnis, Robot Framework leichter Einstieg in die Entwicklung
- Erste manuelle Tests binnen kurzer Zeit auf die Beine gestellt


---

## Libraries
- **BuiltIn-Library** https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
- **Browser-Library** https://marketsquare.github.io/robotframework-browser/Browser.html

---

## TL;DR
- **Was?** Mini-Demo: Manuelle Testfälle → Robot-Tests (TodoMVC).
- **Für wen?** Einsteiger & Praktiker, die manuelle Tests zügig automatisieren wollen.

---

## Robot Framework – Kurzüberblick
- **Open Source:** Generisches Testautomatisierungs-Framework für **Akkzeptanztests**, **Systemtests**, **E2E-Tests** und vieles mehr.
- **Anwendungsbereiche:** Testautomatisierung und Robotic Process Automation (RPA)
- **Spezifikationsstyle:** Keyword-Driven, Behavior-Driven (Gherkin), Data-Driven  
- **Stärken:** Lesbarkeit, Wiederverwendung, Sehr aktive Community, leichter Einstieg für Nutzer ohne viel Entwicklungserfahrung

---

## Robot Framework Foundation
- **Non-Profit** Organisation zur Förderung von Robot Framework & Ökosystem.  
- **Rolle:** Events, Konferenzen (Robocon), Communitysupport, Freie Nutzung und Weiterentwicklung, Finanzierung des Core-Developments
- **Weitere Infos:** https://robotframework.org/foundation/
  
![foundation-qr-code](/resources/images/qr-code.png)

---

## CLI – Wichtige Commands

- **robot** – Führt Robot-Tests aus und erzeugt `output.xml`, `log.html` und `report.html`.  
  Beispiel: `robot -d results tests/`

- **libdoc** – Generiert Keyword-Dokumentation (HTML/JSON/XML) aus Libraries oder Resource-Files.  
  Beispiel: `python -m robot.libdoc resources/keywords/keywords.resource doku/keyworddoku.html`

---

## Demo-Setup (TodoMVC)
- **Testobjekt:** 
  - TodoMVC: https://todomvc.com/examples/vue/dist/#/

- **Ziel-Testfälle:**  
  - **TC1 – Todo anlegen**  
    ![Jira TC1 – Anlegen](docs/img/tc1_jira.png "TC1 Jira Screenshot")

  - **TC2 – Todo löschen**  
    ![Jira TC2 – Löschen](docs/img/tc2_jira.png "TC2 Jira Screenshot")

---
**Beispiel-Suite (Minimalfassung):**
```robot
*** Settings ***
Library           Browser
Suite Setup         Starte ToDoMVC
Suite Teardown      Close Browser
Test Setup          
...    Todos Anlegen
...    Einkaufen gehen
...    Kochen
...    Sport machen



*** Variables ***
${INPUT_NEW_TODO}               input.new-todo
${TODO_LIST}                    ul.todo-list
${TODO_ITEM}                    ul.todo-list li
${CHECKBOX_TODO}                input.toggle
${TODO_ITEM_ERLEDIGT}           ul.todo-list li:has(input.toggle:checked)
${TODO_ITEM_NICHT_ERLEDIGT}     ul.todo-list li:has(input.toggle:not(:checked))
${BTN_TODO_LÖSCHEN}             .destroy

*** Keywords ***
# --- SETUP & TEARDOWN ----

Starte ToDoMVC
    [Documentation]    Startet den Browser und die Anwendung mit den konfigurierten Einstellungen.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}
    Get Title    ==    ${BASE_TITLE}    message= | FAIL | Titel stimmt nicht überein: ${BASE_URL}

Todo Liste Leeren
    [Documentation]    Löscht alle vorhandenen Todos
    Click    ${BTN_CHECK_ALL}
    Click    ${BTN_CLEAR_COMPLETED}

# --- User-Keywords ---

Todos Anlegen
    [Documentation]    Legt beliebig viele Todos an.
    [Arguments]    @{todo_liste}
    FOR    ${todo}    IN    @{todo_liste}
        Fill Text    ${INPUT_NEW_TODO}    ${todo}
        Press Keys    ${INPUT_NEW_TODO}    Enter
    END

Vorhandene Todos
    [Documentation]    Prüft wie viele Todos noch offen sind
    [Arguments]    ${erwartete_anzahl}
    ${anzahl_todos}    Get Element Count    ${TODO_ITEM}
    Log To Console    Vorhandene Todos: ${anzahl_todos}
    Should Be Equal As Integers
    ...    ${anzahl_todos}
    ...    ${erwartete_anzahl}
    ...    msg=Erwartete Anzahl der Todos stimmt nicht

Todos Als Erledigt Markieren
    [Documentation]    Markiert alle übergebenen Todos als erledigt
    [Arguments]    @{todo_liste}
    FOR    ${todo}    IN    @{todo_liste}
        Check Checkbox    ${TODO_ITEM}:has-text("${todo}") ${CHECKBOX_TODO}
    END

Erledigte Todos
    [Documentation]    Prüft wie viele Todos erledigt sind
    [Arguments]    ${erwartete_anzahl}
    ${erledigte_todos}    Get Element Count    ${CHECKBOX_TODO}:checked
    Should Be Equal As Integers
    ...    ${erledigte_todos}
    ...    ${erwartete_anzahl}
    ...    message= | FAIL | ${erwartete_anzahl} Todos sollten erledigt sein, aber ${erledigte_todos} sind es.

Erledigte Todos Löschen
    [Documentation]    Löscht alle erledigten TodosWHILE
    WHILE    True
        ${count}    Get Element Count    ${TODO_ITEM_ERLEDIGT}
        IF    ${count} == 0    BREAK
        Hover    ${TODO_ITEM_ERLEDIGT}
        Click    ${TODO_ITEM_ERLEDIGT} >> ${BTN_TODO_LÖSCHEN}
    END

*** Test Cases ***
*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/keywords.resource

Suite Setup         Starte ToDoMVC
Suite Teardown      Close Browser
Test Setup          Todos Anlegen    Einkaufen gehen    Kochen    Sport machen
Test Teardown       Todo Liste Leeren


*** Test Cases ***
TID-001: Todo Anlegen
    [Documentation]    Tested die Funktion: Anlegen eines Todos
    [Tags]    regression    tid-001
    Todos Anlegen    Wohnung aufräumen
    Vorhandene Todos    erwartete_anzahl=4
    Take Screenshot

TID-002: Todos auf erledigt setzen
    [Documentation]    Testet Funktion: Erledigen eines Todos
    [Tags]    regression    tid-002
    Take Screenshot
    Vorhandene Todos    erwartete_anzahl=3
    Todos Als Erledigt Markieren    Einkaufen gehen    Kochen
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot

