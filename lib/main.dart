import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/main_screen.dart';
import 'package:movies/screens/movie_details/movie_details.dart';
import 'package:movies/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDdfpibjwrqp6Ew0Wz6kou4npFFx235nEY",
        appId: "1:554537350795:android:d7a7b70316ed7d3ef8868e",
        messagingSenderId: "",
        projectId: "movies-99199"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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