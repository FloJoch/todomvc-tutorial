*** Settings ***
Documentation       Beispiel-Testsuite für TodoMVC mit Robot Framework Browser
...
...                 Testobjekt: https://todomvc.com/examples/react/dist/
...
...                 Keyword-Documentation:
...                 - Browser: https://marketsquare.github.io/robotframework-browser/Browser.html
...                 - BuiltIn: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
...

Library             Browser


*** Variables ***
${INPUT_NEW_TODO}           css=#todo-input
${TODO_ITEMS}               css=[data-testid="todo-item"]
${COMPLETED_TODO_ITEMS}     css=li.completed[data-testid="todo-item"]


*** Test Cases ***
TC1: Neues Todo kann angelegt werden
    [Documentation]    Prüft die Funktionalität zum Anlegen eines neuen Todos.
    Starte Browser Und Öffne ToDoMVC
    # ---
    # Neues Todo anlegen
    # ---
    # Prüfe Anzahl Angelegter Todos
    # ---
    Take Screenshot

TC2: Todo kann als erledigt markiert werden
    [Documentation]    Prüft die Funktionalität ein Todo als erledigt zu markieren.
    Starte Browser Und Öffne ToDoMVC
    # Neues Todo Anlegen
    # ---
    # Todo Als Erledigt Markieren
    # ---
    # Prüfe Anzahl Erledigter Todos
    # ---
    Take Screenshot


*** Keywords ***
Starte Browser Und Öffne ToDoMVC
    [Documentation]    Startet den Browser und öffnet die TodoMVC-Anwendung.
    New Browser    chromium    headless=${False}
    New Context
    New Page    https://todomvc.com/examples/react/dist/#/

Neues Todo Anlegen
    [Documentation]    Legt ein neues Todo an.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Fill Text    ${INPUT_NEW_TODO}    ${todo}
        Press Keys    ${INPUT_NEW_TODO}    Enter
    END

Prüfe Anzahl Angelegter Todo
    [Documentation]    xx
    [Arguments]    ${erwartete_anzahl}
    Log    TBA

Todo Als Erledigt Markieren
    [Documentation]    xx
    [Arguments]    @{todos}
    Log    TBA

Prüfe Anzahl Erledigter Todos
    [Documentation]    xx
    [Arguments]    ${erwarteten_anzahl}
    Log    TBA
