import 'package:flutter/material.dart';
import 'package:se7ty_app/features/auth/widgets/auth_taxtfield.dart';
import 'package:se7ty_app/features/auth/widgets/main_button.dart';
import 'package:se7ty_app/core/utils/colors.dart';
class RegisterPatientScreen extends StatelessWidget {
  const RegisterPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "سجل حساب جديد كـ \"مريض\"",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const AuthTextField(
                hint: "الاسم",
                icon: Icons.person,
              ),
              const SizedBox(height: 12),
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
                title: "تسجيل حساب",
                onTap: () {
                  // تنفيذ تسجيل حساب مريض
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("لديك حساب؟", style: TextStyle(color: AppColors.darkColor)),
                  InkWell(
                    onTap: () {
                      // navigate to patient login
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        "سجل دخول",
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
