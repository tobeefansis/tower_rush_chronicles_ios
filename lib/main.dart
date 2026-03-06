import 'package:flutter/material.dart';

import 'app_config.dart';
import 'webview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6A0DAD), // насыщенный фиолетовый
        scaffoldBackgroundColor: const Color(
          0xFF1A0F2E,
        ), // почти черно-фиолетовый
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 126, 7, 237), // светлый фиолетовый
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppConfig.webGLLoadingTextColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFFF0E6FF),
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFE8DAFF)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFDAC9F7)),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      home: WebviewScreen(),
    );
  }
}
