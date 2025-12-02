*** Settings ***
Documentation       Bündelung der Pageobjects für die TodoMVC-Anwendung.


*** Variables ***
${TODOMVC_URL}              https://todomvc.com/examples/react/dist/#/
${INPUT_NEW_TODO}           css=input.new-todo
${TODO_ITEMS}               css=ul.todo-list li
${COMPLETED_TODO_ITEMS}     css=ul.todo-list li.completed
