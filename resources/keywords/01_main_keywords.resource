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
