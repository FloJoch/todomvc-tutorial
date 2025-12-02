*** Settings ***
Documentation       Beispiel-Testsuite für TodoMVC mit Robot Framework Browser
...                 - Neues Todo kann angelegt werden
...                 - Todos können als erledigt markiert werden

Library             Browser    # Keyword-Documentation: https://marketsquare.github.io/robotframework-browser/Browser.html

Suite Teardown      Browser Schließen
Test Setup          Starte Browser Und Öffne ToDoMVC


*** Variables ***
${TODOMVC_URL}              https://todomvc.com/examples/react/dist/#/

${INPUT_NEW_TODO}           css=#todo-input
${TODO_ITEMS}               css=[data-testid="todo-item"]
${COMPLETED_TODO_ITEMS}     css=li.completed[data-testid="todo-item"]


*** Test Cases ***
Neues Todo kann angelegt werden
    [Documentation]    Legt ein neues Todo an und prüft, dass genau ein Todo vorhanden ist.
    Todo Anlegen
    ...    Wohnung aufräumen
    ...    Gartenarbeit
    ...    Auto waschen
    ...    Bücher lesen
    Vorhandene Todos    erwartete_anzahl=4
    Erledigte Todos    erwartete_anzahl=0
    Take Screenshot

Todo kann als erledigt markiert werden
    [Documentation]    Legt mehrere Todos an, markiert sie als erledigt und prüft die Anzahl der erledigten Todos.
    Todo Anlegen
    ...    Wohnung aufräumen
    ...    Gartenarbeit
    ...    Auto waschen
    ...    Bücher lesen
    Vorhandene Todos    erwartete_anzahl=4
    Erledigte Todos    erwartete_anzahl=0
    Todo Als Erledigt Markieren
    ...    Wohnung aufräumen
    ...    Gartenarbeit
    Vorhandene Todos    erwartete_anzahl=4
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot


*** Keywords ***
Starte Browser Und Öffne ToDoMVC
    [Documentation]    XX
    New Browser    chromium    headless=${False}
    New Context
    New Page    ${TODOMVC_URL}

Browser Schließen
    [Documentation]    Schließt den Browser.
    Close Browser

Todo Anlegen
    [Documentation]    Legt ein oder mehrere Todos an.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Fill Text    ${INPUT_NEW_TODO}    ${todo}
        Press Keys    ${INPUT_NEW_TODO}    Enter
    END

Vorhandene Todos
    [Documentation]    Überprüft die Anzahl der vorhandenen Todos.
    [Arguments]    ${erwartete_anzahl}
    ${anzahl}    Get Element Count    ${TODO_ITEMS}
    Should Be Equal As Integers    ${anzahl}    ${erwartete_anzahl}
    ...    msg=Erwartet waren ${erwartete_anzahl} Todos, gefunden wurden ${anzahl}.

Erledigte Todos
    [Documentation]    Überprüft die Anzahl der erledigten Todos.
    [Arguments]    ${erwartete_anzahl}
    ${anzahl}    Get Element Count    ${COMPLETED_TODO_ITEMS}
    Should Be Equal As Integers    ${anzahl}    ${erwartete_anzahl}
    ...    msg=Erwartet waren ${erwartete_anzahl} erledigte Todos, gefunden wurden ${anzahl}.

Todo Als Erledigt Markieren
    [Documentation]    Markiert alle übergebenen Todos anhand ihres Namens als erledigt.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Click    css=ul.todo-list li:has-text("${todo}") input.toggle
    END
