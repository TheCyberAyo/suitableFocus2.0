import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class WhereToGoNextCourseScreen extends StatefulWidget {
  const WhereToGoNextCourseScreen({super.key});

  @override
  State<WhereToGoNextCourseScreen> createState() =>
      _WhereToGoNextCourseScreenState();
}

class _WhereToGoNextCourseScreenState extends State<WhereToGoNextCourseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Map<String, TextEditingController> _textControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    const keys = [
      'monthlyExpenses',
      'bufferTarget',
      'bottleneckAnswer',
      'biggestBottleneck',
      'strategicFocus',
      'strategicBecause',
      'priority1',
      'priority2',
      'priority3',
      'first30Days',
      'day60',
      'day90',
      'distraction1',
      'distraction2',
      'distraction3',
      'disciplineCommitment',
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
        'module': 'Welcome — This Is Your Pivot Point',
        'title': 'Welcome — This Is Your Pivot Point',
        'content':
            'You\'ve: Built foundations • Clarified your customer • Set up marketing • Established compliance • Created structure\n\nNow the real question is: What should you focus on next?',
        'bullets': [
          'This course helps you avoid: Random growth decisions',
          'Shiny object distractions',
          'Scaling too early',
          'Stagnating too long',
        ],
      },
      {
        'type': 'content',
        'module': 'Module 1: Business Health Self-Assessment',
        'title': 'Why Assess Before Scaling?',
        'content':
            'Most businesses don\'t fail from lack of effort.\nThey fail from scaling instability.\n\nGrowth without health = chaos.',
        'bullets': [
          'Before deciding your next move, you must assess: Financial health',
          'Marketing effectiveness',
          'Operational stability',
          'Customer consistency',
        ],
      },
      {
        'type': 'content',
        'module': 'Revenue Health Check',
        'title': 'Revenue Health Check',
        'content': 'Answer honestly:',
        'bullets': [
          'Is revenue consistent monthly?',
          'Do I know my average monthly income?',
          'Is at least 60% of income predictable?',
          'Are expenses controlled?',
          'Am I profitable?',
        ],
        'footer': 'Scoring: 0–2 YES → Fragile | 3–4 YES → Stable | 5 YES → Strong',
      },
      {
        'type': 'content_editable',
        'module': 'Cash Flow Stability Test',
        'title': 'Cash Flow Stability Test',
        'content':
            'Ask: Can I cover 3 months of business expenses? • Do I have a financial buffer? • Do I rely on one major client? • Are payments received on time?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'monthlyExpenses',
            'label': 'Write your monthly business expenses (R)',
            'hint': 'e.g. 45000',
            'maxLines': 1,
          },
          {
            'key': 'bufferTarget',
            'label': '3 months buffer target (R)',
            'hint': 'e.g. 135000',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Marketing Health Check',
        'title': 'Marketing Health Check',
        'content': 'Evaluate:',
        'bullets': [
          'Do I generate leads weekly?',
          'Do I know my conversion rate?',
          'Do I track KPIs monthly?',
          'Do customers find me organically?',
          'Is content consistent?',
        ],
        'footer': 'Score yourself again (Fragile / Stable / Strong).',
      },
      {
        'type': 'content',
        'module': 'Operational Stability Check',
        'title': 'Operational Stability Check',
        'content': 'Ask:',
        'bullets': [
          'Are processes documented?',
          'Could someone else fulfill orders?',
          'Is delivery consistent?',
          'Are systems automated?',
          'Is customer service smooth?',
        ],
      },
      {
        'type': 'content',
        'module': 'Overall Business Health Score',
        'title': 'Overall Business Health Score',
        'content': 'Add all section scores.',
        'bullets': [
          'Mostly "Fragile" → Stabilise first',
          'Mostly "Stable" → Optimise',
          'Mostly "Strong" → Prepare to scale',
        ],
      },
      {
        'type': 'content',
        'module': 'Module 2: Growth Bottleneck Identification',
        'title': 'What Is a Bottleneck?',
        'content':
            'A bottleneck is the ONE thing restricting growth.\n\nIt is rarely everything.',
        'bullets': [
          'Growth improves when you fix: The constraint',
          'Not the symptoms',
        ],
      },
      {
        'type': 'content',
        'module': 'Common Business Bottlenecks',
        'title': 'Common Business Bottlenecks',
        'content': null,
        'bullets': [
          'Not enough leads',
          'Poor conversion',
          'Weak pricing',
          'Operational overload',
          'Founder burnout',
          'Cash flow instability',
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Bottleneck Identification Exercise',
        'title': 'Bottleneck Identification Exercise',
        'content': 'Answer: If I doubled my leads tomorrow, what would break first?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'bottleneckAnswer',
            'label': 'Write your answer',
            'hint': 'e.g. Delivery capacity, customer service',
            'maxLines': 3,
          },
        ],
        'footer': 'That is likely your bottleneck.',
      },
      {
        'type': 'content',
        'module': 'Revenue Bottleneck Example',
        'title': 'Revenue Bottleneck Example',
        'content': 'Problem: Low revenue.\n\nRoot causes might be:',
        'bullets': [
          'Traffic too low',
          'Conversion too weak',
          'Pricing too low',
          'Offer unclear',
        ],
        'footer': 'Fix the real problem — not the emotional one.',
      },
      {
        'type': 'content',
        'module': 'Marketing Bottleneck Example',
        'title': 'Marketing Bottleneck Example',
        'content': 'You\'re posting but not growing.\n\nPossible bottlenecks:',
        'bullets': [
          'Wrong audience',
          'Weak messaging',
          'Inconsistent cadence',
          'No call to action',
        ],
      },
      {
        'type': 'content',
        'module': 'Operational Bottleneck Example',
        'title': 'Operational Bottleneck Example',
        'content': 'You have demand but: Deliver late • Quality drops • Burn out • No systems',
        'bullets': null,
        'footer': 'Scaling now would collapse the business.',
      },
      {
        'type': 'content_editable',
        'module': 'Choose ONE Bottleneck',
        'title': 'Choose ONE Bottleneck — Activity',
        'content': null,
        'editableFields': [
          {
            'key': 'biggestBottleneck',
            'label': 'My current biggest growth bottleneck is',
            'hint': 'e.g. Not enough leads',
            'maxLines': 3,
          },
        ],
        'footer': 'For the next 30 days, I will focus only on improving this.',
      },
      {
        'type': 'content',
        'module': 'Module 3: Scaling Readiness Questions',
        'title': 'What Does Scaling Actually Mean?',
        'content': 'Scaling is not just making more money.\n\nIt means:',
        'bullets': [
          'Increasing revenue',
          'Without proportionally increasing workload',
          'While maintaining quality',
        ],
      },
      {
        'type': 'content',
        'module': 'Scaling Readiness Question 1',
        'title': 'Is Demand Proven?',
        'content': null,
        'bullets': [
          'Do customers buy repeatedly?',
          'Is there consistent interest?',
          'Is word-of-mouth happening?',
        ],
        'footer': 'If not → Focus on validation first.',
      },
      {
        'type': 'content',
        'module': 'Scaling Readiness Question 2',
        'title': 'Is Profit Margin Healthy?',
        'content': 'If margins are thin: Scaling multiplies problems.',
        'bullets': null,
        'footer': 'Minimum recommended: 20–30% margin before scaling.',
      },
      {
        'type': 'content',
        'module': 'Scaling Readiness Question 3',
        'title': 'Are Systems in Place?',
        'content': null,
        'bullets': [
          'CRM?',
          'Accounting structure?',
          'Marketing system?',
          'Delivery process?',
        ],
        'footer': 'If growth depends only on you — you\'re not ready to scale.',
      },
      {
        'type': 'content',
        'module': 'Scaling Readiness Question 4',
        'title': 'Could Someone Else Step In?',
        'content': 'Ask: If I step away for 2 weeks — Does revenue stop? • Do operations collapse?',
        'bullets': null,
        'footer': 'If yes → Build systems before growth.',
      },
      {
        'type': 'content',
        'module': 'Scaling Readiness Question 5',
        'title': 'Is Compliance in Place?',
        'content': null,
        'bullets': [
          'Tax compliant?',
          'Financial records updated?',
          'Data protection handled?',
        ],
        'footer': 'Scaling increases visibility — and scrutiny.',
      },
      {
        'type': 'content',
        'module': 'Module 4: Your Next 90-Day Strategic Direction',
        'title': 'Choose Your Strategic Focus',
        'content': 'Based on your assessment, choose one:',
        'bullets': [
          'Stabilise',
          'Optimise',
          'Scale',
        ],
      },
      {
        'type': 'content',
        'module': 'If You Chose "Stabilise"',
        'title': 'If You Chose "Stabilise"',
        'content': 'Focus areas: Consistent revenue • Marketing clarity • Expense control • System setup',
        'bullets': null,
        'footer': '90-day goal: Predictable income.',
      },
      {
        'type': 'content',
        'module': 'If You Chose "Optimise"',
        'title': 'If You Chose "Optimise"',
        'content': 'Focus areas: Improve conversion • Increase pricing • Improve margins • Streamline operations',
        'bullets': null,
        'footer': '90-day goal: Higher profitability without chaos.',
      },
      {
        'type': 'content',
        'module': 'If You Chose "Scale"',
        'title': 'If You Chose "Scale"',
        'content': 'Focus areas: Hire support • Paid advertising • Expand channels • Partnerships',
        'bullets': null,
        'footer': '90-day goal: Controlled growth.',
      },
      {
        'type': 'content_editable',
        'module': 'Final Strategic Action Plan',
        'title': 'Complete This Statement',
        'content': null,
        'editableFields': [
          {
            'key': 'strategicFocus',
            'label': 'Over the next 90 days, my strategic focus is',
            'hint': 'e.g. Stabilise revenue',
            'maxLines': 2,
          },
          {
            'key': 'strategicBecause',
            'label': 'Because',
            'hint': 'e.g. My health score was mostly Fragile',
            'maxLines': 3,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Define 3 Key Priorities',
        'title': 'Define 3 Key Priorities',
        'content': null,
        'editableFields': [
          {'key': 'priority1', 'label': 'Priority 1', 'hint': 'e.g. Fix lead generation', 'maxLines': 2},
          {'key': 'priority2', 'label': 'Priority 2', 'hint': 'e.g. Document delivery process', 'maxLines': 2},
          {'key': 'priority3', 'label': 'Priority 3', 'hint': 'e.g. Improve conversion rate', 'maxLines': 2},
        ],
      },
      {
        'type': 'content_editable',
        'module': '30-60-90 Day Breakdown',
        'title': '30-60-90 Day Breakdown',
        'content': null,
        'editableFields': [
          {
            'key': 'first30Days',
            'label': 'First 30 Days',
            'hint': 'e.g. Launch lead magnet, set up CRM',
            'maxLines': 3,
          },
          {
            'key': 'day60',
            'label': '60 Days',
            'hint': 'e.g. 10 qualified leads per week',
            'maxLines': 3,
          },
          {
            'key': 'day90',
            'label': '90 Days',
            'hint': 'e.g. Predictable R80k revenue',
            'maxLines': 3,
          },
        ],
      },
      {
        'type': 'content_editable',
        'module': 'What You Will NOT Do',
        'title': 'What You Will NOT Do',
        'content': 'Strategic clarity requires elimination.\n\nList 3 distractions you will avoid:',
        'bullets': null,
        'editableFields': [
          {'key': 'distraction1', 'label': 'Distraction 1', 'hint': 'e.g. New course launches', 'maxLines': 1},
          {'key': 'distraction2', 'label': 'Distraction 2', 'hint': 'e.g. New social platform', 'maxLines': 1},
          {'key': 'distraction3', 'label': 'Distraction 3', 'hint': 'e.g. Expanding product line', 'maxLines': 1},
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Your Growth Discipline Rule',
        'title': 'Your Growth Discipline Rule',
        'content':
            'Growth requires: Focus • Patience • Measured execution\n\nWrite your commitment:',
        'bullets': null,
        'editableFields': [
          {
            'key': 'disciplineCommitment',
            'label': 'I will focus on ___ for the next 90 days without switching strategies',
            'hint': 'e.g. stabilising revenue and fixing lead gen',
            'maxLines': 3,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Completion',
        'title': 'Strategic Clarity Achieved',
        'content': 'You now have:',
        'bullets': [
          'A business health score',
          'Identified growth bottleneck',
          'Scaling readiness clarity',
          'A focused 90-day direction',
          'Defined execution plan',
        ],
        'footer': 'This is how real businesses grow: Not by doing more — but by doing the right next thing.',
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
        title: Text(
          'Where to Go Next',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 14,
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
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) => _buildPage(_pages[index]),
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

  Widget _buildPage(Map<String, dynamic> pageData) {
    final type = pageData['type'] ?? 'content';
    if (type == 'content_editable') return _buildContentEditablePage(pageData);
    return _buildContentPage(pageData);
  }

  Widget _shell({required Widget child}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(24.0),
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
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildContentPage(Map<String, dynamic> pageData) {
    final content = pageData['content'] as String?;
    final bulletsRaw = pageData['bullets'];
    final bullets = (bulletsRaw is List && bulletsRaw.isNotEmpty)
        ? (bulletsRaw).cast<String>()
        : <String>[];
    final footer = pageData['footer'] as String?;

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 20),
          if (content != null && content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.7,
                letterSpacing: 0.3,
              ),
            ),
          if (bullets.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
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
                children: bullets.map<Widget>((bullet) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
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
                            fontSize: 15,
                            height: 1.6,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
          if (footer != null && footer.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.accentColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                footer,
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContentEditablePage(Map<String, dynamic> pageData) {
    final editableFields = (pageData['editableFields'] as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ??
        [];
    final content = pageData['content'] as String?;
    final footer = pageData['footer'] as String?;

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 20),
          if (content != null && content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.7,
                letterSpacing: 0.3,
              ),
            ),
          if (editableFields.isNotEmpty) ...[
            const SizedBox(height: 24),
            ...editableFields.map<Widget>((field) {
              final key = field['key'] as String;
              final controller = _textControllers[key]!;
              final maxLines = (field['maxLines'] as int?) ?? 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: controller,
                  maxLines: maxLines,
                  minLines: maxLines == 1 ? 1 : 2,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
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
          if (footer != null && footer.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.accentColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                footer,
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
