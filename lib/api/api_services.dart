import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Future<Map> fatch(String search) async {
    String api = 'https://api.weatherapi.com/v1/forecast.json?key=4ac1cc92a6ad49bba8595541243007&q=$search';
    Uri url = Uri.parse(api);
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        final json = response.body;
        Map data = jsonDecode(json);
        print("------------------------\n" + "$data");
        return data;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return {};
      }
  }
}

