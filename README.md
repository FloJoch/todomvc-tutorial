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
  - Respekt/Angst wegen kaum Programmier-Erfahrung
- Erkenntnis
  - Einstieg ist einfacher als gedacht
  - erste Automatisierte Tests waren schnell geschrieben
  - Schnelle Lösung != gute Lösung 

---

## Key Facts zu Robot Framework
- Generisches, Open-Source Automatisierungsframework für RPA und Testautomatisierung
- Robot Framework Foundation
  - Non-Profit Organisation hinter RF
  - Bewerben Verwendung, kümmern sich um die Weiterentwicklung, sichern das RF Open Source bleibt
  - Unterstützt Community
  - Events wie die Robocon

**Weitere Infos:** https://robotframework.org/foundation/ 

![foundation-qr-code](/resources/images/qr-code.png)

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
    - APIs

- **Starke Community**
  - Viele Beispiele, Hilfe, Ideen
  - Macht Spaß, Teil davon zu sein

---

## Ziel der Session
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

## Demo-Setup TodoMVC
- **Testobjekt:** 
  - TodoMVC: https://todomvc.com/examples/vue/dist/#/

- **Testfälle**  
  - TC1 – Todo's anlegen

    ![Jira TC1 – Anlegen](docs/img/tc1_jira.png "TC1 Jira Screenshot")

  - TC2 – Todo's als erledigt markieren löschen

    ![Jira TC2 – Löschen](docs/img/tc2_jira.png "TC2 Jira Screenshot")
