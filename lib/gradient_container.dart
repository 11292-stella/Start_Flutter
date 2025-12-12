import 'package:flutter/material.dart';
import 'package:prova_stella/dice_roller.dart';

//var è una variabile che può cambiare tipo di dato in base al valore assegnato
//in questo caso prò rimarrà sempre Alignment, quindi potrebbe essere usato con final
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

//class per creare un widget personalizzato che estende StatelessWidget
//StatelessWidget è un widget che non cambia il suo stato interno dopo essere stato creato
class GradientContainer extends StatelessWidget {
  //costruttore che accetta due colori come parametri
  //super.key passa la chiave al costruttore della superclasse
  //const rende il costruttore una costante, permettendo ottimizzazioni della prestazione, se tutti i parametri sono costanti.
  //si definiscono costanti tutti i widget, parametri e variabili che non cambiano mai
  /*const */
  const GradientContainer(this.colors1, this.colors2, {super.key});

  //definizione delle proprietà della classe
  //final indica che il valore non può essere cambiato dopo l'assegnazione iniziale,
  //a differenza di const che richiede che il valore sia noto a compile-time
  final Color colors1;
  final Color colors2;

  //override indica che si sta sovrascrivendo un metodo della superclasse
  @override
  //metodo build che costruisce il widget, widget build è un metodo obbligatorio per tutti i widget Flutter
  //perchè definisce come il widget appare e si comporta nella UI
  //context fornisce informazioni sul widget tree e l'ambiente in cui il widget è costruito
  Widget build(context) {
    //container crea una scatola che può avere varie proprietà come gradiente, bordi, altri widget al suo interno
    return Container(
      //decoration permette di decorare il container con vari stile, ed è un parametro di Container
      //BoxDecoration è un wdget che definisce lo stile di un box, come colore, bordi, ombre, gradienti
      decoration: BoxDecoration(
        //gradient è un parametro di BoxDecoration che permette di applicare un gradiente di colore al box
        //LinearGradient è un widget che crea un gradiente Lineare tra due o piu colori
        gradient: LinearGradient(
          //colors è un parametro list di LinearGradient che definisce i colori del gradiente
          colors: [colors1, colors2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      //child è un parametro di Container che permette di inserire un widget all'interno del container
      //i child sono i widget figli che vengono visualizzati all'interno del container,
      //loro disposizione e comportamento dipendono dalle proprietò del Container e servono a usare widget all'interno di altri widget
      //Center è un widget che centra il suo child all'interno dello spazio disponibile
      child: Center(child: DiceRoller()),
    );
  }
}
