*** Settings ***
Documentation       Bündelung der Pageobjects für die TodoMVC-Anwendung.


*** Variables ***
${INPUT_NEW_TODO}               input.new-todo
${CHECKBOX_TODO}                input.toggle

${TODO_LIST}                    ul.todo-list
${TODO_ITEM}                    ul.todo-list li
${TODO_ITEM_ERLEDIGT}           ul.todo-list li:has(input.toggle:checked)

${BUTTON_CHECK_ALL}             \#toggle-all-input
${BUTTON_TODO_LÖSCHEN}          .destroy
${BUTTON_CLEAR_COMPLETED}       button.clear-completed
