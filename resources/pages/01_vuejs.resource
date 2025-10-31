*** Settings ***
Documentation       Pageobject für die Vue.js Seite der TodoMVC-Anwendung.


*** Variables ***
${INPUT_NEW_TODO}               input.new-todo

# --- Angelegte Aufgaben ---
${TODO_LIST}                    ul.todo-list
${TODO_ITEM}                    ${TODO_LIST} li
${TODO_ITEM_ERLEDIGT}           ${TODO_LIST} li:has(input.toggle:checked)
${TODO_ITEM_NICHT_ERLEDIGT}     ${TODO_LIST} li:has(input.toggle:not(:checked))
${BTN_TODO_LÖSCHEN}             .destroy
${CHECKBOX_TODO}                ${TODO_LIST} input.toggle
