import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Introduction to Suitable Focus courses — shown when user taps the intro card on the Learn page.
class CourseIntroScreen extends StatelessWidget {
  const CourseIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.accentColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Introduction to SF Courses',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Suitable Focus logo or icon
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/suitableFocus.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.school,
                      color: AppColors.accentColor,
                      size: 64,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Welcome to Suitable Focus Learning',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Our courses are designed to help you move from idea to action. '
                'Start with the course that matches where you are today, and progress at your own pace.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'Course 1: Ideation to Foundation\n'
                'Course 2: Where Do I Start?\n'
                'Course 3: Ideal Customer Profile\n'
                'Course 4: Free Tools I Can Start With\n'
                'Course 5: Partnerships, Collaborations & Sponsorships\n'
                'Course 6: Compliance (Data, Financial, POPIA)\n'
                'Course 7: Simple Budgeting\n'
                'Course 8: Marketing Plan & Dashboard\n'
                'Course 9: Build Your Brand(s) as a Founder or Team\n'
                'Course 10: Where To Go Next',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
