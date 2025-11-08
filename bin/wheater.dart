import 'dart:io';
import 'package:wheater/classLocation.dart';
import 'package:wheater/classWheater.dart';

void main() async {
  String? lettera;
  do{

  stdout.write("Inserisci il tuo nome: ");
  String? nome = stdin.readLineSync();
  
  if(nome == null || nome.isEmpty){
    print("Il nome non puo essere vuoto");
    continue;
  }

  Location l = Location(
    nome!,
  ); // dato che devo mettere tipo nullable devo emttere il diverso su nome difiacno
  await l.RecuperaCordinate();

  Wheater w = new Wheater(l);
  await w.RecuperaDati();



  print("--------------------------------");
  print("A $nome\n");
  print("Il tempo è : ${w.printTempo(w.getwheaterCode)}\n");  
  print("A una longitudine di : ${l.getLongitudine}\n");
  print("A una latitudine di : ${l.getLatitudine}\n");
  print("Ha una velocita del vento pari a :${w.getVelocitaVento} Km/h\n");
  if(w.getidDay == 1)
    print("E giorno!");
  else 
    print("non e giorno");
  print("Ci troviamo a una temperatura di : ${w.getTemperatura} C°\n");
  print("--------------------------------");
  stdout.write("digita X se vuoi uscire altrimenti digita un'altro carratere: ");
  lettera = stdin.readLineSync();

  }while(lettera?.toUpperCase()!="X");





}
