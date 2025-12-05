import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se7ty_app/core/routes/navigation.dart';
import 'package:se7ty_app/core/utils/colors.dart';
import 'package:se7ty_app/features/auth/login_doctor_screen.dart';
import 'package:se7ty_app/features/auth/login_patient_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/welcome-bg.svg",
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Text(
                  "أهلاً بيك",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "سجل واحجز عند دكتورك وانت مآمن",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.darkColor,
                  ),
                ),

                const Spacer(),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "سجل دخولك كـ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildButton(
                        title: "دكتور",
                        onTap: () {
                          pushTo(context, const LoginDoctorScreen());
                        },
                      ),

                      const SizedBox(height: 16),

                      _buildButton(
                        title: "مريض",
                        onTap: () {
                          pushTo(context, const LoginPatientScreen());
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required String title, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentColor,
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
