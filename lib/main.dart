import 'package:flutter/material.dart';

import 'gradient_container.dart';

//punto di ingresso principale dell'applicazione Flutter
//void main() è la funzione principale che viene eseguita all'avvio dell'app
//main è un widget obbligatorio in ogni app Flutter
void main() {
  //runApp è un widget che avvia l'app Flutter e prende come argomento il widget radice dell'app
  runApp(
    //MaterialApp è un widget che fornisce le funzionalità di base per un'app Flutter bastata su Material Designen
    //Material Design è un linguaggio di design sviluppato da Google per creare interfaccie utente coerenti e attraenti
    MaterialApp(
      //home è un parametro di MaterialApp che definisce il widget principale visualizzato quando l'app viene avviata
      //Scaffold è un widget che fornisce una struttura di base per creare una schermata nell'app, come barra dell'app,
      //corpo, ecc si usa sempre con MaterialApp è obbligatorio definirlo altrimenti l'app non viene visualizzata correttamente
      home: Scaffold(
        //body è un parametro di Scaffold che definisce il contenuto principale della schermata
        //in questo caso viene usato il widget GradientContainer definito in gradient_container.dart
        body: GradientContainer(Colors.purple, Colors.deepPurpleAccent),
      ),
    ),
  );
}
