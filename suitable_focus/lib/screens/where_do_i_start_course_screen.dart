import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class WhereDoIStartCourseScreen extends StatefulWidget {
  const WhereDoIStartCourseScreen({super.key});

  @override
  State<WhereDoIStartCourseScreen> createState() => _WhereDoIStartCourseScreenState();
}

class _WhereDoIStartCourseScreenState extends State<WhereDoIStartCourseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Track selected items for each section
  final Map<String, Set<String>> _selectedItems = {};
  
  // Text controllers for editable fields
  final Map<String, TextEditingController> _textControllers = {};
  
  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }
  
  void _initializeControllers() {
    // Initialize controllers for editable fields on pages 14, 21, 24, 25, 28, 30
    _textControllers['brandVoice'] = TextEditingController();
    _textControllers['bioPositioning'] = TextEditingController();
    _textControllers['visionPurpose'] = TextEditingController();
    _textControllers['missionStatement'] = TextEditingController();
    _textControllers['revenueTarget'] = TextEditingController();
    _textControllers['teamSize'] = TextEditingController();
    _textControllers['marketExpansion'] = TextEditingController();
    _textControllers['productExpansion'] = TextEditingController();
    _textControllers['businessRegisteredAs'] = TextEditingController();
    _textControllers['bankingStructure'] = TextEditingController();
    _textControllers['brandVoiceFinal'] = TextEditingController();
    _textControllers['primaryPlatform'] = TextEditingController();
    _textControllers['missionFinal'] = TextEditingController();
    _textControllers['threeYearAim'] = TextEditingController();
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // Course content structure for "Where Do I Start?"
  // 30 pages - A 60-90 Day Business Setup Roadmap
  List<Map<String, dynamic>> get _pages {
    return [
      // PAGE 1 - Course Introduction
      {
        'type': 'content',
        'module': 'Introduction',
        'title': 'Course Introduction',
        'content': 'Give you a practical 60-90 day roadmap to legally and strategically set up your business.',
        'bullets': [
          'Registered business clarity',
          'Banking structure',
          'Brand identity foundation',
          'Online presence setup',
          'Mission, values & 3-year direction'
        ],
      },
      
      // PAGE 2 - Your 90-Day Roadmap Overview
      {
        'type': 'content',
        'module': 'Roadmap',
        'title': 'Your 90-Day Roadmap Overview',
        'content': 'Your business setup journey is divided into three phases:',
        'bullets': [
          'Phase 1 (Days 1-30): Legal & Structure',
          'Phase 2 (Days 31-60): Financial & Brand Setup',
          'Phase 3 (Days 61-90): Online Presence & Positioning'
        ],
      },
      
      // PAGE 3 - Business Registration Overview
      {
        'type': 'content',
        'module': 'Phase 1: Legal & Structure',
        'title': 'Business Registration Overview',
        'content': 'Why Register?',
        'bullets': [
          'Legal protection',
          'Business bank account access',
          'Credibility',
          'Access to funding'
        ],
      },
      
      // PAGE 4 - Entity Type Options
      {
        'type': 'content',
        'module': 'Phase 1: Legal & Structure',
        'title': 'Entity Type Options',
        'content': 'Common Entity Types:',
        'bullets': [
          'Sole Proprietorship - Simple, Low cost, Full personal liability',
          'Private Company (Pty Ltd) - Separate legal entity, Limited liability, More formal',
          'Partnership - Shared ownership, Shared liability'
        ],
      },
      
      // PAGE 5 - Estimated Registration Costs
      {
        'type': 'content',
        'module': 'Phase 1: Legal & Structure',
        'title': 'Estimated Registration Costs',
        'content': 'Registration costs vary by country and entity type. Key items to consider:',
        'bullets': [
          'Name Reservation - Moderate cost',
          'Registration Filing - Moderate cost',
          'Tax Registration - Usually free',
          'Professional Assistance - Optional'
        ],
      },
      
      // PAGE 6 - Required Documentation Checklist (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 1: Legal & Structure',
        'title': 'Required Documentation Checklist',
        'content': 'Ensure you have all required documents ready:',
        'items': [
          'ID Document',
          'Proof of Address',
          'Company Name Options',
          'Director Information',
          'Memorandum of Incorporation (if required)'
        ],
      },
      
      // PAGE 7 - Banking Setup Overview
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Banking Setup Overview',
        'content': 'Why Separate Business Banking?',
        'bullets': [
          'Clean financial records',
          'Tax compliance',
          'Professionalism'
        ],
      },
      
      // PAGE 8 - Banking Setup Considerations
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Banking Setup Considerations',
        'content': 'Questions to Ask:',
        'bullets': [
          'Monthly account fee?',
          'Transaction fees?',
          'Online banking included?',
          'Card machine integration?',
          'International payment support?'
        ],
      },
      
      // PAGE 9 - Monthly Fees Comparison Grid
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Monthly Fees Comparison Grid',
        'content': 'Compare different banking options based on:',
        'bullets': [
          'Monthly Fee',
          'Transaction Cost',
          'Additional Features'
        ],
      },
      
      // PAGE 10 - Transaction Volume Estimate
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Transaction Volume Estimate',
        'content': 'Estimate your banking needs:',
        'bullets': [
          'How many transactions per month?',
          'Average transaction value?',
          'Expected monthly revenue?'
        ],
      },
      
      // PAGE 11 - What Features Matter Most? (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'What Features Matter Most?',
        'content': 'Select the banking features that are most important for your business:',
        'items': [
          'Low fees',
          'Easy online banking',
          'Loan access',
          'POS integration',
          'Multi-currency',
          'Mobile-first'
        ],
      },
      
      // PAGE 12 - Branding Foundations Overview
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Branding Foundations Overview',
        'content': 'Branding is NOT just a logo. It is how people feel about your business.',
        'bullets': null,
      },
      
      // PAGE 13 - Logo Basics
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Logo Basics',
        'content': 'Types of Logos:',
        'bullets': [
          'Wordmark',
          'Lettermark',
          'Symbol',
          'Combination'
        ],
      },
      
      // PAGE 14 - Brand Voice (with editable field)
      {
        'type': 'content_editable',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Brand Voice',
        'content': 'Your brand voice answers: Are you Professional? Friendly? Bold? Inspirational? Technical? Playful?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'brandVoice',
            'label': 'Our brand sounds like',
            'hint': 'Describe your brand voice...',
            'maxLines': 3,
          }
        ],
      },
      
      // PAGE 15 - Colour Psychology
      {
        'type': 'content',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Colour Psychology',
        'content': 'Colour associations:',
        'bullets': [
          'Blue - Trust',
          'Red - Energy',
          'Green - Growth',
          'Black - Premium',
          'Yellow - Optimism'
        ],
      },
      
      // PAGE 16 - Brand Consistency Checklist (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 2: Financial & Brand Setup',
        'title': 'Brand Consistency Checklist',
        'content': 'Ensure consistency across all touchpoints:',
        'items': [
          'Same logo everywhere',
          'Same colour codes',
          'Same tone',
          'Same profile image'
        ],
      },
      
      // PAGE 17 - Online Presence Essentials
      {
        'type': 'content',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Online Presence Essentials',
        'content': 'You need at minimum:',
        'bullets': [
          'One-page website',
          'Professional email',
          'Social media presence'
        ],
      },
      
      // PAGE 18 - Why a One-Page Website Matters
      {
        'type': 'content',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Why a One-Page Website Matters',
        'content': 'It should include:',
        'bullets': [
          'Headline',
          'Problem',
          'Solution',
          'About',
          'Contact',
          'Call to Action'
        ],
      },
      
      // PAGE 19 - Website Checklist (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Website Checklist',
        'content': 'Ensure your website has:',
        'items': [
          'Clear headline',
          'Contact form',
          'WhatsApp link',
          'Testimonials (if available)',
          'Mobile responsive'
        ],
      },
      
      // PAGE 20 - Social Media Profile Setup Checklist (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Social Media Profile Setup Checklist',
        'content': 'Complete your social media profiles:',
        'items': [
          'Profile photo (logo)',
          'Bio',
          'Link in bio',
          'Contact button',
          'Highlight stories'
        ],
      },
      
      // PAGE 21 - Bio & Positioning Clarity (with editable field)
      {
        'type': 'content_editable',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Bio & Positioning Clarity',
        'content': 'Formula: We help __________ achieve __________ through __________.',
        'bullets': [
          'Example: We help small businesses grow online through affordable digital tools.'
        ],
        'editableFields': [
          {
            'key': 'bioPositioning',
            'label': 'Complete the formula',
            'hint': 'We help [who] achieve [what] through [how]...',
            'maxLines': 3,
          }
        ],
      },
      
      // PAGE 22 - Platform Strategy (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Platform Strategy',
        'content': 'Choose your Primary Platform based on where your audience spends time and your content format comfort:',
        'items': [
          'Instagram',
          'LinkedIn',
          'TikTok',
          'Facebook',
          'YouTube'
        ],
      },
      
      // PAGE 23 - Content Starter Plan (30 Days)
      {
        'type': 'content',
        'module': 'Phase 3: Online Presence & Positioning',
        'title': 'Content Starter Plan (30 Days)',
        'content': 'Your 30-day content calendar:',
        'bullets': [
          'Week 1: Introduction Posts',
          'Week 2: Problem Awareness',
          'Week 3: Solution Education',
          'Week 4: Testimonials / Offer'
        ],
      },
      
      // PAGE 24 - Vision & Purpose Builder (with editable field)
      {
        'type': 'content_editable',
        'module': 'Mission & Values',
        'title': 'Vision & Purpose Builder',
        'content': 'Why does this business exist beyond money?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'visionPurpose',
            'label': 'This business exists to',
            'hint': 'Describe the purpose of your business...',
            'maxLines': 3,
          }
        ],
      },
      
      // PAGE 25 - Draft Mission Statement (with editable field)
      {
        'type': 'content_editable',
        'module': 'Mission & Values',
        'title': 'Draft Mission Statement',
        'content': 'Template: Our mission is to __________ for __________ by __________.',
        'bullets': null,
        'editableFields': [
          {
            'key': 'missionStatement',
            'label': 'Complete your mission statement',
            'hint': 'Our mission is to [what] for [who] by [how]...',
            'maxLines': 3,
          }
        ],
      },
      
      // PAGE 26 - Define Core Values (SELECTABLE)
      {
        'type': 'selectable',
        'module': 'Mission & Values',
        'title': 'Define Core Values',
        'content': 'Choose 3-5 core values that guide your business:',
        'items': [
          'Integrity',
          'Innovation',
          'Community',
          'Excellence',
          'Accessibility',
          'Sustainability',
          'Accountability'
        ],
      },
      
      // PAGE 27 - Culture & Decision Filter
      {
        'type': 'content',
        'module': 'Mission & Values',
        'title': 'Culture & Decision Filter',
        'content': 'Your values help answer:',
        'bullets': [
          'Should we take this deal?',
          'Should we partner here?',
          'Should we pivot?'
        ],
      },
      
      // PAGE 28 - 3-Year Growth Direction (with editable fields)
      {
        'type': 'content_editable',
        'module': 'Mission & Values',
        'title': '3-Year Growth Direction',
        'content': 'Answer:',
        'bullets': [
          'Revenue target?',
          'Team size?',
          'Market expansion?',
          'Product expansion?'
        ],
        'editableFields': [
          {
            'key': 'revenueTarget',
            'label': 'Revenue target',
            'hint': 'e.g., R500,000 or \$50,000',
            'maxLines': 1,
          },
          {
            'key': 'teamSize',
            'label': 'Team size',
            'hint': 'e.g., 5 employees, 10 team members',
            'maxLines': 1,
          },
          {
            'key': 'marketExpansion',
            'label': 'Market expansion',
            'hint': 'Describe your market expansion plans...',
            'maxLines': 2,
          },
          {
            'key': 'productExpansion',
            'label': 'Product expansion',
            'hint': 'Describe your product expansion plans...',
            'maxLines': 2,
          }
        ],
      },
      
      // PAGE 29 - Your 90-Day Execution Plan
      {
        'type': 'content',
        'module': 'Execution Plan',
        'title': 'Your 90-Day Execution Plan',
        'content': 'Month-by-month breakdown:',
        'bullets': [
          'Month 1: Register business, Open bank account',
          'Month 2: Design logo, Build website, Open social accounts',
          'Month 3: Launch campaign, Start sales, Track metrics'
        ],
      },
      
      // PAGE 30 - Final Output: Your Business Setup Blueprint (with editable fields)
      {
        'type': 'content_editable',
        'module': 'Course Outcome',
        'title': 'Final Output: Your Business Setup Blueprint',
        'content': 'Complete your business setup blueprint:',
        'bullets': null,
        'editableFields': [
          {
            'key': 'businessRegisteredAs',
            'label': 'My business is registered as a',
            'hint': 'e.g., Private Company (Pty Ltd), Sole Proprietorship',
            'maxLines': 1,
          },
          {
            'key': 'bankingStructure',
            'label': 'My banking structure is',
            'hint': 'Describe your banking setup...',
            'maxLines': 2,
          },
          {
            'key': 'brandVoiceFinal',
            'label': 'My brand voice is',
            'hint': 'Describe your brand voice...',
            'maxLines': 2,
          },
          {
            'key': 'primaryPlatform',
            'label': 'My primary platform is',
            'hint': 'e.g., Instagram, LinkedIn, TikTok',
            'maxLines': 1,
          },
          {
            'key': 'missionFinal',
            'label': 'My mission is',
            'hint': 'Complete your mission statement...',
            'maxLines': 3,
          },
          {
            'key': 'threeYearAim',
            'label': 'In 3 years, I aim to',
            'hint': 'Describe your 3-year goals...',
            'maxLines': 3,
          }
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
        title: Column(
          children: [
            Text(
              'WHERE DO I START?',
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
                return _buildPage(_pages[index], index);
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

  Widget _buildPage(Map<String, dynamic> pageData, int pageIndex) {
    final String type = pageData['type'] ?? 'content';
    final String pageKey = 'page_$pageIndex';
    
    if (type == 'selectable') {
      return _buildSelectablePage(pageData, pageKey);
    } else if (type == 'content_editable') {
      return _buildContentEditablePage(pageData);
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

  Widget _buildSelectablePage(Map<String, dynamic> pageData, String pageKey) {
    final List<String> items = (pageData['items'] as List<dynamic>?)?.cast<String>() ?? [];
    
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
              
              // Selectable Items
              if (items.isNotEmpty) ...[
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
                      final bool isSelected = _isSelected(pageKey, item);
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
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 16,
                                      )
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentEditablePage(Map<String, dynamic> pageData) {
    final List<Map<String, dynamic>> editableFields = 
        (pageData['editableFields'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    
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
              
              // Editable Fields
              if (editableFields.isNotEmpty) ...[
                const SizedBox(height: 32),
                ...editableFields.map<Widget>((field) {
                  final String key = field['key'] ?? '';
                  if (!_textControllers.containsKey(key)) {
                    _textControllers[key] = TextEditingController();
                  }
                  final TextEditingController controller = _textControllers[key]!;
                  final int maxLines = field['maxLines'] ?? 1;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: controller,
                      maxLines: maxLines,
                      minLines: maxLines == 1 ? 1 : 2,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        labelText: field['label'] ?? 'Field',
                        hintText: field['hint'] ?? 'Enter your answer...',
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
}

