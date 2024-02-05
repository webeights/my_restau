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
            Image.asset(
              'asset/images/High_five.png',
              width: 250,
            ),
            const TextWidget(
              text: 'Congratulation',
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => Navigator.pushNamed(context, 'loginScreen'),
              child: const TextWidget(
                text: 'Go back to login',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
