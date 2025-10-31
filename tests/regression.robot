*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/resource.resource

Suite Setup         SETUP BROWSER WITH FRAMEWORK    javascript_framework=Vue.js
Suite Teardown      TEARDOWN BROWSER
Test Setup          TEST TODOS ANLEGEN
...                     Einkaufen gehen
...                     Einkaufen gehen!
...                     Einkaufen gehÖn???
...                     Einkaufen | | gehen @home #1 €5.99
...                     Ganz langer Text um zu prüfen wie lang ein Todo sein darf ohne das etwas kaputt geht und ob es eventuell zu Überläufen kommt im UI Bereich


*** Test Cases ***
TID-001: Todo Anlegen
    [Documentation]    A test case that logs 'Hello, World!' to the console.
    [Tags]    regression    tid-001
    Take Screenshot
    [Teardown]    Todos Löschen    status=nicht erledigt    expected_remaining=0

TID-002: Todos erledigen
    [Documentation]    Testet das Anlegen eines neuen Todos mit Sonderzeichen.
    [Tags]    regression    tid-002
    Todos Als Erledigt Markieren    anzahl=alle
    Take Screenshot
    [Teardown]    Todos Löschen    status=erledigt    expected_remaining=0

TID-003: Alle Todos Erledigen und löschen
    [Documentation]    Testet das Anlegen eines neuen Todos mit Sonderzeichen.
    [Tags]    regression    tid-003
    Todos Als Erledigt Markieren    anzahl=alle
    Todos Löschen    status=erledigt    expected_remaining=0
    Take Screenshot

TID-004: Spezifische Anzahl an Todos erledigen und löschen
    [Documentation]    Testet das Anlegen eines neuen Todos mit Sonderzeichen.
    [Tags]    regression    tid-004
    Todos Als Erledigt Markieren    anzahl=3
    Todos Löschen    status=erledigt    expected_remaining=2
    Take Screenshot
    [Teardown]    Todos Löschen    status=nicht erledigt    expected_remaining=0
