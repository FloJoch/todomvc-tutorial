*** Settings ***
Documentation       Variablen und Konfigurationen für das Projekt

Library             Browser


*** Variables ***
${BASE_URL}             https://todomvc.com/examples/vue/dist/#/
${BASE_TITLE}           TodoMVC: Vue
${DEFAULT_TIMEOUT}      5s
${BROWSER}              chromium
${HEADLESS}             false