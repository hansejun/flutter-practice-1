import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        cardColor: const Color(0xFFF4EDDB),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFFE7626C),
          onPrimary: const Color(0xFFF4EDDB),
          secondary: const Color(0xFFE7626C),
          onSecondary: const Color(0xFFF4EDDB),
          error: const Color(0xFFE7626C),
          onError: const Color(0xFFF4EDDB),
          surface: const Color(0xFFE7626C),
          onSurface: const Color(0xFFF4EDDB),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
