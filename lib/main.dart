import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_restau/screens/my_restaurant_screen.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/screens/register_screen.dart';
import 'package:my_restau/screens/register_success.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: <SystemUiOverlay>[],
  );

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
            iconSize: const MaterialStatePropertyAll(19),
            splashFactory: NoSplash.splashFactory,
            iconColor: const MaterialStatePropertyAll(
              Color(0xFFD14D72),
            ),
          ),
        ),
      ),
      initialRoute: 'loginScreen',
      routes: {
        'loginScreen': (context) => const LogInScreen(),
        'registerScreen': (context) => const RegisterScreen(),
        'registerSuccess': (context) => const RegisterSuccess(),
        'homeScreen': (context) => const MyRestaurant(),
      },
    );
  }
}
