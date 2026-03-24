import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class IdeationFoundationCourseScreen extends StatefulWidget {
  const IdeationFoundationCourseScreen({super.key});

  @override
  State<IdeationFoundationCourseScreen> createState() =>
      _IdeationFoundationCourseScreenState();
}

class _IdeationFoundationCourseScreenState
    extends State<IdeationFoundationCourseScreen> {
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
          'Ideation to Foundation',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Ideation to Foundation',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'This course helps you turn your idea into a clear foundation for your business. '
                'Content is being updated — check back soon.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
