import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherPage  extends StatefulWidget {

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My Weather App!'
        ),
      ),
    );
  }

  Widget weatherBox(Weather _weather) {
    return Column(
      children: <Widget>[
        Text(
          '${_weather.temperature}°C'
        ),
        Text(
          '${_weather.description}'
        ),
        Text(
          'Feels:${_weather.feelsLike}°C'
        ),
        Text(
          'H:${_weather.high}°C L:${_weather.low}°C'
        ),
      ],
    );
  }

  Future getCurrentWeather() async {
    Weather weather;
    String city = "minsk";
    String apiKey = "fa9d791964704e17c3d2943c20e2533a";
    var url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    } else {
      // ???
    }

    return weather;
  }
}