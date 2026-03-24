import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MarketingPlanCourseScreen extends StatefulWidget {
  const MarketingPlanCourseScreen({super.key});

  @override
  State<MarketingPlanCourseScreen> createState() =>
      _MarketingPlanCourseScreenState();
}

class _MarketingPlanCourseScreenState extends State<MarketingPlanCourseScreen> {
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
      'objectivePart1',
      'objectivePart2',
      'primaryChannel',
      'secondaryChannel',
      'valueTopic',
      'trustTopic',
      'offerTopic',
      'kpi1',
      'kpi2',
      'kpi3',
      'actionObjective',
      'actionChannels',
      'actionPosts',
      'actionKpis',
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
        'module': 'Module 1: Marketing Objectives',
        'title': 'Why Marketing Objectives Matter',
        'content': 'Without an objective:',
        'bullets': [
          'You post but don\'t grow',
          'You spend money but don\'t convert',
          'You confuse activity with progress',
        ],
        'footer': 'A marketing objective answers: "What must marketing achieve for my business in the next 90 days?"',
      },
      {
        'type': 'content_editable',
        'module': 'Define Your Primary Marketing Objective',
        'title': 'Define Your Primary Marketing Objective',
        'content':
            'Choose ONE main objective:\n• Brand awareness (people must know you exist)\n• Lead generation (collect emails, enquiries, DMs)\n• Sales conversion (turn attention into revenue)\n• Retention (keep existing customers engaged)\n\nActivity: Objective Builder — Complete this sentence:',
        'bullets': null,
        'editableFields': [
          {
            'key': 'objectivePart1',
            'label': 'In the next 90 days, my marketing objective is to ___',
            'hint': 'e.g. Generate 100 qualified leads',
            'maxLines': 2,
          },
          {
            'key': 'objectivePart2',
            'label': 'for ___',
            'hint': 'e.g. my cleaning business',
            'maxLines': 2,
          },
        ],
        'footer': 'Example: Generate 100 qualified leads for my cleaning business.',
      },
      {
        'type': 'table',
        'module': 'Align Objective With Business Stage',
        'title': 'Align Objective With Business Stage',
        'rows': [
          ['Business Stage', 'Best Marketing Objective'],
          ['New idea', 'Awareness'],
          ['Early revenue', 'Leads'],
          ['Stable sales', 'Conversions'],
          ['Repeat customers', 'Retention'],
        ],
        'footer': 'Quick Check: If your business is under 12 months old → Awareness or Leads is usually best.',
      },
      {
        'type': 'content',
        'module': 'Module 2: Channel Selection Logic',
        'title': 'Stop Trying to Be Everywhere',
        'content': 'Most businesses fail because they:',
        'bullets': [
          'Use too many platforms',
          'Use the wrong platforms',
          'Copy big brands without resources',
        ],
        'footer': 'Rule: Be excellent on 1–2 channels, not average on 5.',
      },
      {
        'type': 'table',
        'module': 'Channel Options Explained',
        'title': 'Channel Options Explained',
        'rows': [
          ['Channel', 'Best For'],
          ['Instagram', 'Visual brands, lifestyle, services'],
          ['Facebook', 'Community, local businesses'],
          ['TikTok', 'Discovery, fast growth'],
          ['WhatsApp', 'Conversions, trust'],
          ['Email', 'Retention, repeat sales'],
          ['Website', 'Credibility & conversions'],
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Choose Your Core Channels',
        'title': 'Choose Your Core Channels',
        'content':
            'Activity: Channel Selection — Answer honestly:\n• Where does my ideal customer spend time?\n• Where can I be consistent?\n• Where do people already ask about my service?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'primaryChannel',
            'label': 'Primary Channel',
            'hint': 'e.g. Instagram',
            'maxLines': 1,
          },
          {
            'key': 'secondaryChannel',
            'label': 'Secondary Channel',
            'hint': 'e.g. WhatsApp',
            'maxLines': 1,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Module 3: Content Cadence Planning',
        'title': 'What Is Content Cadence?',
        'content':
            'Content cadence = how often you show up, not how perfect you are.',
        'bullets': null,
        'footer': 'Consistency beats quality at the beginning.',
      },
      {
        'type': 'content',
        'module': 'Simple Weekly Content Framework',
        'title': 'Simple Weekly Content Framework',
        'content': 'Use the 3-Post Rule:',
        'bullets': [
          '1 Value post (teach / help)',
          '1 Trust post (story / proof)',
          '1 Offer post (sell / invite)',
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Build Your Weekly Plan',
        'title': 'Build Your Weekly Plan',
        'content': 'Activity: Content Planner',
        'bullets': null,
        'editableFields': [
          {
            'key': 'valueTopic',
            'label': 'Value post topic',
            'hint': 'e.g. "3 mistakes people make when choosing a cleaner"',
            'maxLines': 2,
          },
          {
            'key': 'trustTopic',
            'label': 'Trust post topic',
            'hint': 'e.g. Client testimonial',
            'maxLines': 2,
          },
          {
            'key': 'offerTopic',
            'label': 'Offer post topic',
            'hint': 'e.g. Booking link',
            'maxLines': 2,
          },
        ],
        'footer': 'Example: Value: "3 mistakes..." • Trust: Client testimonial • Offer: Booking link',
      },
      {
        'type': 'content',
        'module': 'Repurposing for Efficiency',
        'title': 'Repurposing for Efficiency',
        'content': 'One idea → multiple formats:',
        'bullets': [
          'Video → short clip',
          'Post → WhatsApp broadcast',
          'Answer → FAQ highlight',
        ],
        'footer': 'Goal: Work smarter, not harder.',
      },
      {
        'type': 'content',
        'module': 'Module 4: KPI Basics (Track What Matters)',
        'title': 'What Are KPIs?',
        'content':
            'KPIs = Key Performance Indicators\n\nThey tell you: What\'s working • What\'s not • What to improve',
        'bullets': null,
        'footer': 'Marketing without KPIs = guessing.',
      },
      {
        'type': 'table',
        'module': 'Core Marketing KPIs Explained',
        'title': 'Core Marketing KPIs Explained',
        'rows': [
          ['KPI', 'What It Means'],
          ['Traffic', 'How many people see you'],
          ['Leads', 'How many people show interest'],
          ['Engagement', 'How people interact'],
          ['Sales', 'Revenue generated'],
        ],
      },
      {
        'type': 'table',
        'module': 'KPI Examples by Objective',
        'title': 'KPI Examples by Objective',
        'rows': [
          ['Objective', 'Main KPI'],
          ['Awareness', 'Reach, views'],
          ['Leads', 'DMs, form fills'],
          ['Sales', 'Conversions'],
          ['Retention', 'Repeat purchases'],
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Choose Your 3 KPIs',
        'title': 'Choose Your 3 KPIs',
        'content': 'Activity: KPI Selection — Write down only 3 KPIs:',
        'bullets': null,
        'editableFields': [
          {'key': 'kpi1', 'label': 'KPI 1', 'hint': 'e.g. Reach', 'maxLines': 1},
          {'key': 'kpi2', 'label': 'KPI 2', 'hint': 'e.g. DMs', 'maxLines': 1},
          {'key': 'kpi3', 'label': 'KPI 3', 'hint': 'e.g. Conversions', 'maxLines': 1},
        ],
        'footer': 'Rule: If you track too many, you track none.',
      },
      {
        'type': 'content',
        'module': 'Module 5: Simple Marketing Dashboard',
        'title': 'What Is a Marketing Dashboard?',
        'content':
            'A dashboard is a monthly snapshot of your marketing performance.\n\nIt helps you answer: "Is my marketing moving the business forward?"',
        'bullets': null,
      },
      {
        'type': 'table',
        'module': 'Simple Dashboard Template',
        'title': 'Simple Dashboard Template',
        'content': 'Users can build this in: Google Sheets • Notion • Notes app',
        'rows': [
          ['KPI', 'Last Month', 'This Month'],
          ['Traffic', '', ''],
          ['Leads', '', ''],
          ['Sales', '', ''],
        ],
      },
      {
        'type': 'content',
        'module': 'How Often to Review KPIs',
        'title': 'How Often to Review KPIs',
        'content': null,
        'bullets': [
          'Weekly: Check engagement',
          'Monthly: Review KPIs',
          'Quarterly: Adjust strategy',
        ],
        'footer': 'Do not react daily. Marketing needs time.',
      },
      {
        'type': 'content',
        'module': 'Module 6: Optimisation & Decision-Making',
        'title': 'Reading Your Results',
        'content': 'Ask:',
        'bullets': [
          'What improved?',
          'What stayed the same?',
          'What declined?',
        ],
      },
      {
        'type': 'content',
        'module': 'What to Adjust (Not Everything)',
        'title': 'What to Adjust (Not Everything)',
        'content': 'Change one thing at a time:',
        'bullets': [
          'Content topic',
          'Posting time',
          'Offer wording',
          'Channel focus',
        ],
      },
      {
        'type': 'content',
        'module': 'Avoid These Common Mistakes',
        'title': 'Avoid These Common Mistakes',
        'content': null,
        'bullets': [
          'Quitting too early',
          'Copying trends blindly',
          'Posting without tracking',
          'Expecting instant results',
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Final Practical Exercise',
        'title': 'Your 30-Day Marketing Action Plan',
        'content': 'Activity: Complete This',
        'bullets': null,
        'editableFields': [
          {
            'key': 'actionObjective',
            'label': 'Objective',
            'hint': 'e.g. Generate 50 leads',
            'maxLines': 2,
          },
          {
            'key': 'actionChannels',
            'label': 'Channels',
            'hint': 'e.g. Instagram, WhatsApp',
            'maxLines': 1,
          },
          {
            'key': 'actionPosts',
            'label': 'Weekly posts',
            'hint': 'e.g. 3 per week',
            'maxLines': 1,
          },
          {
            'key': 'actionKpis',
            'label': 'KPIs tracked',
            'hint': 'e.g. Reach, DMs, Conversions',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Final Outcome Summary',
        'title': 'Final Outcome Summary',
        'content': 'By completing this course, you now have:',
        'bullets': [
          'A clear marketing objective',
          'Focused channel strategy',
          'A repeatable content system',
          'A KPI dashboard',
          'Data-driven decision-making ability',
        ],
      },
      {
        'type': 'content',
        'module': 'What Comes Next',
        'title': 'What Comes Next',
        'content': 'Next logical courses:',
        'bullets': [
          'Sales Funnel Setup',
          'Paid Ads Basics',
          'Conversion Optimisation',
          'Customer Retention Systems',
        ],
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion Statement',
        'content':
            '"I no longer market randomly.\nI market with intention, structure, and measurement."',
        'bullets': null,
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
          'Simple Marketing Plan',
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
    if (type == 'table') return _buildTablePage(pageData);
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

  Widget _buildTablePage(Map<String, dynamic> pageData) {
    final rows = (pageData['rows'] as List<dynamic>?)?.cast<List<String>>() ?? [];
    final content = pageData['content'] as String?;
    final footer = pageData['footer'] as String?;

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Table'),
          if (content != null && content.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              border: TableBorder.all(
                color: AppColors.accentColor.withValues(alpha: 0.4),
                width: 1,
              ),
              defaultColumnWidth: const IntrinsicColumnWidth(),
              children: rows.asMap().entries.map<TableRow>((entry) {
                final cells = entry.value;
                final isHeader = entry.key == 0;
                return TableRow(
                  decoration: BoxDecoration(
                    color: isHeader
                        ? AppColors.accentColor.withValues(alpha: 0.3)
                        : entry.key.isEven
                            ? AppColors.backgroundColor.withValues(alpha: 0.5)
                            : null,
                  ),
                  children: cells.map<Widget>((cell) => TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        cell,
                        style: TextStyle(
                          color: isHeader ? Colors.black : Colors.white,
                          fontSize: isHeader ? 14 : 13,
                          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  )).toList(),
                );
              }).toList(),
            ),
          ),
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
