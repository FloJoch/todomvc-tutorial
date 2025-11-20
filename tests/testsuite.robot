*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/keywords.resource

Suite Setup         Starte ToDoMVC
Suite Teardown      Close Browser
Test Setup          Todos Anlegen    Einkaufen gehen    Kochen    Sport machen


*** Test Cases ***
TID-001: Todo Anlegen
    [Documentation]    Test.Cas
    [Tags]    regression    tid-001
    Todos Anlegen    Wohnung aufräumen
    Vorhandene Todos    erwartete_anzahl=4
    Take Screenshot
    # [Teardown]    Todos Löschen    status=nicht erledigt    expected_remaining=0

TID-002: Todos auf erledigt setzen
    [Documentation]    Testet das Anlegen eines neuen Todos mit Sonderzeichen.
    [Tags]    regression    tid-002
    Take Screenshot
    Vorhandene Todos    erwartete_anzahl=3
    Todos Als Erledigt Markieren    Einkaufen gehen    Kochen
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot
    # [Teardown]    Todos Löschen    status=erledigt    expected_remaining=0

TID-003: Erledigte Todos löschen
    [Documentation]    Testet das Anlegen eines neuen Todos mit Sonderzeichen.
    [Tags]    regression    tid-003
    Todos Als Erledigt Markieren    Sport machen
    Erledigte Todos    erwartete_anzahl=1
    Todos Löschen    status=erledigt
    Erledigte Todos    erwartete_anzahl=0
    Vorhandene Todos
    s
    Take Screenshot

