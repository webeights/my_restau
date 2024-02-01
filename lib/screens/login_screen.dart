import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isChecked = false;
  bool isVisibility = false;
  bool isLoading = false;

  void signUpPage() {
    Navigator.pushNamed(context, 'registerScreen');
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamed(context, 'homeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 100,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'asset/images/sammy.png',
              width: 200,
            ),
            const TextWidget(
              text: 'Login',
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: isVisibility,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  icon: isVisibility
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  splashRadius: 0,
                  activeColor: const Color(0xFFD14D72),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text('remember me')
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD14D72),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 40,
                child: Center(
                  child: InkWell(
                    onTap: signIn,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                                strokeAlign: 0.1,
                              ),
                            ),
                          )
                        : const TextWidget(
                            text: 'Login',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            textColor: Colors.white,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: const TextWidget(
                  text: 'forgot password?',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const TextWidget(
              text: 'Don\'t have an account?',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: signUpPage,
              child: const TextWidget(
                text: 'Sign Up',
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

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.textColor,
    this.textAlign,
    super.key,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: textColor,
      ),
    );
  }
}
