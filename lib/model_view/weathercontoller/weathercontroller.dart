import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:screl_machine_task/model/weathermodel/weathermodel.dart';

class WeatherController extends ChangeNotifier {
  var baseurl = "http://api.openweathermap.org/data/2.5/weather";
  String apikey = "7b610c0d99c05e9cd797d5c841758134";

  List<Weathermodel> decodedweather = [];

  Future getweather(String city) async {
    try {
      final response = await http
          .get(Uri.parse("$baseurl?q=$city&appid=$apikey&units=metric"));
      if (response.statusCode == 200) {
        var decodeddata = jsonDecode(response.body);
        print(decodeddata);
        if (decodeddata is List) {
          decodedweather = decodeddata
              .map<Weathermodel>((json) => Weathermodel.fromJson(json))
              .toList();
        } else {
          decodedweather = [Weathermodel.fromJson(decodeddata)];
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }


  //  getting current location
  getlocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
}