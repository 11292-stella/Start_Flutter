import 'package:flutter/material.dart';
import 'dart:math';

//class per creare un widget personalizzato che estende StatefulWidget
//StatefulWidget è un widget che può essere modificato dopo essere stato creato,
//per creare un widget Stateful, sono necessarie due classi: una per il widget stesso e una per lo stato associato
class DiceRoller extends StatefulWidget {
  //anche se non ci sono parametri è buona pratica definire il costruttore
  const DiceRoller({super.key});

  //override per sovrascrivere il metodo createState della superclasse
  @override
  //State<DiceRoller> è un widget di tipo generico che rappresenta lo stato associato al widget DiceRoller
  //createState è un metodo obbligatorio per tutti i widget Stateful che crea l'istanza dello stato
  //senza questo metodo il widget non capirebbe quale stato associare al widget, in questo caso _DiceRollerState
  State<DiceRoller> createState() {
    //_DiceRollerState è la classe che definisce lo stato del widget DiceRoller
    //si usa il prefisso _ per indicare che la classe è privata e non può essere usata al di fuori di questo file
    //questa classe contiene le variabili e i metodi per gestire lo stato del widget,
    //non può essere usata al di fuori di questo file perchè è privato,
    //ed è necessario tenerlo privato per evitare conflitti con altre classi simili in altri file mantendendo l'incapsulamento
    //ritorna una nuova istanza di _DiceRollerState
    return _DiceRollerState();
  }
}

//classe privata che definisce lo stato del widget DiceRoller
//estende State<DiceRoller> per associare lo stato al widget Diceroller
//questa seconda classe è obbligatoria per tutti i widget Stateful perchè per gestire lo stato del widget,
//deve diventare una funzione da richiamare ogni volta che lo stato cambia,
//quindi se lo stato cambia, il metodo build viene richiamato di nuovo per aggiornare l'interfaccia utente
class _DiceRollerState extends State<DiceRoller> {
  //var è una variabile che può cambiare tipo di dato in base al valore asegnato
  //ora che abbiamo aggiunto una variabile, const non può essere usato nella classe perchè la classe non è più completamente costante
  //var activeDiceimage = 'assets/images/dice-2.png';

  var diceNumber = 2;

  //metodo per gestire l'evento di pressione del bottone
  void rollDice() {
    //Random è una classe importata da dart:math che genera numeri casuali
    //nextInt(6) genera un numero intero casuale tra 0 e 5, quindi si aggiunge 1 per ottenere un numero tra 1 e 6
    //per ottenere il numero preciso va sempre aumentato di 1 perchè parte da 0
    diceNumber = Random().nextInt(6) + 1;

    //setState è un metodo obbligatorio per tutti i widget StateFul
    //serve per notificare al framework che lo stato del widget è cambiato
    //quando si chiama setState, il metodo build viene richiamato di nuovo per aggiornare l'interfaccia utente
    setState(() {
      //activeDiceimage cambia il valore della variabile per cambiare l'immagine visualizzata
      //uso della interpolazione di stringa per aggiornare il percorso dell'immagine in base al numero casuale generato
      //per usare le immagini dinamicamente, abbiamo aggiunto $diceRoll all'interno della stringa, sostituendo il numero fisso dell'immagine
      //la sintassi $ è usata per inserire il valore di una variabile all'interno di una stringa.
      //activeDiceimage = 'assets/images/dice-$diceRoll.png';
    });

    print('Changing image...');
  }

  @override
  Widget build(contex) {
    //colum permette di disporre i widget uno sotto l'altro, in verticale, occupando solo lo spazio necessario, ed è un widget di Layout
    //Column è un widget che organizza i suoi child in una disposizione verticale
    return Column(
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
        Image.asset(
          'assets/images/dice-$diceNumber.png',

          //uso della variabile per cambiare l'immagine visualizzata in base allo stato
          //activeDiceimage,
          width: 200,
        ),
        //2. modo di aggiungere uno spazio, crea un box vuoto che occupa spazio al suo interno
        //SizedBox è un widget che crea una scatola con dimensioni specifiche,
        //quindi un child al suo interno non prenderà lo spazio necessario ma quello definito
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
    );
  }
}
