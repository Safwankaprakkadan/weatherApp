import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  String _cityName = '';
  String? _weatherCondition;
  double? _temperature;
  int? _humidity;
  bool _isLoading = false;
  String? _errorMessage;

  String get cityName => _cityName;
  String? get weatherCondition => _weatherCondition;
  double? get temperature => _temperature;
  int? get humidity => _humidity;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final String _apiKey = '86666cddd625e7cdd81533161bba41e2';

  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) {
      _errorMessage = 'Please enter a city name.';
      notifyListeners();
      return;
    }

    _cityName = city;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$_apiKey&units=metric'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _weatherCondition = data['weather'][0]['description'];
        _temperature = data['main']['temp'];
        _humidity = data['main']['humidity'];
      } else {
        _errorMessage = 'City not found. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'Failed to fetch weather. Please check your connection.';
    }

    _isLoading = false;
    notifyListeners();
  }
}
