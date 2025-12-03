# Vom Klick zum Keyword: Einführung in automatisiertes Testen mit Robot Framework
_Aus manuellen Schritten werden lauffähige Suites._

---
# Motivation
## Kurzvorstellung 
- Testanalyst bei der Landeshauptstadt München
- Duales Studium Wirtschaftsinformatik, schlechte Vorbereitung aufs Berufsleben
- Studium
  - Programmieren eher oberflächlich => Ohne eine Zeile Code durchs Studium
  - Testen nur als kleiner Teil im SDLC, wenig Tiefe
- Ergebnis nach dem Studium
  - Kaum Vorstellung von professionellem Testen
  - Praktisch keine Erfahrung mit Testautomatisierung
- Wenig Programmierkenntnis, Robot Framework leichter Einstieg in die Entwicklung

## Einstieg ins Testen
- Durch Zufall Einstieg in Projekt als Tester gerutscht
- Durch erfahrene Kollegen ans Thema Testing herangeführt wurden
- Erste Schritte:
  - manuelle Tests in Jira
  - Klassisch: Schritt für Schritt, erwartetes Ergebnis, etc
- Irgendwann: „Klicke hier, prüfe da, blablabla…“ → wird schnell langweilig und nicht tragbar
  - => Automatisierung

## Erster Kontakt mit Robot Framework
- Hinführung durch erfahrene Kollegen
  - RF lauffähig einrichten
  - Kleine Demo & generelle Einführung
- Erste Reaktion
  - Respekt/Angst wegen kaum technischer Erfahrung
- Erkenntnis
  - Einstieg ist einfacher als gedacht
  - erste Automatisierte Tests waren schnell geschrieben
  - Schnelle Lösung != gute Lösung 

---

# Ziel der Session
- Workflow vom manuellen Test zur automatisierten Suite
- Live-Demo in den Start eines Robot Framework Projekts
  - Wo lohnt sich ein eigenes Keyword?
  - Wie kann ich Tests robust gegen Änderungen halten?
- Fragen? Bitte jederzeit, nicht erst am Ende
- Danach
  - Murad zeigt wie er die Suite für die Datadriver-Library umbaut
    - Weniger Duplikation
    - Mehr Wiederverwendung
    - Datengetriebene Tests

---

## Key Facts zu Robot Framework
- Generisches, Open-Source Automatisierungsframework für RPA und Testautomatisierung
- Robot Framework Foundation
  - Non-Profit Organisation hinter RF
  - Bewerben Verwendung, kümmern sich um die Weiterentwicklung, sichern das RF Open Source bleibt
  - Unterstützt Community
  - Events wie die Robocon

## Robot Framework USP

---

## Libraries
- **BuiltIn-Library** https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
- **Browser-Library** https://marketsquare.github.io/robotframework-browser/Browser.html

---

## TL;DR
- **Was?** Mini-Demo: Manuelle Testfälle → Robot-Tests (TodoMVC).
- **Für wen?** Einsteiger & Praktiker, die manuelle Tests zügig automatisieren wollen.

---

## Robot Framework – Kurzüberblick
- **Open Source:** Generisches Testautomatisierungs-Framework für **Akkzeptanztests**, **Systemtests**, **E2E-Tests** und vieles mehr.
- **Anwendungsbereiche:** Testautomatisierung und Robotic Process Automation (RPA)
- **Spezifikationsstyle:** Keyword-Driven, Behavior-Driven (Gherkin), Data-Driven  
- **Stärken:** Lesbarkeit, Wiederverwendung, Sehr aktive Community, leichter Einstieg für Nutzer ohne viel Entwicklungserfahrung

---

## Robot Framework Foundation
- **Non-Profit** Organisation zur Förderung von Robot Framework & Ökosystem.  
- **Rolle:** Events, Konferenzen (Robocon), Communitysupport, Freie Nutzung und Weiterentwicklung, Finanzierung des Core-Developments
- **Weitere Infos:** https://robotframework.org/foundation/
  
![foundation-qr-code](/resources/images/qr-code.png)

---

## CLI – Wichtige Commands

- **robot** – Führt Robot-Tests aus und erzeugt `output.xml`, `log.html` und `report.html`.  
  Beispiel: `robot -d results tests/`

- **libdoc** – Generiert Keyword-Dokumentation (HTML/JSON/XML) aus Libraries oder Resource-Files.  
  Beispiel: `python -m robot.libdoc resources/keywords/keywords.resource doku/keyworddoku.html`

---

## Demo-Setup (TodoMVC)
- **Testobjekt:** 
  - TodoMVC: https://todomvc.com/examples/vue/dist/#/

- **Ziel-Testfälle:**  
  - **TC1 – Todo anlegen**  
    ![Jira TC1 – Anlegen](docs/img/tc1_jira.png "TC1 Jira Screenshot")

  - **TC2 – Todo löschen**  
    ![Jira TC2 – Löschen](docs/img/tc2_jira.png "TC2 Jira Screenshot")
