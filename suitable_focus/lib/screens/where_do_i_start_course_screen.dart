import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class WhereDoIStartCourseScreen extends StatefulWidget {
  const WhereDoIStartCourseScreen({super.key});

  @override
  State<WhereDoIStartCourseScreen> createState() =>
      _WhereDoIStartCourseScreenState();
}

class _WhereDoIStartCourseScreenState extends State<WhereDoIStartCourseScreen> {
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
          'Where Do I Start?',
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
                'Where Do I Start?',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Not sure where to begin? This course guides you through the first steps. '
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
