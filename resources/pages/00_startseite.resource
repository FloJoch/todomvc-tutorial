*** Settings ***
Documentation       Pageobject für die Startseite der TodoMVC-Anwendung.


*** Variables ***
# --- NAVIGATION ELEMENTS ---
${BTN_DOWNLOAD}             text=Download
${BTN_VIEWGITHUB}           text=View on GitHub
${BTN_BLOG}                 text=Blog

# --- Examples ---
&{JAVASCRIPT_EXAMPLES}
...                         Vue.js=a.applist-item span.link:has-text("Vue.js")
