*** Settings ***
Documentation       Haupt-Schlüsselwörter für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/config/config.resource
Resource            ${EXECDIR}/resources/pages/pages.resource


*** Keywords ***
# --- SETUP & TEARDOWN ---
Starte Browser Und Öffne ToDoMVC
    [Documentation]    XX
    New Browser    chromium    headless=false
    New Context
    New Page    ${TODOMVC_URL}

Browser Schließen
    [Documentation]    Schließt den Browser.
    Close Browser

### --- USER KEYWORDS ---

Todo Anlegen
    [Documentation]    Legt ein oder mehrere Todos an.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Fill Text    selector=${INPUT_NEW_TODO}    txt=${todo}
        Press Keys    ${INPUT_NEW_TODO}    Enter
    END

Vorhandene Todos
    [Documentation]    Überprüft die Anzahl der vorhandenen Todos.
    [Arguments]    ${erwartete_anzahl}
    ${anzahl}    Get Element Count    ${TODO_ITEMS}
    Should Be Equal As Integers    ${anzahl}    ${erwartete_anzahl}
    ...    msg=Erwartet waren ${erwartete_anzahl} erledigte Todos, gefunden wurden ${anzahl}.

Erledigte Todos
    [Documentation]    Überprüft die Anzahl der erledigten Todos.
    [Arguments]    ${erwartete_anzahl}
    ${anzahl}    Get Element Count    ${COMPLETED_TODO_ITEMS}
    Should Be Equal As Integers    ${anzahl}    ${erwartete_anzahl}
    ...    msg=Erwartet waren ${erwartete_anzahl} erledigte Todos, gefunden wurden ${anzahl}.

Todo Als Erledigt Markieren
    [Documentation]    Markiert ein oder mehrere Todos als erledigt.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Click    css=ul.todo-list li:has-text("${todo}") label
    END
