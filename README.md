Questo progetto è una **mini applicazione da riga di comando (CLI)** sviluppata in **Dart** con lo scopo di **testare le funzionalità del linguaggio**, in particolare:
- la gestione asincrona (`async` / `await`),
- le chiamate HTTP reali,
- la struttura a classi e la modularità del codice.

> **Nota**: questa repository è nata come **progetto sperimentale** per imparare Dart e testarne le sue potenzialità, non come prodotto finale. Tuttavia, il codice è pienamente funzionante e rappresenta un ottimo esempio di utilizzo pratico di API esterne e programmazione orientata agli oggetti in Dart.

---

## Funzionalità principali

- Lettura del nome (o località) inserito dall’utente.
- Recupero automatico delle **coordinate geografiche** (latitudine e longitudine) tramite **API Nominatim** (OpenStreetMap).
- Recupero dei **dati meteorologici correnti** tramite **API Open-Meteo**.
- Visualizzazione di:
  - Temperatura corrente
  - Velocità del vento
  - Stato del cielo (con interpretazione del codice meteo)
  - Indicazione giorno/notte
  - Coordinate geografiche della località

---

## Struttura del progetto

```text
wheater/
├── lib/
│   ├── classLocation.dart   # Gestione delle coordinate e chiamata a Nominatim
│   └── classWheater.dart    # Gestione dei dati meteo e chiamata a Open-Meteo
├── bin/
│   └── main.dart            # Logica principale (interazione utente)
├── pubspec.yaml             # Gestione dipendenze (http)

```
---

## Comandi principali
```text
# Creazione di un nuovo progetto Dart
dart create wheater

# Installazione delle dipendenze HTTP
dart pub add http

# Esecuzione del programma
dart run
```
---
## API usate

Open Meteo : https://api.open-meteo.com/v1/forecast?latitude=<LAT>&longitude=<LON>&current_weather=true 
Nomatim : https://nominatim.openstreetmap.org/search?q=<NOME_LOCALITA>&format=json&limit=1

Entrambe mi generavano un JSON
---
## Esempio di Output

```text
Inserisci il tuo nome: Verona
--------------------------------
A Verona

Il tempo è : Parzialmente nuvoloso
Ha una velocità del vento pari a : 6.2 Km/h
È giorno!
Ci troviamo a una temperatura di : 14.3 °C
A una longitudine di : 10.9916
A una latitudine di : 45.4384
--------------------------------
Digita X se vuoi uscire altrimenti digita un altro carattere:
```



