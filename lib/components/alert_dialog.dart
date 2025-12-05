import 'package:flutter/material.dart';
import 'package:se7ty_app/core/utils/colors.dart';
import 'package:se7ty_app/core/utils/text_styles.dart';

showAlertDialog(
  BuildContext context, {
  String? ok,
  String? no,
  required String title,
  void Function()? onTap,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.accentColor,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(Icons.check, size: 50, color: AppColors.darkColor),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyles.titleStyle(

                    fontSize: 20,
                    fontFamily: 'Cairo',
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (ok != null)
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor,
                          ),
                          child: Text(
                            ok,
                            style: TextStyles.bodyStyle().copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    if (no != null)
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.accentColor,
                          ),
                          child: Text(no, style: TextStyles.bodyStyle()),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}