*** Settings ***
Documentation       Beispiel-Testsuite für TodoMVC mit Robot Framework Browser
...                 - Neues Todo kann angelegt werden
...                 - Todos können als erledigt markiert werden

Library             Browser
# Keyword-Documentation: https://marketsquare.github.io/robotframework-browser/Browser.html
# Suite Setup    Starte Browser Und Öffne ToDoMVC


*** Variables ***
${INPUT_NEW_TODO}           ${EMPTY}
${TODO_ITEMS}               css=[data-testid="todo-item"]
${COMPLETED_TODO_ITEMS}     css=li.completed[data-testid="todo-item"]


*** Test Cases ***
Neues Todo kann angelegt werden
    [Documentation]    Legt ein neues Todo an und prüft, dass genau ein Todo vorhanden ist.
    Log    Empty

Todo kann als erledigt markiert werden
    [Documentation]    Legt mehrere Todos an, markiert sie als erledigt und prüft die Anzahl der erledigten Todos.
    Log    Empty


*** Keywords ***
# [data-testid=todo-list] li:has-text("${todo}") input.toggle
Starte Browser Und Öffne ToDoMVC
    [Documentation]    Startet den Browser und öffnet die TodoMVC-Anwendung.
    New Browser    chromium    headless=${False}
    New Context
    New Page    https://todomvc.com/examples/react/dist/#/

Neues Todo Anlegen
    [Documentation]    Legt ein neues Todo an.
    [Arguments]    @{todos}

Vorhandene Todos
    [Documentation]    xx
    [Arguments]    ${erwartete_anzahl}

Todo Erledigen
    [Documentation]    xx
    [Arguments]    @{todos}

Erledigte Todos
    [Documentation]    xx
    [Arguments]    ${erwarteten_anzahl}
