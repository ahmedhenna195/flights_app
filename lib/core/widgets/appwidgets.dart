import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomTextField extends StatefulWidget {
  final String hint;
  final String prefixIconPath;
  final bool isPassword;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double iconWidth;
  final double iconHeight;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.prefixIconPath,
    this.iconWidth = 20.0,
    this.iconHeight = 16.0,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.formColor,
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.hintColor),


        prefixIcon: SizedBox(
          width: widget.iconWidth + 24,
          child: Center(
            child: SvgPicture.asset(
              widget.prefixIconPath,
              width: widget.iconWidth,
              height: widget.iconHeight,
              fit: BoxFit.contain,
              colorFilter:  ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color: AppColors.primaryBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}