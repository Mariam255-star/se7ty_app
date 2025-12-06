import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ty_app/core/utils/colors.dart';
import 'package:se7ty_app/core/utils/text_styles.dart';

enum DialogType { error, success, warning }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? AppColors.redColor
          : type == DialogType.success
          ? AppColors.primaryColor
          : AppColors.accentColor,
      content: Text(
        message,
        style: TextStyles.bodyStyle().copyWith(color: AppColors.whiteColor),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.darkColor.withValues(alpha: .7),
    builder: (context) {
      return Center(
        child: Lottie.asset("assets/images/loading.json", width: 250),
      );
    },
  );
}

