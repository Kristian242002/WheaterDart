import 'dart:convert';
import 'package:http/http.dart' as http;

class Location {
  // Attributi
  late double latitudine;
  late double longitudine;
  late String paese;

  // Costruttore
  Location(this.paese);

  //Metodi
  Future<void> RecuperaCordinate() async {
    // Metodo che terminera in futuro utile per db,lettura da file etc..
    //(Chiamate HTTP in questo caso)
    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/search?q=$paese&format=json&limit=1",
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
          latitudine = double.parse(data[0]['lat']);
          longitudine = double.parse(data[0]['lon']);
        } else {
          print("$paese Non trovato riprovare");
        }
      } else {
        print("Errore di tipo ${response.statusCode}");
      }
    } catch (e) {
      print("Errore di tipo $e");
    }
  }

  //Get
  String get getPaese => paese;
  double get getLongitudine => longitudine;
  double get getLatitudine => latitudine;
  //Set
  set setPaese(String value) => paese = value;
  set setLongitudine(double value) => longitudine = value;
  set setLatitudine(double value) => latitudine = value;
}
