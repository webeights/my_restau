import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restau/widgets/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  bool isVisibility = true;
  bool isLoading = false;

  void signUpPage() {
    Navigator.pushNamed(context, 'registerScreen');
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamed(context, 'homeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'asset/images/sammy.png',
                width: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                textEditingController: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                contentPadding: const EdgeInsets.all(12),
                inputBorder: InputBorder.none,
                color: Colors.grey.shade200,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textEditingController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                contentPadding: const EdgeInsets.all(12),
                inputBorder: InputBorder.none,
                color: Colors.grey.shade200,
                obscureText: isVisibility,
                suffixIcon: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  icon: isVisibility
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD14D72),
                  minimumSize: const Size(double.infinity, 44),
                  foregroundColor: Colors.white,
                ),
                onPressed: signIn,
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
                    : const Text('Login'),
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
