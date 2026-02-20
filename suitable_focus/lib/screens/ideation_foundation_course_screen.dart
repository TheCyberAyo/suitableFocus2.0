import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class IdeationFoundationCourseScreen extends StatefulWidget {
  const IdeationFoundationCourseScreen({super.key});

  @override
  State<IdeationFoundationCourseScreen> createState() => _IdeationFoundationCourseScreenState();
}

class _IdeationFoundationCourseScreenState extends State<IdeationFoundationCourseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Text controllers for editable fields
  final Map<String, TextEditingController> _textControllers = {};
  
  @override
  void initState() {
    super.initState();
    // Initialize text controllers for all editable fields
    _initializeControllers();
  }
  
  void _initializeControllers() {
    // Initialize controllers for all editable fields
    _textControllers['businessIdea'] = TextEditingController();
    _textControllers['targetAudience'] = TextEditingController();
    _textControllers['problemStatement'] = TextEditingController();
    _textControllers['solutionDescription'] = TextEditingController();
    _textControllers['uniqueValue'] = TextEditingController();
    _textControllers['revenueModel'] = TextEditingController();
    _textControllers['revenueTarget'] = TextEditingController();
    _textControllers['impactTarget'] = TextEditingController();
    _textControllers['growthTarget'] = TextEditingController();
    _textControllers['businessType'] = TextEditingController();
    _textControllers['industry'] = TextEditingController();
    _textControllers['problemSolved'] = TextEditingController();
    _textControllers['targetCustomers'] = TextEditingController();
    _textControllers['differentiation'] = TextEditingController();
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // 20-page course structure for IDEATION TO FOUNDATION
  // 6-Module Digital Business Starter Program
  List<Map<String, dynamic>> get _pages {
    return [
    // Page 1: Welcome & Introduction
    {
      'type': 'content',
      'module': 'Introduction',
      'title': 'Welcome to IDEATION TO FOUNDATION',
      'subtitle': '6-Module Digital Business Starter Program',
      'content': 'Designed for in-app learning (mobile-first, interactive, progress-tracked)\n\nTarget Completion Time: 60-90 Minutes (Self-paced)\n\nPrimary Outcome: Transform a raw idea into a structured, validated, and actionable business foundation.',
      'bullets': [
        'Mobile-first design for learning on the go',
        'Interactive exercises to apply concepts',
        'Progress tracking to monitor your journey',
        'Self-paced learning at your convenience'
      ],
    },
    
    // Page 2: Course Overview
    {
      'type': 'content',
      'module': 'Introduction',
      'title': 'Course Overview',
      'content': 'This course will guide you through six comprehensive modules designed to take your business idea from concept to foundation. Each module builds upon the previous one, ensuring you develop a complete understanding of what it takes to build a successful business.',
      'bullets': [
        'Module 1: Idea Generation & Validation',
        'Module 2: Problem-Solution Fit',
        'Module 3: Target Market Identification',
        'Module 4: Value Proposition Development',
        'Module 5: Business Model Design',
        'Module 6: Foundation Summary & Next Steps'
      ],
    },
    
    // MODULE 1: Idea Generation & Validation
    // Page 3: Module 1 Introduction
    {
      'type': 'content',
      'module': 'Module 1: Idea Generation & Validation',
      'title': 'Module 1: Idea Generation & Validation',
      'content': 'Every successful business starts with a solid idea. In this module, you will learn how to generate, refine, and validate your business concept. We will explore techniques for identifying opportunities and ensuring your idea has potential in the market.',
      'bullets': [
        'Understanding what makes a good business idea',
        'Techniques for generating innovative concepts',
        'Methods to validate your idea before investing',
        'Identifying market opportunities'
      ],
    },
    
    // Page 4: Your Business Idea
    {
      'type': 'editable',
      'module': 'Module 1: Idea Generation & Validation',
      'title': 'Your Business Idea',
      'content': 'Take a moment to describe your business idea. Be as specific as possible about what you want to create or offer.',
      'fieldKey': 'businessIdea',
      'hint': 'Describe your business idea in detail...',
      'label': 'My Business Idea',
    },
    
    // Page 5: Idea Validation
    {
      'type': 'content',
      'module': 'Module 1: Idea Generation & Validation',
      'title': 'Validating Your Idea',
      'content': 'Validation is crucial before investing time and resources. Ask yourself these key questions to determine if your idea has potential:',
      'bullets': [
        'Is there a real need or problem this solves?',
        'Are people willing to pay for this solution?',
        'Is the market large enough to support this business?',
        'Do you have the skills and resources to execute?',
        'What makes this idea unique or better than alternatives?'
      ],
    },
    
    // MODULE 2: Problem-Solution Fit
    // Page 6: Module 2 Introduction
    {
      'type': 'content',
      'module': 'Module 2: Problem-Solution Fit',
      'title': 'Module 2: Problem-Solution Fit',
      'content': 'A successful business solves a real problem for real people. This module helps you identify the specific problem your business addresses and how your solution fits that need perfectly.',
      'bullets': [
        'Identifying the core problem you solve',
        'Understanding customer pain points',
        'Designing solutions that fit the problem',
        'Testing problem-solution alignment'
      ],
    },
    
    // Page 7: The Problem
    {
      'type': 'editable',
      'module': 'Module 2: Problem-Solution Fit',
      'title': 'The Problem You Solve',
      'content': 'Clearly define the problem your business addresses. What pain point or challenge does your target audience face?',
      'fieldKey': 'problemStatement',
      'hint': 'Describe the specific problem or challenge...',
      'label': 'Problem Statement',
    },
    
    // Page 8: Your Solution
    {
      'type': 'editable',
      'module': 'Module 2: Problem-Solution Fit',
      'title': 'Your Solution',
      'content': 'Now describe how your business solves this problem. What product, service, or approach do you offer?',
      'fieldKey': 'solutionDescription',
      'hint': 'Describe your solution in detail...',
      'label': 'Solution Description',
    },
    
    // MODULE 3: Target Market Identification
    // Page 9: Module 3 Introduction
    {
      'type': 'content',
      'module': 'Module 3: Target Market Identification',
      'title': 'Module 3: Target Market Identification',
      'content': 'Knowing exactly who your customers are is essential for business success. This module guides you through identifying and understanding your target market.',
      'bullets': [
        'Defining your ideal customer profile',
        'Understanding customer demographics and psychographics',
        'Identifying market size and potential',
        'Analyzing customer needs and behaviors'
      ],
    },
    
    // Page 10: Target Audience
    {
      'type': 'editable',
      'module': 'Module 3: Target Market Identification',
      'title': 'Your Target Audience',
      'content': 'Who are the people that need your solution? Be specific about their characteristics, needs, and behaviors.',
      'fieldKey': 'targetAudience',
      'hint': 'Describe your target audience in detail...',
      'label': 'Target Audience Description',
    },
    
    // Page 11: Market Research
    {
      'type': 'content',
      'module': 'Module 3: Target Market Identification',
      'title': 'Understanding Your Market',
      'content': 'Conducting market research helps you understand the landscape in which your business will operate. Consider these factors:',
      'bullets': [
        'Market size and growth potential',
        'Competitor analysis and positioning',
        'Customer buying patterns and preferences',
        'Market trends and opportunities',
        'Barriers to entry and challenges'
      ],
    },
    
    // MODULE 4: Value Proposition Development
    // Page 12: Module 4 Introduction
    {
      'type': 'content',
      'module': 'Module 4: Value Proposition Development',
      'title': 'Module 4: Value Proposition Development',
      'content': 'Your value proposition is what makes customers choose you over competitors. This module helps you craft a compelling value proposition that clearly communicates your unique benefits.',
      'bullets': [
        'Defining what makes your solution unique',
        'Communicating value clearly and concisely',
        'Differentiating from competitors',
        'Connecting value to customer needs'
      ],
    },
    
    // Page 13: Unique Value
    {
      'type': 'editable',
      'module': 'Module 4: Value Proposition Development',
      'title': 'What Makes You Different',
      'content': 'Describe what makes your solution unique or better than alternatives. What is your competitive advantage?',
      'fieldKey': 'uniqueValue',
      'hint': 'Explain your unique value proposition...',
      'label': 'Unique Value Proposition',
    },
    
    // Page 14: Value Communication
    {
      'type': 'content',
      'module': 'Module 4: Value Proposition Development',
      'title': 'Communicating Your Value',
      'content': 'A strong value proposition should be clear, concise, and compelling. It should answer:',
      'bullets': [
        'What do you offer?',
        'Who is it for?',
        'What problem does it solve?',
        'Why should customers choose you?',
        'What benefits do they receive?'
      ],
    },
    
    // MODULE 5: Business Model Design
    // Page 15: Module 5 Introduction
    {
      'type': 'content',
      'module': 'Module 5: Business Model Design',
      'title': 'Module 5: Business Model Design',
      'content': 'Your business model defines how you create, deliver, and capture value. This module explores different revenue models and helps you design one that works for your business.',
      'bullets': [
        'Understanding different revenue models',
        'Designing your revenue streams',
        'Identifying key resources and activities',
        'Planning for sustainability and growth'
      ],
    },
    
    // Page 16: Revenue Model
    {
      'type': 'editable',
      'module': 'Module 5: Business Model Design',
      'title': 'Your Revenue Model',
      'content': 'How will your business make money? Describe your primary revenue streams and pricing strategy.',
      'fieldKey': 'revenueModel',
      'hint': 'Describe your revenue model (e.g., subscription, one-time purchase, commission, etc.)...',
      'label': 'Revenue Model',
    },
    
    // Page 17: Business Goals
    {
      'type': 'content',
      'module': 'Module 5: Business Model Design',
      'title': 'Setting Business Goals',
      'content': 'Clear goals help you measure success and stay focused. Consider setting goals for revenue, impact, and growth. Think about where you want to be in 12 months.',
      'bullets': [
        'Revenue targets and financial goals',
        'Customer impact and reach',
        'Business growth and expansion plans',
        'Key milestones and achievements'
      ],
    },
    
    // Page 18: Goal Setting
    {
      'type': 'editable',
      'module': 'Module 5: Business Model Design',
      'title': 'Your 12-Month Goals',
      'content': 'Set specific, measurable goals for your business. What do you aim to achieve in the next 12 months?',
      'fieldKey': 'revenueTarget',
      'hint': 'Enter your revenue target (e.g., R50,000, \$10,000, etc.)...',
      'label': 'Revenue Target (12 months)',
      'additionalFields': [
        {
          'key': 'impactTarget',
          'label': 'People Impacted (12 months)',
          'hint': 'How many people do you aim to impact?',
        },
        {
          'key': 'growthTarget',
          'label': 'Growth Goal (12 months)',
          'hint': 'How do you want to grow? (e.g., expand to 3 cities, hire 5 employees, etc.)',
        },
      ],
    },
    
    // MODULE 6: Foundation Summary
    // Page 19: Module 6 Introduction
    {
      'type': 'content',
      'module': 'Module 6: Foundation Summary',
      'title': 'Module 6: Foundation Summary',
      'content': 'Congratulations on completing the course! This final module helps you consolidate everything you have learned into a clear business foundation summary. This summary will serve as your reference document as you move forward.',
      'bullets': [
        'Review all your inputs and decisions',
        'Create a comprehensive business foundation summary',
        'Identify next steps and action items',
        'Plan for implementation and growth'
      ],
    },
    
    // Page 20: Business Foundation Summary
    {
      'type': 'summary',
      'module': 'Module 6: Foundation Summary',
      'title': 'YOUR BUSINESS FOUNDATION SUMMARY',
      'content': 'Complete the following template with your business information. This summary captures the essence of your business foundation.',
      'summaryFields': [
        {
          'key': 'businessType',
          'label': 'Business Type',
          'hint': 'e.g., service, product, platform, etc.',
        },
        {
          'key': 'industry',
          'label': 'Industry',
          'hint': 'e.g., technology, healthcare, education, etc.',
        },
        {
          'key': 'problemSolved',
          'label': 'Problem Solved',
          'hint': 'What problem does your business solve?',
        },
        {
          'key': 'targetCustomers',
          'label': 'Target Customers',
          'hint': 'Who are your target customers?',
        },
        {
          'key': 'differentiation',
          'label': 'Differentiation',
          'hint': 'How is your solution different?',
        },
        {
          'key': 'revenueModel',
          'label': 'Revenue Model',
          'hint': 'How does your business make money?',
        },
      ],
    },
    ];
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
        title: Column(
          children: [
            Text(
              'IDEATION TO FOUNDATION',
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Page ${_currentPage + 1} of ${_pages.length}',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Module indicator
          if (_pages[_currentPage]['module'] != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.inputBackground,
              child: Text(
                _pages[_currentPage]['module'],
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          
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
                      'Complete',
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
    final String type = pageData['type'] ?? 'content';
    
    if (type == 'editable') {
      return _buildEditablePage(pageData);
    } else if (type == 'summary') {
      return _buildSummaryPage(pageData);
    } else {
      return _buildContentPage(pageData);
    }
  }

  Widget _buildContentPage(Map<String, dynamic> pageData) {
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
              
              // Subtitle (if provided)
              if (pageData['subtitle'] != null) ...[
                const SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditablePage(Map<String, dynamic> pageData) {
    final String fieldKey = pageData['fieldKey'] ?? '';
    final TextEditingController controller = _textControllers[fieldKey] ?? TextEditingController();
    
    // Initialize controller if not already done
    if (!_textControllers.containsKey(fieldKey)) {
      _textControllers[fieldKey] = controller;
    }
    
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
              
              // Content description
              if (pageData['content'] != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.accentColor.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    pageData['content'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.7,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              
              // Editable Text Field
              TextField(
                controller: controller,
                maxLines: null,
                minLines: 8,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  labelText: pageData['label'] ?? 'Your Answer',
                  hintText: pageData['hint'] ?? 'Type your answer here...',
                  hintStyle: TextStyle(color: Colors.white54),
                  labelStyle: TextStyle(color: AppColors.accentColor),
                  filled: true,
                  fillColor: AppColors.backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.accentColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                  ),
                ),
              ),
              
              // Additional fields (if provided)
              if (pageData['additionalFields'] != null) ...[
                const SizedBox(height: 24),
                ...(pageData['additionalFields'] as List<Map<String, dynamic>>).map<Widget>((field) {
                  final String key = field['key'] ?? '';
                  if (!_textControllers.containsKey(key)) {
                    _textControllers[key] = TextEditingController();
                  }
                  final TextEditingController fieldController = _textControllers[key]!;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextField(
                      controller: fieldController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        labelText: field['label'] ?? 'Field',
                        hintText: field['hint'] ?? 'Enter value...',
                        hintStyle: TextStyle(color: Colors.white54),
                        labelStyle: TextStyle(color: AppColors.accentColor),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                        ),
                      ),
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

  Widget _buildSummaryPage(Map<String, dynamic> pageData) {
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
                  pageData['title'] ?? 'Summary',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Content description
              if (pageData['content'] != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.accentColor.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    pageData['content'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.7,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              
              const SizedBox(height: 32),
              
              // Summary Template
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: AppColors.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  'I am building a __________ business in the __________ industry that solves __________ for __________.',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              // Summary Fields
              if (pageData['summaryFields'] != null)
                ...(pageData['summaryFields'] as List<Map<String, dynamic>>).map<Widget>((field) {
              final String key = field['key'] ?? '';
              if (!_textControllers.containsKey(key)) {
                _textControllers[key] = TextEditingController();
              }
              final TextEditingController fieldController = _textControllers[key]!;
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: fieldController,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: field['label'] ?? 'Field',
                    hintText: field['hint'] ?? 'Enter value...',
                    hintStyle: TextStyle(color: Colors.white54),
                    labelStyle: TextStyle(color: AppColors.accentColor),
                    filled: true,
                    fillColor: AppColors.inputBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.accentColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                    ),
                  ),
                ),
              );
                }),
              
              const SizedBox(height: 24),
              
              // Additional summary statements
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My solution is different because __________.',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_textControllers['differentiation'] != null)
                      TextField(
                        controller: _textControllers['differentiation']!,
                        maxLines: 3,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Explain how your solution is different...',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: AppColors.backgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My revenue model is __________.',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_textControllers['revenueModel'] != null)
                      TextField(
                        controller: _textControllers['revenueModel']!,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Describe your revenue model...',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: AppColors.backgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'In 12 months, I aim to generate __________, impact __________ people, and grow into __________.',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textControllers['revenueTarget'],
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              labelText: 'Revenue Target',
                              hintText: 'e.g., R50,000',
                              hintStyle: TextStyle(color: Colors.white54),
                              labelStyle: TextStyle(color: AppColors.accentColor),
                              filled: true,
                              fillColor: AppColors.backgroundColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _textControllers['impactTarget'],
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              labelText: 'People Impacted',
                              hintText: 'e.g., 100',
                              hintStyle: TextStyle(color: Colors.white54),
                              labelStyle: TextStyle(color: AppColors.accentColor),
                              filled: true,
                              fillColor: AppColors.backgroundColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _textControllers['growthTarget'],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Growth Goal',
                        hintText: 'e.g., expand to 3 cities, hire 5 employees',
                        hintStyle: TextStyle(color: Colors.white54),
                        labelStyle: TextStyle(color: AppColors.accentColor),
                        filled: true,
                        fillColor: AppColors.backgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor.withValues(alpha: 0.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.accentColor, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

