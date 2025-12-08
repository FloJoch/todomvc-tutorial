*** Settings ***
Documentation       Haupt-Schlüsselwörter für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/config/config.resource
Resource            ${EXECDIR}/resources/pages/pages.resource


*** Keywords ***
Starte Browser Und Öffne ToDoMVC
    [Documentation]    Startet den Browser und öffnet die TodoMVC-Anwendung.
    New Browser    chromium    headless=${False}
    New Context
    New Page    ${TODOMVC_URL}

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

Todo Als Erledigt Markieren
    [Documentation]    Markiert alle übergebenen Todos anhand ihres Namens als erledigt.
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Click    css=ul.todo-list li:has-text("${todo}") input.toggle
    END

Erledigte Todos
    [Documentation]    Überprüft die Anzahl der erledigten Todos.
    [Arguments]    ${erwartete_anzahl}
    ${anzahl}    Get Element Count    ${COMPLETED_TODO_ITEMS}
    Should Be Equal As Integers    ${anzahl}    ${erwartete_anzahl}
    ...    msg=Erwartet waren ${erwartete_anzahl} erledigte Todos, gefunden wurden ${anzahl}.
