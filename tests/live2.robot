*** Settings ***
Documentation       Beispiel-Testsuite für TodoMVC mit Robot Framework Browser
...                 - Neues Todo kann angelegt werden
...                 - Todos können als erledigt markiert werden
...
...                 Testobjekt: https://todomvc.com/examples/react/dist/
...
...                 Keyword-Documentation:
...                 - Browser: https://marketsquare.github.io/robotframework-browser/Browser.html
...                 - BuiltIn: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

Library             Browser
# Suite Setup    Starte Browser Und Öffne ToDoMVC


*** Variables ***
${INPUT_NEW_TODO}           css=#todo-input
${TODO_ITEMS}               css=[data-testid="todo-item"]
${COMPLETED_TODO_ITEMS}     css=li.completed[data-testid="todo-item"]


*** Test Cases ***
Neues Todo kann angelegt werden
    [Documentation]    Prüft die Funktionalität zum Anlegen eines neuen Todos.
    Starte Browser Und Öffne ToDoMVC

Todo kann als erledigt markiert werden
    [Documentation]    Prüft die Funktionalität ein Todo als erledigt zu markieren.
    Starte Browser Und Öffne ToDoMVC


*** Keywords ***
Starte Browser Und Öffne ToDoMVC
    [Documentation]    Startet den Browser und öffnet die TodoMVC-Anwendung.
    New Browser    chromium    headless=${False}
    New Context
    New Page    https://todomvc.com/examples/react/dist/#/

Neues Todo Anlegen
    [Documentation]    Legt ein neues Todo an.
    [Arguments]    @{todos}
    Log    tbd

Vorhandene Todos
    [Documentation]    xx
    [Arguments]    ${erwartete_anzahl}
    Log    tbd

Todo Erledigen
    [Documentation]    [data-testid=todo-list] li:has-text("${todo}") input.toggle
    [Arguments]    @{todos}
    Log    tbd

Erledigte Todos
    [Documentation]    xx
    [Arguments]    ${erwarteten_anzahl}
    Log    tbd
