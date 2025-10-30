*** Settings ***
Documentation       Variablen und Konfigurationen für das Projekt

Library             Browser


*** Variables ***
${BASE_URL}             https://todomvc.com/
${BASE_TITLE}           TodoMVC
${DEFAULT_TIMEOUT}      5s
${BROWSER}              chromium
${HEADLESS}             false
