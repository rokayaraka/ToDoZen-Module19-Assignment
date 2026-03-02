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
          backgroundColor: Colors.green.shade200,
          titleTextStyle: TextStyle(
            fontSize: 35,
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
        ),
        cardTheme: CardThemeData(color: Colors.green.shade500),
        
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
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
