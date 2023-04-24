import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests_app/common/theme/colors.dart';

class AuthTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final bool? obscureText;

  const AuthTextField({Key? key, required this.hintText, required this.controller, this.onSubmitted, this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      controller: controller,
      style: const TextStyle(
        color: AppTheme.white,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.textFiledSideColor),
            borderRadius: BorderRadius.circular(24),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.textFiledSideColor),
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.textFiledSideColor),
            borderRadius: BorderRadius.circular(24),
          ),
          labelText: hintText,
          labelStyle: const TextStyle(
            color: AppTheme.white,
          )),
      onSubmitted: onSubmitted,
      onChanged: (String newValue) async {
        controller!.text = newValue;
        controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
      },
    );
  }
}
