
import 'dart:io';
import 'package:wheater/classLocation.dart';

void main() async{
  Location l = new Location("Roma");
  await l.RecuperaCordinate();
  print(l.getLatitudine);
  print(l.getLongitudine);
}