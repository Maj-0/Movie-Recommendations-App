import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled8/src/screens/HomeScreen.dart';
import 'package:untitled8/src/screens/onboarding_screen.dart';

import 'src/providers/watch_list_provider.dart';
import 'src/screens/auth_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchListProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Whisper',
      home: OnboardingScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/auth_screen': (context) => AuthScreen(),
      },
    );
  }
}
