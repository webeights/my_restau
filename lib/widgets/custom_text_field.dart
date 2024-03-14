import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.obscureText = false,
    required this.textEditingController,
    required this.keyboardType,
    required this.hintText,
    this.inputBorder,
    super.key,
  });

  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? inputBorder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
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
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.all(9),
          border: inputBorder,
        ),
      ),
    );
  }
}
