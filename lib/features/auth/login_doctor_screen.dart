import 'package:flutter/material.dart';
import 'package:se7ty_app/core/routes/navigation.dart';
import 'package:se7ty_app/features/auth/register_doctor_screen.dart';
import 'package:se7ty_app/features/auth/widgets/auth_taxtfield.dart';
import 'package:se7ty_app/features/auth/widgets/main_button.dart';
import 'package:se7ty_app/core/utils/colors.dart';
import 'package:se7ty_app/features/welcome/welcome_screen.dart';

class LoginDoctorScreen extends StatelessWidget {
  const LoginDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.darkColor),
          onPressed: () {
            // العودة لصفحة WelcomeScreen
            pushWithReplacement(context, const WelcomeScreen());
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset("assets/images/logo.png", height: 240),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "سجل دخول الآن كـ \"دكتور\"",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const AuthTextField(
                hint: "البريد الإلكتروني",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              const AuthTextField(
                hint: "كلمة المرور",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 22),
              mainButton(
                title: "تسجيل الدخول",
                onTap: () {
                  // تنفيذ تسجيل دخول دكتور
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ليس لديك حساب؟", style: TextStyle(color: AppColors.darkColor)),
                  InkWell(
                    onTap: () {
                      pushTo(context, const RegisterDoctorScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        " سجل الآن",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
