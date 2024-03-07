import 'package:flutter/material.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isVisibilityPassword = true;
  bool isVisibilityConfirmPassword = true;

  void signInPage() {
    Navigator.of(context).pushNamed('loginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'asset/images/register.png',
              width: 180,
            ),
            const TextWidget(
              text: 'Sign Up',
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textEditingController: nameController,
              keyboardType: TextInputType.name,
              hintText: 'Name',
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
              obscureText: isVisibilityPassword,
              textEditingController: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisibilityPassword = !isVisibilityPassword;
                  });
                },
                icon: isVisibilityPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
              obscureText: isVisibilityConfirmPassword,
              textEditingController: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Confirm password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisibilityConfirmPassword = !isVisibilityPassword;
                  });
                },
                icon: isVisibilityConfirmPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD14D72),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'registerSuccess');
                },
                child: const TextWidget(
                  text: 'Sign Up',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  textColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextWidget(text: 'Or'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Image.asset(
                    'asset/images/google.png',
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Image.asset(
                    'asset/images/facebook.png',
                    width: 33,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Image.asset(
                    'asset/images/twitter.png',
                    width: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const TextWidget(text: 'Already have an account?'),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: signInPage,
              child: const TextWidget(
                text: 'Sign in',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                textColor: Color(0xFFFFABAB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
