import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.suffixIcon,
    this.obscureText = false,
    required this.textEditingController,
    required this.keyboardType,
    required this.hintText,
    super.key,
  });

  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  final String name = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: GoogleFonts.poppins(fontSize: 15),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
