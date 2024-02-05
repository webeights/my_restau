import 'package:flutter/material.dart';
import 'package:my_restau/screens/home_screen.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/screens/register_screen.dart';
import 'package:my_restau/screens/register_success.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Restaurant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFABAB),
        ),
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        iconButtonTheme: IconButtonThemeData(
          style: const ButtonStyle().copyWith(
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ),
      initialRoute: 'homeScreen',
      routes: {
        'loginScreen': (context) => const LogInScreen(),
        'registerScreen': (context) => const RegisterScreen(),
        'registerSuccess': (context) => const RegisterSuccess(),
        'homeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
