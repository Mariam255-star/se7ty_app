import 'package:flutter/material.dart';
import 'package:se7ty_app/core/routes/navigation.dart';
import 'package:se7ty_app/features/welcome/welcome_screen.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            /// Skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تخطي",
                  style: TextStyle(
                    color: Color(0xff007ea7),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// PageView
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      /// صورة PNG / JPG
                      Image.asset(
                        item.image,
                        height: 260,
                      ),

                      SizedBox(height: 40),

                      /// العنوان
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff007ea7),
                        ),
                      ),

                      SizedBox(height: 10),

                      /// الوصف
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          item.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Indicators + Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// Indicators
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 10,
                        width: currentIndex == index ? 22 : 10,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Color(0xff007ea7)
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 25),

                  /// Button last page only
                  if (currentIndex == onboardingData.length - 1)
                    ElevatedButton(
                      onPressed: () {
                       pushTo(context, const WelcomeScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff007ea7),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "هيا بنا",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
