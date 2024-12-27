import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/weatherPage.dart';
import 'package:weatherapp/weather_provider.dart';

void main() {
   runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  WeatherScreen(),
    );
  }
}
