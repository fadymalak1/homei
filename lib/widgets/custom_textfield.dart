import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController emailController,
    required this.title,
    this.obscureText=false,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType=TextInputType.text,
    this.inputFormatters
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String title;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title, style: TextStyle(color: Colors.grey),),
        TextField(
          obscureText: obscureText,
          controller: _emailController,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(

            hintText: title,
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
            border: Theme.of(context).inputDecorationTheme.border!,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
