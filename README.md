# Gestione Ordini - Progetto Salesforce

## Descrizione
Questo progetto è una semplice applicazione Salesforce per la gestione degli ordini.

Permette di:
- gestire clienti e prodotti
- creare ordini
- aggiungere prodotti a un ordine tramite righe ordine
- calcolare automaticamente subtotale e totale ordine
- aggiornare automaticamente la disponibilità dei prodotti

Il progetto è stato realizzato come esercizio pratico per mostrare competenze base da Junior Salesforce Developer.

---

## Struttura del progetto

Sono stati creati i seguenti oggetti custom:

- **Cliente__c** → contiene i clienti
- **Prodotto__c** → contiene i prodotti con prezzo e quantità disponibile
- **Ordine__c** → rappresenta un ordine effettuato da un cliente
- **RigaOrdine__c** → contiene i prodotti inseriti nell’ordine

Ogni ordine può avere più righe, ognuna con un prodotto e una quantità.

---

## Funzionamento principale

Quando si crea una riga ordine:

1. Il sistema recupera automaticamente il prezzo del prodotto.
2. Viene calcolato il subtotale (prezzo × quantità).
3. Il totale dell’ordine viene aggiornato automaticamente.
4. La disponibilità del prodotto viene diminuita in base alla quantità ordinata.

Queste operazioni sono gestite tramite:
- Trigger Apex
- Service Class Apex
- formule e campi di riepilogo (Roll-Up Summary)

---

## Competenze utilizzate

Nel progetto sono state utilizzate:

- creazione oggetti e campi custom
- relazioni tra oggetti
- formule Salesforce
- Roll-Up Summary
- Trigger Apex
- Service Class Apex
- query SOQL
- operazioni DML
- uso di Set e Map per gestire più record insieme

---

## Possibili miglioramenti futuri

- gestione stato ordine (nuovo, completato, annullato)
- controlli su disponibilità prodotti
- interfaccia utente migliorata
- notifiche automatiche

---

## Obiettivo del progetto

Questo progetto serve come esempio di applicazione semplice ma completa per mostrare le mie competenze di base nello sviluppo Salesforce durante colloqui tecnici.
