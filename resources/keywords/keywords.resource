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

Todos Löschen
    [Documentation]    Löscht Todos je nach Status: alle | erledigt.
    [Arguments]    ${status}=erledigt

    ${selector}    Set Variable If
    ...    '${status}'=='erledigt'    ${TODO_ITEM_ERLEDIGT}
    ...    '${status}'=='alle'    ${TODO_ITEM}

    WHILE    True
        ${count}    Get Element Count    ${selector}
        IF    ${count} == 0    BREAK
        Hover    ${selector} >> nth=0
        Click    ${selector} >> nth=0 >> ${BTN_TODO_LÖSCHEN}
    END
    ${remaining}    Get Element Count    ${TODO_ITEM}
    Log To Console    Verbleibende Todos (gesamt): ${remaining}
