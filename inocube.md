---
author: inocube
paging: Slide %d / %d
---

# Was ist der InoCube ?

* IoT Projekt
* Unterstützung für Sales

---

# Demo

... in the browser

~~~
+---------+     +-----+     +-----------------+     +-----------+
| InoCube | --> | App | --> | Websocket Proxy | --> | Dashboard |
+---------+     +-----+     +-----------------+     +-----------+
~~~

---

# Warum die App ?

* keine SIM im Cube (instabiles Netz)
* Kunden-Wifi vom Handy oder mobile Daten
* simple UI via Smartphone (kein Cube Display)

---

# Architektur

* 'simpler' Datenproxy -> keine Verarbeitung der Daten
* Single View
* Expo (Cross Platform)
* Bluetooth Support
* SSO Login Support
* MQTT Connection __(klingt so einfach)__

---

# Pitfalls

* IoT Hub Connection (MQTT)
* Expo Standalone build (Bluetooth)
* Testing nicht im Emulator möglich
* IOS App Store publish

---

# Ausblick

* Redesign __(in Progress)__
* Publish im __echten__ App Store
* Bi-Directionale Kommunikation
* Auth Token Refresh
* Open Source

---

# Last Words

* Expo => nice
* Local Development => nice
* Feedback zum Code erwünscht (GitLab)
* IDE deiner Wahl

