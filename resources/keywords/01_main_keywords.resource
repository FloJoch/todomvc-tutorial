*** Settings ***
Documentation       Haupt-Schlüsselwörter für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/config/config.resource
Resource            ${EXECDIR}/resources/pages/pages.resource


*** Keywords ***
Wähle Javascript Beispiel
    [Documentation]    Navigiert zum gewählten Javascript Beispiel auf der Startseite.
    [Arguments]    ${framework}
    Click    ${JAVASCRIPT_EXAMPLES}[${framework}]
    Wait For Elements State    ${INPUT_NEW_TODO}    visible    timeout=5s

Neues Todo Anlegen
    [Documentation]    Legt ein neues Todo-Element an.
    [Arguments]    ${todo_text}
    Fill Text    ${INPUT_NEW_TODO}    ${todo_text}
    Press Keys    ${INPUT_NEW_TODO}    Enter

Todos Als Erledigt Markieren
    [Documentation]    Markiert alle angelegten Todos als erledigt.
    [Arguments]    ${anzahl}=alle

    ${boxes}    Get Elements    ${CHECKBOX_TODO}
    ${total}    Get Length    ${boxes}

    IF    '${anzahl}' == 'alle'
        VAR    ${anzahl}    ${total}
    ELSE
        ${anzahl}    Convert To Integer    ${anzahl}
    END

    # --- Abhaken ---
    FOR    ${index}    IN RANGE    ${anzahl}
        Click    ${boxes}[${index}]
    END

    # --- Validierung ---
    ${checked}    Get Element Count    ${CHECKBOX_TODO}:checked
    Should Be Equal As Integers
    ...    ${checked}
    ...    ${anzahl}
    ...    message= | FAIL | ${anzahl} Todos sollten erledigt sein, aber ${checked} sind es.

Todos Löschen
    [Documentation]    Löscht alle angelegten Todos, Argumente für erledigt ja oder nein
    [Arguments]    ${status}=erledigt    ${expected_remaining}=$
    IF    '${status}' == 'erledigt'
        WHILE    ${True}
            ${count}    Get Element Count    ${TODO_ITEM_ERLEDIGT}
            IF    ${count} == 0    BREAK
            Hover    ${TODO_ITEM_ERLEDIGT} >> nth=0
            Click    ${TODO_ITEM_ERLEDIGT} >> nth=0 >> ${BTN_TODO_LÖSCHEN}
        END
    ELSE
        WHILE    ${True}
            ${count}    Get Element Count    ${TODO_ITEM}
            IF    ${count} == 0    BREAK
            Hover    ${TODO_ITEM} >> nth=0
            Click    ${TODO_ITEM} >> nth=0 >> ${BTN_TODO_LÖSCHEN}
        END
    END
    # --- Validierung ---
    ${remaining}    Get Element Count    ${TODO_ITEM}
    Log To Console    Noch übrig: ${remaining}
    Should Be Equal As Integers    ${remaining}    ${expected_remaining}    msg=Erwartete Rest-Todos stimmen nicht
