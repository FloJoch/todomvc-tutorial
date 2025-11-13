*** Settings ***
Documentation       Bündelung der Pageobjects für die TodoMVC-Anwendung.


*** Variables ***
${INPUT_NEW_TODO}               input.new-todo

# --- Angelegte Aufgaben ---
# Selektoren überarbeiten
${TODO_LIST}                    ul.todo-list
${TODO_ITEM}                    ul.todo-list li
${CHECKBOX_TODO}                input.toggle

${TODO_ITEM_ERLEDIGT}           ul.todo-list li:has(input.toggle:checked)
${TODO_ITEM_NICHT_ERLEDIGT}     ul.todo-list li:has(input.toggle:not(:checked))

${BTN_TODO_LÖSCHEN}             .destroy


