*** Settings ***
Documentation       regressionstests für die TodoMVC-Anwendung.

Resource            ${EXECDIR}/resources/keywords/resource.resource

Suite Setup         SETUP BROWSER
Suite Teardown      TEARDOWN BROWSER
Test Setup          Wähle Javascript Beispiel    Vue.js


*** Test Cases ***
TID-001: Todo Anlegen
    [Documentation]    A test case that logs 'Hello, World!' to the console.
    [Tags]    regression    tid-001
    Neues Todo Anlegen    todo_text=Einkaufen gehen
    Neues Todo Anlegen    todo_text=Einkaufen gehen!
    Neues Todo Anlegen    todo_text=Einkaufen gehÖn
    Neues Todo Anlegen
    ...    todo_text=Ganz langer Text um zu prüfen wie lang ein Todo sein darf ohne das etwas kaputt geht und ob es eventuell zu Überläufen kommt im UI Bereich
    Take Screenshot
