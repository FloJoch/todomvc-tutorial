# Vom Klick zum Keyword: Einführung in automatisiertes Testen mit Robot Framework
_Aus manuellen Schritten werden lauffähige Suites._

---

## Key Facts zu Robot Framework
- Generisches, Open-Source Automatisierungsframework für RPA und Testautomatisierung
- Robot Framework Foundation
  - Non-Profit Organisation hinter RF
  - Bewerben Verwendung, kümmern sich um die Weiterentwicklung, sichern das RF Open Source bleibt
  - Unterstützt Community
  - Events wie die Robocon

**Weitere Infos:** https://robotframework.org/foundation/ 


## Was zeichnet Robotframework aus?
- **Lesbarkeit**
  - Tests sehen aus wie Checklisten
  - Fachbereiche können oft direkt mitlesen, was der Test macht

- **Keyword-Driven Ansatz**
  - Keywords ≈ Bausteine / Methoden
  - Eigene User-Keywords aus Low-Level Library-Keywords zusammensetzen

- **Flexibilität durch Libraries**
  - Heute Fokus: Browser-Tests mit **Browser Library**
  - Über Adaptionslayer aber auch:
    - Datenbanken,
    - APIs,
    - uvm.

- **Starke Community**
  - Viele Beispiele, Hilfe, Ideen
  - Macht Spaß, Teil davon zu sein

---

## Ziel der Session
- Workflow vom manuellen Test zur automatisierten Suite
- Live-Demo in den Start eines Robot Framework Projekts
  - Browser Library
  - Keyword Driven
  - Datadriver-Library
    - Weniger Duplikation
    - Mehr Wiederverwendung
    - Datengetriebene Tests


---

## Demo-Setup TodoMVC
- **Testobjekt:** 
  - TodoMVC: https://todomvc.com/examples/react/dist/#/

---

## Live-Demo
- Ordner
- .robot-Suites
- Sections (Settings, Keywords, Variables, usw.)
- Erster manueller Testfall anschauen
    1. TodoMVC öffnen
    2. Todos Anlegen
    3. Vorhandene Todos
    4. Erledigte Todos
    5. Screenshot
- Übersetzung RF
- Zweiter manueller Testfall anschauen
    1. TodoMVC öffnen
    2. Neue Todos anlegen
    3. Vorhandene Todos
    4. Erledigte Todos
    5. Todo als erledigt markieren
    6. Vorhandene Todos
    7. Erledigte Todos
    8. Take Screenshot
- Fertige Suite zeigen
- Übergabe Murad Datadriver
