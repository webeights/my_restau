import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.contentPadding,
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
  final EdgeInsetsGeometry? contentPadding;

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
          contentPadding: contentPadding,
          border: inputBorder,
        ),
      ),
    );
  }
}



// TextWidget(
//                     text: widget.item.title,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   RatingBar.builder(
//                     initialRating: widget.item.ratings,
//                     itemCount: 5,
//                     minRating: 1,
//                     allowHalfRating: true,
//                     itemSize: 18,
//                     glow: false,
//                     tapOnlyMode: true,
//                     direction: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return const Icon(
//                         Icons.star,
//                         color: Color(0xFFD14D72),
//                       );
//                     },
//                     onRatingUpdate: (ratings) => print(ratings),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextWidget(
//                     text: widget.item.description,
//                     fontSize: 13,
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         CustomButtonWidget(
//                           text: 'Order Now',
//                           onTap: () {},
//                         ),
//                         CustomButtonWidget(
//                           text: 'Add to Cart',
//                           onTap: addItemIntoCart,
//                         ),
//                       ],
//                     ),
//                   )