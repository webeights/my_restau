import 'package:flutter/material.dart';
import 'package:my_restau/screens/login_screen.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Congratulations ',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('loginScreen');
              },
              child: const TextWidget(text: 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
