import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CourseIntroScreen extends StatefulWidget {
  const CourseIntroScreen({super.key});

  @override
  State<CourseIntroScreen> createState() => _CourseIntroScreenState();
}

class _CourseIntroScreenState extends State<CourseIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Course content structured across 8 pages
  // Introduction to Suitable Focus App Courses & Learnings
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Welcome to Suitable Focus Courses',
      'content': 'This document provides a comprehensive structural, instructional, engagement, and backend overview for all 10 courses within the Suitable Focus App.',
      'subtitle': 'Moving from Uncertainty to Structured Action',
      'bullets': [
        'Purpose: Move founders and ideation-stage entrepreneurs from uncertainty to structured action',
        'Format: Guided micro-learning (10-15 minutes per course)',
        'Approach: Short educational content blocks (max 2-3 min reading each section)',
        'Engagement: Interactive fields, multiple choice questions, and downloadable worksheets'
      ],
    },
    {
      'title': 'What Each Course Includes',
      'content': 'Every course in the Suitable Focus App is designed with consistent features to maximize learning and action:',
      'subtitle': null,
      'bullets': [
        '10-15 minute structured learning flow',
        'Short educational content blocks (max 2-3 min reading each section)',
        'Interactive fields (text inputs, reflection boxes)',
        'Multiple choice guidance questions',
        'Completion progress indicator',
        'Downloadable worksheet or template',
        'Course completion trigger',
        'Plan-based access control'
      ],
    },
    {
      'title': 'Platform Access Levels',
      'content': 'Courses are organized by access levels to match your business needs:',
      'subtitle': null,
      'bullets': [
        'FREE PLAN - Course 1 only (Ideation to Foundation)',
        'STANDARD PLAN (Monthly Paying Users) - Courses 1-3 (Clarity + Structure)',
        'PREMIUM PLAN - All 10 Courses (Complete journey from ideation to growth)'
      ],
    },
    {
      'title': 'Courses 1-3: Clarity + Structure',
      'content': 'Foundation courses designed to bring clarity and structure to your business idea:',
      'subtitle': null,
      'bullets': [
        'Course 1: Ideation to Foundation - Turn idea into structured action framework',
        'Course 2: Where Do I Start? - Clear first 60-90 day setup roadmap',
        'Course 3: ICP (Ideal Customer Profile) - Clear buyer clarity for targeting & messaging'
      ],
    },
    {
      'title': 'Courses 4-8: Systems + Tools + Compliance',
      'content': 'Intermediate courses covering practical systems, tools, and compliance:',
      'subtitle': null,
      'bullets': [
        'Course 4: Free Tools I Can Start With - Practical tools awareness based on budget',
        'Course 5: Partnerships, Collaborations & Sponsorships - Structured relationship growth plan',
        'Course 6: Compliance (Data, Financial, POPIA) - Risk awareness + compliance readiness',
        'Course 7: Simple Budgeting - Financial visibility + forecasting clarity',
        'Course 8: Marketing Plan & Dashboard - Structured marketing visibility + KPI tracking'
      ],
    },
    {
      'title': 'Courses 9-10: Positioning + Growth Direction',
      'content': 'Advanced courses focused on positioning and strategic growth:',
      'subtitle': null,
      'bullets': [
        'Course 9: Build Your Brand(s) as a Founder or Team - Founder visibility as growth lever',
        'Course 10: Where to Go Next - Clear next 90-day strategic direction'
      ],
    },
    {
      'title': 'Course Completion & Progress',
      'content': 'Each course must be marked "Complete" only after:',
      'subtitle': null,
      'bullets': [
        'All required fields are filled',
        'All multiple choice questions answered',
        'Worksheet download button viewed',
        'Once all courses available within your plan are complete, a final survey will be triggered'
      ],
    },
    {
      'title': 'Your Learning Journey',
      'content': 'The Suitable Focus courses are designed to take you on a structured journey from idea to growth. Each course builds upon the previous one, ensuring you develop a complete understanding of what it takes to build a successful business.',
      'subtitle': 'Ready to Begin?',
      'bullets': [
        'Start with Course 1: Ideation to Foundation (available to all users)',
        'Progress through courses based on your plan level',
        'Complete interactive exercises and download worksheets',
        'Track your progress and celebrate milestones',
        'Access downloadable resources to support your journey'
      ],
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.accentColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Introduction to SF courses',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Page View
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _buildPage(_pages[index]);
              },
            ),
          ),
          
          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton.icon(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    label: Text(
                      'Previous',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  )
                else
                  SizedBox.shrink(),
                
                if (_currentPage < _pages.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.black),
                    label: Text(
                      'Next',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.check, color: Colors.black),
                    label: Text(
                      'Done',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> pageData) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.accentColor.withValues(alpha: 0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accentColor.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Title
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.accentColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  pageData['title'] ?? 'Page',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Main Content
              if (pageData['content'] != null)
                Text(
                  pageData['content'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.7,
                    letterSpacing: 0.3,
                  ),
                ),
          
              // Subtitle (if provided)
              if (pageData['subtitle'] != null) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.accentColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    pageData['subtitle'],
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              
              // Bullet Points (if provided)
              if (pageData['bullets'] != null && (pageData['bullets'] as List).isNotEmpty) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.accentColor.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...(pageData['bullets'] as List<String>).map<Widget>((bullet) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 6, right: 12),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                bullet,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  height: 1.7,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
              
              // Additional sections (if provided)
              if (pageData['sections'] != null && (pageData['sections'] as List).isNotEmpty) ...[
                const SizedBox(height: 24),
                ...(pageData['sections'] as List<Map<String, dynamic>>).map<Widget>((section) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.accentColor.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (section['heading'] != null)
                          Text(
                            section['heading'],
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (section['heading'] != null) const SizedBox(height: 12),
                        if (section['text'] != null)
                          Text(
                            section['text'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.7,
                              letterSpacing: 0.2,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

