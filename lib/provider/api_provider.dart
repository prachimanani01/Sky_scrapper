import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/model/model.dart';

import '../api/api_services.dart';

class ApiProvider extends ChangeNotifier {
  Apihelper apihelper = Apihelper();

  WeatherModal? weatherModal;
  String search = 'surat';

  void searchImage(String img) {
    search = img;
    notifyListeners();
  }

  Future<WeatherModal?> frommap(String img) async {
    Map data = await apihelper.fatch(img);
    print("$data--------------------------------------------------------------------------------------------------------------------------------------------------\n\n");
    print("=========================================================\n"+ "$data");
    weatherModal = WeatherModal.fromJson(data);
     print(weatherModal!.locationModal.name);
    return weatherModal;
  }

  ApiProvider()
  {
    frommap("surat");
  }

  int selectedPage=0;
  void changePage(int value){
    selectedPage = value;
    notifyListeners();
  }

  List<String> weather = [];
  Future<void> addToFavourite(String name, String temp,String icon)
  async {
    String data = "$name-$temp-$icon";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.add(data);
    sharedPreferences.setStringList('weather', weather);

  }

  Future<void> getFavouriteWeather()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather = sharedPreferences.getStringList('weather') ?? <String>[];
    // print(weather);
    notifyListeners();
  }
}
