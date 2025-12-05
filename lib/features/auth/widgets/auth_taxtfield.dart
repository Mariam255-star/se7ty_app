import 'package:flutter/material.dart';
import 'package:se7ty_app/core/utils/colors.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
