import 'dart:io';
import 'package:wheater/classLocation.dart';
import 'package:wheater/classWheater.dart';

void main() async {
  stdout.write("Inserisci il tuo nome: ");
  String? nome = stdin.readLineSync();
  Location l = Location(
    nome!,
  ); // dato che devo mettere tipo nullable devo emttere il diverso su nome difiacno
  await l.RecuperaCordinate();
  Wheater w = new Wheater(l);
  await w.RecuperaDati();
  print(w.printTempo(w.getwheaterCode));

  print(l.getLongitudine);
}
