*** Settings ***
Documentation       Schlüsselwörter-Bündelung für die TodoMVC-Anwendung.

Resource            01_main_keywords.resource


*** Keywords ***
# --- SUITE ----
SETUP BROWSER WITH FRAMEWORK
    [Documentation]    Startet den Browser mit den konfigurierten Einstellungen.
    [Arguments]    ${javascript_framework}=Vue.js
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}
    Get Title    ==    ${BASE_TITLE}    message= | FAIL | Titel stimmt nicht überein: ${BASE_URL}
    Wähle Javascript Beispiel    ${javascript_framework}

TEARDOWN BROWSER
    [Documentation]    Schliesst alle Browser-Instanzen.
    Close Browser

# --- TEST ---

TEST TODOS ANLEGEN
    [Documentation]    Legt beliebig viele Todos an.
    [Arguments]    @{todo_liste}
    FOR    ${todo}    IN    @{todo_liste}
        Neues Todo Anlegen    ${todo}
    END
