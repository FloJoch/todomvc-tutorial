*** Settings ***
Documentation       Haupt-Schlüsselwörter für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/config/config.resource
Resource            ${EXECDIR}/resources/pages/pages.resource


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
