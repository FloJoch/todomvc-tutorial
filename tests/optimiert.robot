*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/keywords.resource

Suite Setup         Starte Browser Und Öffne ToDoMVC
Suite Teardown      Close Browser
Test Setup          Todo Anlegen
...                     Einkaufen gehen
...                     Kochen
...                     Sport machen
# Test Teardown    Lösche Alle Todos


*** Test Cases ***
Neues Todo kann angelegt werden
    [Documentation]    Legt ein neues Todo an und prüft, dass genau ein Todo vorhanden ist.
    Todo Anlegen    Wohnung aufräumen
    Vorhandene Todos    erwartete_anzahl=4
    Take Screenshot

Todo kann als erledigt markiert werden
    [Documentation]    Legt mehrere Todos an, markiert sie als erledigt und prüft die Anzahl der erledigten Todos.
    Todo Anlegen
    ...    Wohnung aufräumen
    ...    Gartenarbeit
    Vorhandene Todos    erwartete_anzahl=5
    Todo Als Erledigt Markieren
    ...    Wohnung aufräumen
    ...    Gartenarbeit
    Vorhandene Todos    erwartete_anzahl=5
    Erledigte Todos    erwartete_anzahl=2
    Take Screenshot
