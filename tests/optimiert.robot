*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/keywords.resource

Suite Setup         Starte ToDoMVC
Suite Teardown      Close Browser
Test Setup          Todos Anlegen
...                     Einkaufen gehen
...                     Kochen
...                     Sport machen
Test Teardown       Todo Liste Leeren


*** Test Cases ***
TID-001: Todo Anlegen
    [Documentation]    Tested die Funktion: Anlegen eines Todos
    [Tags]    regression    tid-001
    Todos Anlegen    Wohnung aufräumen
    Vorhandene Todos    erwartete_anzahl=4
    Take Screenshot

TID-002: Todos auf erledigt setzen
    [Documentation]    Testet Funktion: Erledigen eines Todos
    [Tags]    regression    tid-002
    Vorhandene Todos    erwartete_anzahl=3
    Todos Als Erledigt Markieren    Einkaufen gehen    Kochen
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot
