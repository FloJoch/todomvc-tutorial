*** Settings ***
Documentation       Regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/keywords.resource

Suite Setup         Starte Browser Und Öffne ToDoMVC
Suite Teardown      Close Browser
Test Setup          Todo Anlegen
...                     Einkaufen gehen
...                     Kochen
...                     Sport machen
Test Teardown       Alle Todos Löschen


*** Test Cases ***
Neues Todo kann angelegt werden
    [Documentation]    Legt ein neues Todo an und prüft, dass genau ein Todo vorhanden ist.
    Vorhandene Todos    erwartete_anzahl=3
    Take Screenshot

Todo kann als erledigt markiert werden
    [Documentation]    Legt mehrere Todos an, markiert sie als erledigt und prüft die Anzahl der erledigten Todos.
    Todo Als Erledigt Markieren
    ...    Einkaufen gehen
    ...    Kochen
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot
