import 'package:flutter/material.dart';

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
  const GradientContainer(this.colors1, this.colors2, {super.key});

  //definizione delle proprietà della classe
  //final indica che il valore non può essere cambiato dopo l'assegnazione iniziale,
  //a differenza di const che richiede che il valore sia noto a compile-time
  final Color colors1;
  final Color colors2;

  //metodo per gestire l'evento di pressione del bottone
  void rollDice() {}
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
      child: Center(
        //colum permette di disporre i widget uno sotto l'altro, in verticale, occupando solo lo spazio necessario, ed è un widget di Layout
        //Column è un widget che organizza i suoi child in una disposizione verticale
        child: Column(
          //impostazione per far occupare alla colum solo lo spazio necessario
          //se non viene impostato, la colum occupa tutto lo spazio disponibile
          //mainAxisSize indica l'asse principale della colum, che è verticale
          //MainaxisSize.mine indica di occupare solo lo spazio necessario ed è un enum (predefinito)
          mainAxisSize: MainAxisSize.min,
          //children sono i widget figli della column, a differenza dei child che sono singoli widget la children è una lista di widget
          children: [
            //inserimento dell'immagine della risorsa assets
            //Image è un widget che visualizza immagini
            //asset è un costruttore di Image che carica un'immagine dalle risorse del progetto
            //width è un parametro di Image che imposta la larghezza dell'immagine
            Image.asset('assets/images/dice-5.png', width: 200),
            //2. modo di aggiungere uno spazio, crea un box vuoto che occupa spazio al suo interno
            //SizedBox(height: 20,),
            //TextButton è un widget che crea un bottone di testo
            TextButton(
              //onPressed è un parametro di TextButton che definisce la funzione da seguire quando il bottone viene premuto,
              //è obbligatorio definirlo o altrimenti il bottone risulta disabilitato, si può assegnare una funzione vuota o null per disabilitarlo
              onPressed: rollDice,
              //style è un parametro di TextButto che permette di personalizzare lo stile del bottone
              //TextButton.styleFrom è un widget che permette di creare uno stile personalizzato per il TextButton
              //styleFrom è un costruttore di TextButton che accetta vari parametri per personalizzare lo stile del bottone
              style: TextButton.styleFrom(
                //1. modo per aggiungere padding
                //EdgeInserts è in widget che definisce lo spazio interno intorno al child di un widget
                //only è un costruttore di EdgeInsert che permette di specificare lo spazio solo per i lati destiderati
                padding: const EdgeInsets.only(top: 20),
                //foregroundColor è un parametro di styleFrom che imposta il colore del testo e delle icone del bottone
                foregroundColor: Colors.deepOrangeAccent,
                //textStyle è un parametro di styleFrom che permette di personalizzare lo stile del testo del bottone
                //TextStyle è un widget che definisce lo stile del testo come dimensione, colore, font, ecc
                //si usa const perche il testo non cambia mai
                textStyle: const TextStyle(fontSize: 28),
              ),
              //child è un parametro di textButton che permette di inserire un widget all'interno del bottone
              //Text è un widget che visualizza una stringa di testo
              child: const Text('Roll Dice!'),
            ),
          ],
        ),
      ),
    );
  }
}
