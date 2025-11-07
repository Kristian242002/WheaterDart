import 'dart:convert';

import 'package:wheater/classLocation.dart';
import 'package:http/http.dart' as http;

class Wheater {
  //Attributi :
  late double temperatura;
  late double velocitaVento;
  late int isDay;
  late Location localita;
  late int wheaterCode;


  //Costruttore
  Wheater(this.localita);

  Future<void> RecuperaDati() async {
    final url = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=${localita.getLatitudine}&longitude=${localita.getLongitudine}&current_weather=true",
    );

    try {
      // Uso dell'User Agent
      final response = await http.get(
        url,
        headers: {"User-Agent": "AppWheater:kristina@test.com"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final listacorrente = data["current_weather"];
          temperatura = listacorrente["temperature"];
          velocitaVento = listacorrente["windspeed"];
          isDay = listacorrente["is_day"];
          wheaterCode = listacorrente["weathercode"];
        } else {
          print("ho grabbato qualcosa di vuoto!");
        }
      }
    } catch (e) {
      print("Errore di tipo: $e");
    }
  }

  String printTempo(int numero) {
    String stringa = "Non Trovato";
    Map<int, String> mappaContenitrice = {
      0: "Cielo sereno",
      1: "Prevalentemente sereno",
      2: "Parzialmente nuvoloso",
      3: "Coperto",
      45: "Nebbia",
      48: "Nebbia con brina (nebbia ghiacciata)",
      51: "Pioggerella leggera",
      53: "Pioggerella moderata",
      55: "Pioggerella intensa",
      56: "Pioggia gelata leggera",
      57: "Pioggia gelata intensa",
      61: "Pioggia leggera",
      63: "Pioggia moderata",
      65: "Pioggia intensa",
      66: "Pioggia gelata leggera",
      67: "Pioggia gelata forte",
      71: "Neve leggera",
      73: "Neve moderata",
      75: "Neve intensa",
      77: "Granuli di ghiaccio",
      80: "Rovesci leggeri",
      81: "Rovesci moderati",
      82: "Rovesci forti",
      85: "Rovesci di neve leggeri",
      86: "Rovesci di neve forti",
      95: "Temporale",
      96: "Temporale con grandine leggera",
      99: "Temporale con grandine forte",
    };

    mappaContenitrice.forEach((key, value) {
      if (key == numero) {
        stringa = value;
      }
    });

    return stringa;
  }

  //Metodi get
  double get getTemperatura => temperatura;
  double get getVelocitaVento => velocitaVento;
  int get getidDay => isDay;
  int get getwheaterCode => wheaterCode;
}
