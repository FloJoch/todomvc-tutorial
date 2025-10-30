*** Settings ***
Documentation       Schlüsselwörter-Bündelung für die TodoMVC-Anwendung.

Resource            01_main_keywords.resource


*** Keywords ***
SETUP BROWSER
    [Documentation]    Startet den Browser mit den konfigurierten Einstellungen.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}
    Get Title    ==    ${BASE_TITLE}    message= | FAIL | Titel stimmt nicht überein: ${BASE_URL}

TEARDOWN BROWSER
    [Documentation]    Schliesst alle Browser-Instanzen.
    Close Browser
