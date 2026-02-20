import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class IdealCustomerProfileCourseScreen extends StatefulWidget {
  const IdealCustomerProfileCourseScreen({super.key});

  @override
  State<IdealCustomerProfileCourseScreen> createState() =>
      _IdealCustomerProfileCourseScreenState();
}

class _IdealCustomerProfileCourseScreenState
    extends State<IdealCustomerProfileCourseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final Map<String, Set<String>> _selectedItems = {};
  final Map<String, TextEditingController> _textControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    const keys = [
      'primaryAgeRange',
      'secondaryAgeRange',
      'country',
      'cityTown',
      'urbanOrRural',
      'marketScope',
      'monthlyIncome',
      'disposableIncomeLevel',
      'shortTermGoal',
      'longTermGoal',
      'personalAmbition',
      'mainFrustration',
      'secondaryFrustration',
      'angerTrigger',
      'typicalDay',
      'hobbies',
      'socialHabits',
      'primaryResearchPlatform',
      'secondaryResearchPlatform',
      'trigger1',
      'trigger2',
      'trigger3',
      'objection1',
      'objection2',
      'objection3',
      'objection4',
      'objection5',
      'objectionDetail',
      'solutionDetail',
      'proofDetail',
      'reassuranceDetail',
      'struggleWith',
      'wishICould',
      'hateWhen',
      'personaName',
      'personaAge',
      'personaLocation',
      'personaIncome',
      'personaGoal',
      'personaFrustration',
      'personaLifestyle',
      'personaResearchPlatform',
      'personaPurchaseTrigger',
      'personaObjection',
    ];

    for (final key in keys) {
      _textControllers[key] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  List<Map<String, dynamic>> get _pages {
    return [
      {
        'type': 'content',
        'module': 'Introduction',
        'title': 'Why Ideal Customer Clarity Matters',
        'content':
            'If you try to speak to everyone, you convert no one. Clear customer profiling helps you focus your message and improve conversions.',
        'bullets': [
          'Write better ads',
          'Create stronger content',
          'Design better products',
          'Increase conversions',
          'Avoid wasting marketing budget',
        ],
      },
      {
        'type': 'content',
        'module': 'Introduction',
        'title': 'What Is an Ideal Customer Profile?',
        'content':
            'An Ideal Customer Profile (ICP) is a detailed description of the specific person most likely to buy your product or service.',
        'bullets': [
          'Demographics (who they are)',
          'Psychographics (how they think)',
          'Behaviour (how they buy)',
        ],
      },
      {
        'type': 'content',
        'module': 'Step 1: Demographics Builder',
        'title': 'Step 1: Demographics Builder',
        'content':
            'Objective: Define who your buyer is in measurable terms.',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 1: Demographics Builder',
        'title': 'Age Range',
        'content': 'Age influences spending power, platform choice, communication tone, and buying triggers.',
        'bullets': [
          'Example: 25-35 (young professionals)',
          'Example: 35-45 (established earners)',
        ],
        'editableFields': [
          {
            'key': 'primaryAgeRange',
            'label': 'Primary Age Range',
            'hint': 'e.g. 25-35',
            'maxLines': 1,
          },
          {
            'key': 'secondaryAgeRange',
            'label': 'Secondary Age Range (optional)',
            'hint': 'e.g. 35-45',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Step 1: Demographics Builder',
        'title': 'Location',
        'content': 'Location affects language, payment methods, cultural tone, and delivery logistics.',
        'bullets': null,
        'editableFields': [
          {'key': 'country', 'label': 'Country', 'hint': 'Enter country', 'maxLines': 1},
          {'key': 'cityTown', 'label': 'City/Town', 'hint': 'Enter city or town', 'maxLines': 1},
          {'key': 'urbanOrRural', 'label': 'Urban or Rural', 'hint': 'Enter urban or rural', 'maxLines': 1},
          {
            'key': 'marketScope',
            'label': 'Local or International Market',
            'hint': 'Enter local or international',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Step 1: Demographics Builder',
        'title': 'Income Level',
        'content': 'Income determines pricing strategy, payment flexibility, and offer positioning.',
        'bullets': [
          'Entry-level income',
          'Mid-level income',
          'High-income',
          'Business owners',
        ],
        'editableFields': [
          {
            'key': 'monthlyIncome',
            'label': 'Estimated Monthly Income',
            'hint': 'e.g. R25,000',
            'maxLines': 1,
          },
          {
            'key': 'disposableIncomeLevel',
            'label': 'Disposable Income Level',
            'hint': 'e.g. medium',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Step 1: Demographics Builder',
        'title': 'Demographic Snapshot',
        'content':
            'The app combines entries into: Our ideal customer is a ___-year-old living in ___ with a monthly income of ___.',
        'bullets': ['Demographic Clarity badge unlocks after completion'],
      },
      {
        'type': 'content',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Step 2: Psychographics Mapping',
        'content':
            'Objective: Understand how your customer thinks. Psychographics determine messaging tone, emotional triggers, and brand alignment.',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Goals',
        'content': 'What are they trying to achieve?',
        'bullets': [
          'Financial independence',
          'Career growth',
          'Social recognition',
          'Convenience',
          'Stability',
        ],
        'editableFields': [
          {
            'key': 'shortTermGoal',
            'label': 'Short-term Goal',
            'hint': 'Enter short-term goal',
            'maxLines': 2,
          },
          {
            'key': 'longTermGoal',
            'label': 'Long-term Goal',
            'hint': 'Enter long-term goal',
            'maxLines': 2,
          },
          {
            'key': 'personalAmbition',
            'label': 'Personal Ambition',
            'hint': 'Enter personal ambition',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Frustrations',
        'content': 'What annoys or blocks them?',
        'bullets': [
          'Lack of time',
          'Poor service providers',
          'High costs',
          'Confusing information',
          'Trust issues',
        ],
        'editableFields': [
          {
            'key': 'mainFrustration',
            'label': 'Main Frustration',
            'hint': 'Enter main frustration',
            'maxLines': 2,
          },
          {
            'key': 'secondaryFrustration',
            'label': 'Secondary Frustration',
            'hint': 'Enter secondary frustration',
            'maxLines': 2,
          },
          {
            'key': 'angerTrigger',
            'label': 'What Makes Them Angry?',
            'hint': 'Describe anger trigger',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Lifestyle',
        'content': 'Lifestyle affects content style, brand personality, and time availability.',
        'bullets': [
          'Busy professional',
          'Student',
          'Entrepreneur',
          'Parent',
          'Freelancer',
        ],
        'editableFields': [
          {
            'key': 'typicalDay',
            'label': 'Typical Day',
            'hint': 'Describe a typical day',
            'maxLines': 3,
          },
          {'key': 'hobbies', 'label': 'Hobbies', 'hint': 'List hobbies', 'maxLines': 2},
          {
            'key': 'socialHabits',
            'label': 'Social Habits',
            'hint': 'Describe social habits',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'selectable',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Emotional Drivers',
        'content':
            'People buy emotionally, justify logically. Select what your customer is mostly driven by:',
        'items': [
          'Fear',
          'Status',
          'Convenience',
          'Growth',
          'Community',
        ],
      },
      {
        'type': 'content',
        'module': 'Step 2: Psychographics Mapping',
        'title': 'Psychographic Summary',
        'content':
            'App summary format: They want ___ but struggle with ___. They value ___ and are motivated by ___.',
        'bullets': ['Psychology Insight badge unlocks after completion'],
      },
      {
        'type': 'content',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Step 3: Buying Behaviour',
        'content': 'Objective: Understand how they make purchasing decisions.',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Where Do They Research?',
        'content': 'Common research options include Google, YouTube, TikTok, Instagram, LinkedIn, word of mouth, Facebook groups, and blogs.',
        'bullets': null,
        'editableFields': [
          {
            'key': 'primaryResearchPlatform',
            'label': 'Primary Research Platform',
            'hint': 'Enter primary platform',
            'maxLines': 1,
          },
          {
            'key': 'secondaryResearchPlatform',
            'label': 'Secondary Research Platform',
            'hint': 'Enter secondary platform',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'selectable',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Content Preference',
        'content': 'Select preferred content types:',
        'items': [
          'Short videos',
          'Long-form education',
          'Visual posts',
          'Testimonials',
          'Case studies',
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Step 3: Buying Behaviour',
        'title': 'What Triggers Purchase Decisions?',
        'content': 'Common triggers include limited-time offer, social proof, discount, guarantee, urgency, peer recommendation, and clear ROI.',
        'bullets': null,
        'editableFields': [
          {
            'key': 'trigger1',
            'label': 'Top Trigger 1',
            'hint': 'Enter trigger 1',
            'maxLines': 1,
          },
          {
            'key': 'trigger2',
            'label': 'Top Trigger 2',
            'hint': 'Enter trigger 2',
            'maxLines': 1,
          },
          {
            'key': 'trigger3',
            'label': 'Top Trigger 3',
            'hint': 'Enter trigger 3',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'selectable',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Decision Speed',
        'content': 'Select buyer decision style:',
        'items': [
          'Impulsive buyers',
          'Careful researchers',
          'Price-comparison shoppers',
          'Loyalty-driven buyers',
        ],
      },
      {
        'type': 'selectable',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Budget Sensitivity',
        'content': 'Select budget behaviour patterns:',
        'items': [
          'Prioritize price',
          'Prioritize quality',
          'Want payment plans',
          'Avoid subscriptions',
        ],
      },
      {
        'type': 'content',
        'module': 'Step 3: Buying Behaviour',
        'title': 'Buying Behaviour Summary',
        'content':
            'App summary format: They research on ___, are influenced by ___, and usually decide after ___.',
        'bullets': ['Buyer Insight badge unlocks after completion'],
      },
      {
        'type': 'content',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Step 4: Objections & Barriers',
        'content': 'Objective: Understand why they might say no.',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Why Would They Say No?',
        'content': 'Common objections include price, trust, value clarity, timing, approvals, and risk.',
        'bullets': null,
        'editableFields': [
          {'key': 'objection1', 'label': 'Objection 1', 'hint': 'Enter objection 1', 'maxLines': 1},
          {'key': 'objection2', 'label': 'Objection 2', 'hint': 'Enter objection 2', 'maxLines': 1},
          {'key': 'objection3', 'label': 'Objection 3', 'hint': 'Enter objection 3', 'maxLines': 1},
          {'key': 'objection4', 'label': 'Objection 4', 'hint': 'Enter objection 4', 'maxLines': 1},
          {'key': 'objection5', 'label': 'Objection 5', 'hint': 'Enter objection 5', 'maxLines': 1},
        ],
      },
      {
        'type': 'content',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Hidden Barriers',
        'content': 'Sometimes objections are emotional: fear of failure, fear of looking foolish, or fear of wasting money.',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Overcoming Objections Strategy',
        'content': 'For each objection, define your response strategy.',
        'bullets': [
          'Example: Too expensive -> Offer payment plan -> Show ROI example -> Provide guarantee.',
        ],
        'editableFields': [
          {
            'key': 'objectionDetail',
            'label': 'Objection',
            'hint': 'Describe the objection',
            'maxLines': 2,
          },
          {
            'key': 'solutionDetail',
            'label': 'Solution',
            'hint': 'How will you address it?',
            'maxLines': 2,
          },
          {
            'key': 'proofDetail',
            'label': 'Proof',
            'hint': 'What proof will you provide?',
            'maxLines': 2,
          },
          {
            'key': 'reassuranceDetail',
            'label': 'Reassurance',
            'hint': 'How will you reassure the buyer?',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'selectable',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Trust Builders',
        'content': 'Select trust signals you will use:',
        'items': [
          'Testimonials',
          'Reviews',
          'Guarantees',
          'Certifications',
          'Secure payments',
          'Clear contact info',
        ],
      },
      {
        'type': 'content',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Messaging Alignment',
        'content':
            'Refine your message from generic to specific. Example: Instead of "We offer digital marketing services," say "We help busy small business owners get more customers without wasting money on ads."',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Step 4: Objections & Barriers',
        'title': 'Customer Language Extraction',
        'content': 'Capture exact customer language and reuse it in your marketing.',
        'bullets': null,
        'editableFields': [
          {
            'key': 'struggleWith',
            'label': 'They often say: "I struggle with..."',
            'hint': 'Capture real customer wording',
            'maxLines': 2,
          },
          {
            'key': 'wishICould',
            'label': 'They often say: "I wish I could..."',
            'hint': 'Capture real customer wording',
            'maxLines': 2,
          },
          {
            'key': 'hateWhen',
            'label': 'They often say: "I hate when..."',
            'hint': 'Capture real customer wording',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Persona Builder Output',
        'title': 'Final Persona Builder',
        'content': 'Complete your Ideal Customer Profile summary.',
        'bullets': null,
        'editableFields': [
          {'key': 'personaName', 'label': 'Name (Persona Name)', 'hint': 'Enter persona name', 'maxLines': 1},
          {'key': 'personaAge', 'label': 'Age', 'hint': 'Enter age range', 'maxLines': 1},
          {'key': 'personaLocation', 'label': 'Location', 'hint': 'Enter location', 'maxLines': 1},
          {'key': 'personaIncome', 'label': 'Income', 'hint': 'Enter income level', 'maxLines': 1},
          {'key': 'personaGoal', 'label': 'Goal', 'hint': 'Enter main goal', 'maxLines': 1},
          {
            'key': 'personaFrustration',
            'label': 'Frustration',
            'hint': 'Enter main frustration',
            'maxLines': 1,
          },
          {'key': 'personaLifestyle', 'label': 'Lifestyle', 'hint': 'Enter lifestyle', 'maxLines': 1},
          {
            'key': 'personaResearchPlatform',
            'label': 'Research Platform',
            'hint': 'Enter primary platform',
            'maxLines': 1,
          },
          {
            'key': 'personaPurchaseTrigger',
            'label': 'Purchase Trigger',
            'hint': 'Enter primary trigger',
            'maxLines': 1,
          },
          {'key': 'personaObjection', 'label': 'Objection', 'hint': 'Enter top objection', 'maxLines': 1},
        ],
      },
      {
        'type': 'content',
        'module': 'Progress Check',
        'title': 'Targeting Clarity Test',
        'content': 'Can you answer instantly:',
        'bullets': [
          'Where do they hang out online?',
          'What headline grabs them?',
          'What offer converts them?',
          'What stops them from buying?',
          'If yes, you now have buyer clarity.',
        ],
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion & Outcome',
        'content': 'After completing this course, you now have:',
        'bullets': [
          'Clear demographic profile',
          'Deep psychological insight',
          'Buying behaviour understanding',
          'Objection handling strategy',
          'Messaging clarity',
          'Ready-to-use customer persona',
          'You now know who to target, how to speak to them, where to find them, how to convert them, and why they might hesitate.',
          'This becomes the foundation of marketing, sales, product development, advertising, and content strategy.',
        ],
      },
    ];
  }

  void _toggleSelection(String pageKey, String item) {
    setState(() {
      if (!_selectedItems.containsKey(pageKey)) {
        _selectedItems[pageKey] = <String>{};
      }
      if (_selectedItems[pageKey]!.contains(item)) {
        _selectedItems[pageKey]!.remove(item);
      } else {
        _selectedItems[pageKey]!.add(item);
      }
    });
  }

  bool _isSelected(String pageKey, String item) {
    return _selectedItems[pageKey]?.contains(item) ?? false;
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
          'Ideal Customer Profile',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                return _buildPage(_pages[index], index);
              },
            ),
          ),
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
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    label: const Text('Previous', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                if (_currentPage < _pages.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(Icons.arrow_forward, color: Colors.black),
                    label: const Text('Next', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.check, color: Colors.black),
                    label: const Text('Complete', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> pageData, int pageIndex) {
    final String type = pageData['type'] ?? 'content';
    final String pageKey = 'page_$pageIndex';

    if (type == 'selectable') {
      return _buildSelectablePage(pageData, pageKey);
    }
    if (type == 'content_editable') {
      return _buildContentEditablePage(pageData);
    }
    return _buildContentPage(pageData);
  }

  Widget _shell({required Widget child}) {
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
          child: child,
        ),
      ),
    );
  }

  Widget _titleBlock(String title) {
    return Container(
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
        title,
        style: TextStyle(
          color: AppColors.accentColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildContentPage(Map<String, dynamic> pageData) {
    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 24),
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
                  ...(pageData['bullets'] as List<String>).map<Widget>(
                    (bullet) => Padding(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContentEditablePage(Map<String, dynamic> pageData) {
    final editableFields =
        (pageData['editableFields'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 24),
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
                  ...(pageData['bullets'] as List<String>).map<Widget>(
                    (bullet) => Padding(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (editableFields.isNotEmpty) ...[
            const SizedBox(height: 32),
            ...editableFields.map<Widget>((field) {
              final key = field['key'] as String;
              final controller = _textControllers[key]!;
              final maxLines = (field['maxLines'] as int?) ?? 1;

              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  controller: controller,
                  maxLines: maxLines,
                  minLines: maxLines == 1 ? 1 : 2,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: field['label'] as String? ?? 'Field',
                    hintText: field['hint'] as String? ?? 'Enter your answer...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    labelStyle: TextStyle(color: AppColors.accentColor),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.accentColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.accentColor.withValues(alpha: 0.5),
                      ),
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
    );
  }

  Widget _buildSelectablePage(Map<String, dynamic> pageData, String pageKey) {
    final items = (pageData['items'] as List<dynamic>?)?.cast<String>() ?? [];

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 24),
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
          if (items.isNotEmpty)
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
                children: items.map<Widget>((item) {
                  final isSelected = _isSelected(pageKey, item);
                  return InkWell(
                    onTap: () => _toggleSelection(pageKey, item),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.accentColor.withValues(alpha: 0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.accentColor
                              : AppColors.accentColor.withValues(alpha: 0.3),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                              color: isSelected
                                  ? AppColors.accentColor
                                  : Colors.transparent,
                            ),
                            child: isSelected
                                ? const Icon(Icons.check, color: Colors.black, size: 16)
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
