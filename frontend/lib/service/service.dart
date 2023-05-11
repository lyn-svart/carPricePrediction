import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'http://10.0.2.2:5000/pred';

pred(String brand, String model, String mileage, String transmission,
    String fuelType, String mpg, String engineSize) async {
  var veri = {
    'brand': brand,
    'model': model,
    'mileage': mileage,
    'transmission': transmission,
    'fuelType': fuelType,
    'mpg': mpg,
    'engineSize': engineSize
  };
  var response = await http.post(Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'}, body: json.encode(veri));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<String> getPred() async {
  var url = Uri.parse(baseUrl);
  var response = await http.get(url);
  var map = jsonDecode(response.body);
  double deger = map["pred"];
  String deger2 = deger.toInt().toString();
  if (response.statusCode == 200) {
    return deger2;
  } else {
    throw Exception('Failed to load data');
  }
}
