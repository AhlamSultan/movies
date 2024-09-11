import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager/api_manager.dart';
import 'package:movies/screens/main_screen.dart';
import 'package:movies/screens/movie_details/movie_details.dart';
import 'package:movies/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiManager.getPopular();
    return MaterialApp(
      routes :{
        Splash.routeName : (_) => const Splash(),
        MainScreen.routeName : (_) => const MainScreen(),
        MovieDetails.routeName : (_) => const MovieDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}