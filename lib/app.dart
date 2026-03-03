import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todos/Screens/splashScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.purple.shade200,
          titleTextStyle: TextStyle(
            fontSize: 35,
            color: Colors.purple.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple.shade200,
          foregroundColor: Colors.black,
        ),
        cardTheme: CardThemeData(color: Colors.white70),
        
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
           bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
   

          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
