import 'package:flutter/material.dart';
import 'package:se7ty_app/core/utils/colors.dart';

Widget mainButton({required String title, required VoidCallback onTap}) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
