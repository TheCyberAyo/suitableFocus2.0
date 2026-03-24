import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class PartnershipsCourseScreen extends StatefulWidget {
  const PartnershipsCourseScreen({super.key});

  @override
  State<PartnershipsCourseScreen> createState() =>
      _PartnershipsCourseScreenState();
}

class _PartnershipsCourseScreenState extends State<PartnershipsCourseScreen> {
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
      'partnerCategory1',
      'partnerCategory2',
      'partnerCategory3',
      'asset1',
      'asset2',
      'asset3',
      'relationshipFocus',
      'targetBrands',
      'valueAssets',
      'outreachSequence',
      'ninetyDayGoal',
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
        'module': 'Welcome to Strategic Growth',
        'title': 'Welcome to Strategic Growth',
        'content':
            'Revenue does not only come from customers.\nIt also comes from relationships.\n\nThis course will help you:',
        'bullets': [
          'Understand the difference between partnerships, collaborations & sponsorships',
          'Identify aligned brands',
          'Build a value exchange framework',
          'Create a structured outreach sequence',
          'Develop a repeatable relationship strategy',
        ],
      },
      {
        'type': 'content',
        'module': 'Why Strategic Relationships Matter',
        'title': 'Why Strategic Relationships Matter',
        'content': 'Strategic relationships can:',
        'bullets': [
          'Reduce marketing costs',
          'Expand reach instantly',
          'Increase credibility',
          'Open new revenue streams',
          'Accelerate growth',
        ],
        'footer': 'Smart founders grow through leverage, not just effort.',
      },
      {
        'type': 'content',
        'module': 'Partnership vs Collaboration vs Sponsorship',
        'title': 'Partnership vs Collaboration vs Sponsorship',
        'content': 'Understanding the differences prevents weak proposals.',
        'bullets': null,
      },
      {
        'type': 'content',
        'module': 'What Is a Partnership?',
        'title': 'What Is a Partnership?',
        'content':
            'A Partnership is:\n\nA long-term strategic relationship where two entities share resources, audiences, or revenue.',
        'bullets': [
          'Ongoing',
          'Shared goals',
          'Revenue or equity involvement',
          'Strategic integration',
        ],
        'footer': 'Example: Two businesses bundle services together and share revenue.',
      },
      {
        'type': 'content',
        'module': 'What Is a Collaboration?',
        'title': 'What Is a Collaboration?',
        'content':
            'A Collaboration is:\n\nA short-term project-based relationship.',
        'bullets': [
          'Campaign-based',
          'Event-based',
          'Limited duration',
          'Audience cross-promotion',
        ],
        'footer': 'Example: Joint webinar, co-hosted live session, or limited campaign.',
      },
      {
        'type': 'content',
        'module': 'What Is a Sponsorship?',
        'title': 'What Is a Sponsorship?',
        'content':
            'A Sponsorship is:\n\nA financial or resource-based support agreement in exchange for visibility or brand exposure.',
        'bullets': [
          'Payment or product exchange',
          'Brand exposure focus',
          'Defined deliverables',
          'Measurable visibility',
        ],
        'footer': 'Example: Brand pays to be featured at your event or in your app.',
      },
      {
        'type': 'table',
        'module': 'Quick Comparison Table',
        'title': 'Quick Comparison Table',
        'rows': [
          ['Type', 'Duration', 'Money Involved?', 'Depth', 'Goal'],
          ['Partnership', 'Long-term', 'Often', 'Deep', 'Shared growth'],
          ['Collaboration', 'Short-term', 'Not always', 'Medium', 'Campaign results'],
          ['Sponsorship', 'Fixed term', 'Yes', 'Transactional', 'Brand exposure'],
        ],
      },
      {
        'type': 'content',
        'module': 'Identifying Aligned Brands',
        'title': 'Identifying Aligned Brands',
        'content': 'Not every brand is a good fit.\n\nAlignment must include:',
        'bullets': [
          'Similar target audience',
          'Complementary product/service',
          'Shared values',
          'Comparable positioning level',
        ],
      },
      {
        'type': 'content',
        'module': 'The Alignment Filter Test',
        'title': 'The Alignment Filter Test',
        'content': 'Ask:',
        'bullets': [
          'Do we serve the same customer type?',
          'Do we solve related problems?',
          'Would our audiences trust this association?',
          'Is there brand image compatibility?',
        ],
        'footer': 'If 3/4 = YES → Potential fit.',
      },
      {
        'type': 'content_editable',
        'module': 'Ideal Partner Categories',
        'title': 'Ideal Partner Categories',
        'content': 'Examples: Complementary Service Providers, Influencers in your niche, Technology Platforms, Event Organisers, Community Leaders, Media Platforms',
        'bullets': null,
        'editableFields': [
          {'key': 'partnerCategory1', 'label': 'My ideal partner category 1', 'hint': 'e.g. Complementary Service Providers', 'maxLines': 1},
          {'key': 'partnerCategory2', 'label': 'My ideal partner category 2', 'hint': 'e.g. Technology Platforms', 'maxLines': 1},
          {'key': 'partnerCategory3', 'label': 'My ideal partner category 3', 'hint': 'e.g. Event Organisers', 'maxLines': 1},
        ],
      },
      {
        'type': 'content',
        'module': 'The Value Exchange Framework',
        'title': 'The Value Exchange Framework',
        'content':
            'Most people fail because they ask:\n"What can they give me?"\n\nInstead ask:\n"What valuable asset do I bring?"',
        'bullets': null,
      },
      {
        'type': 'content_editable',
        'module': 'Identify Your Assets',
        'title': 'Identify Your Assets',
        'content': 'You may offer: Audience size, Email list, Social media reach, Content production, Expertise, Distribution, Technology access, Event space, Credibility',
        'bullets': null,
        'editableFields': [
          {'key': 'asset1', 'label': 'My top asset 1', 'hint': 'Enter your asset', 'maxLines': 1},
          {'key': 'asset2', 'label': 'My top asset 2', 'hint': 'Enter your asset', 'maxLines': 1},
          {'key': 'asset3', 'label': 'My top asset 3', 'hint': 'Enter your asset', 'maxLines': 1},
        ],
      },
      {
        'type': 'content',
        'module': 'Build the Value Equation',
        'title': 'Build the Value Equation',
        'content':
            'Strong relationship proposals answer:\nWhat do they gain that justifies participation?\n\nFormula:\nYour Asset + Their Asset = Shared Outcome',
        'bullets': null,
        'footer': 'Example: Your audience + Their product = Increased sales for both.',
      },
      {
        'type': 'content',
        'module': 'Structuring Win-Win Proposals',
        'title': 'Structuring Win-Win Proposals',
        'content': 'A good proposal includes:',
        'bullets': [
          'Clear objective',
          'Defined roles',
          'Deliverables',
          'Timeline',
          'Success metrics',
          'Value for both sides',
        ],
        'footer': 'Never send vague partnership requests.',
      },
      {
        'type': 'content',
        'module': 'Outreach Sequencing Strategy',
        'title': 'Outreach Sequencing Strategy',
        'content':
            'Do NOT jump straight to asking.\n\nRelationships require warming.',
        'bullets': null,
      },
      {
        'type': 'content',
        'module': 'Phase 1: Visibility',
        'title': 'Phase 1: Visibility',
        'content': 'Before reaching out:',
        'bullets': [
          'Follow them',
          'Engage with content',
          'Share their work',
          'Comment thoughtfully',
        ],
        'footer': 'Goal: Become recognizable.',
      },
      {
        'type': 'content',
        'module': 'Phase 2: Soft Introduction',
        'title': 'Phase 2: Soft Introduction',
        'content':
            'Send a short message:\n• Introduce yourself\n• Mention specific admiration\n• Suggest alignment idea\n• Do NOT pitch fully yet',
        'bullets': null,
        'footer': 'Goal: Start conversation.',
      },
      {
        'type': 'content',
        'module': 'Phase 3: Strategic Proposal',
        'title': 'Phase 3: Strategic Proposal',
        'content': 'After engagement, send structured proposal including:',
        'bullets': [
          'Opportunity overview',
          'Mutual benefit',
          'Timeline',
          'Call to action',
        ],
        'footer': 'Professional & concise.',
      },
      {
        'type': 'content',
        'module': 'Follow-Up Protocol',
        'title': 'Follow-Up Protocol',
        'content': 'If no response:',
        'bullets': [
          'Day 5 → Polite reminder',
          'Day 12 → Value add follow-up',
          'Day 20 → Final respectful close',
        ],
        'footer': 'Never spam.',
      },
      {
        'type': 'content',
        'module': 'Sponsorship Structuring',
        'title': 'Sponsorship Structuring',
        'content': 'When requesting sponsorship, include:',
        'bullets': [
          'Audience demographics',
          'Reach statistics',
          'Engagement metrics',
          'Brand alignment',
          'Pricing tiers',
          'Deliverables breakdown',
        ],
      },
      {
        'type': 'content',
        'module': 'Sponsorship Tier Example',
        'title': 'Sponsorship Tier Example',
        'content': 'Tier 1 — Basic Exposure\nTier 2 — Premium Placement\nTier 3 — Title Sponsor',
        'bullets': [
          'What sponsor receives',
          'Measurable exposure',
          'Duration',
        ],
        'footer': 'Each tier must clearly define these elements.',
      },
      {
        'type': 'content',
        'module': 'Collaboration Campaign Blueprint',
        'title': 'Collaboration Campaign Blueprint',
        'content': 'Structure:',
        'bullets': [
          'Objective',
          'Audience',
          'Content format',
          'Timeline',
          'Responsibilities',
          'Promotion plan',
          'Metrics',
        ],
      },
      {
        'type': 'content',
        'module': 'Long-Term Partnership Framework',
        'title': 'Long-Term Partnership Framework',
        'content': 'For serious partnerships:',
        'bullets': [
          'Revenue sharing model',
          'Data sharing agreement',
          'Legal contract',
          'Defined growth target',
          'Quarterly review meeting',
        ],
      },
      {
        'type': 'content',
        'module': 'Legal & Professionalism Checklist',
        'title': 'Legal & Professionalism Checklist',
        'content': 'Always:',
        'bullets': [
          'Use written agreements',
          'Define payment terms',
          'Clarify ownership',
          'Protect brand usage rights',
          'Clarify cancellation terms',
        ],
      },
      {
        'type': 'content',
        'module': 'Relationship Tracking System',
        'title': 'Relationship Tracking System',
        'content': 'Track: Partner Name, Type, Stage, Contact Date, Follow-up Date, Outcome',
        'bullets': null,
        'footer': 'Use CRM to manage this.',
      },
      {
        'type': 'content',
        'module': 'Red Flags to Avoid',
        'title': 'Red Flags to Avoid',
        'content': 'Avoid brands that:',
        'bullets': [
          'Have reputation issues',
          'Target conflicting audiences',
          'Undervalue your assets',
          'Avoid formal agreements',
          'Only seek free exposure',
        ],
      },
      {
        'type': 'content',
        'module': 'Measuring Relationship ROI',
        'title': 'Measuring Relationship ROI',
        'content': 'Track:',
        'bullets': [
          'Leads generated',
          'Revenue generated',
          'New audience growth',
          'Brand credibility boost',
          'Long-term conversions',
        ],
      },
      {
        'type': 'content',
        'module': '90-Day Relationship Growth Plan',
        'title': '90-Day Relationship Growth Plan',
        'content': null,
        'bullets': [
          'Month 1: Identify 20 aligned brands, Warm up 10',
          'Month 2: Pitch 5 collaborations, Pitch 3 sponsorships',
          'Month 3: Secure at least 2 deals, Evaluate performance',
        ],
      },
      {
        'type': 'content_editable',
        'module': 'Structured Relationship Blueprint',
        'title': 'Structured Relationship Blueprint (Auto-Generated)',
        'content': 'App Output:',
        'bullets': null,
        'editableFields': [
          {'key': 'relationshipFocus', 'label': 'My focus is on ___ type relationships', 'hint': 'e.g. partnership, collaboration', 'maxLines': 1},
          {'key': 'targetBrands', 'label': 'My target aligned brands are ___', 'hint': 'e.g. complementary services', 'maxLines': 2},
          {'key': 'valueAssets', 'label': 'My top value assets are ___', 'hint': 'e.g. audience, expertise', 'maxLines': 2},
          {'key': 'outreachSequence', 'label': 'My outreach sequence is ___', 'hint': 'e.g. visibility → intro → proposal', 'maxLines': 2},
          {'key': 'ninetyDayGoal', 'label': 'My 90-day relationship goal is ___', 'hint': 'e.g. secure 2 partnerships', 'maxLines': 2},
        ],
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion',
        'content': 'After completing this premium course, you now have:',
        'bullets': [
          'Clear distinction between relationship types',
          'Alignment evaluation framework',
          'Structured value exchange model',
          'Outreach sequencing plan',
          'Sponsorship structuring clarity',
          '90-day execution roadmap',
        ],
        'footer': 'You now grow through leverage, not just effort.',
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
          'Partnerships, Collaborations & Sponsorships',
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
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
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
    if (type == 'content_editable') {
      return _buildContentEditablePage(pageData);
    }
    if (type == 'table') {
      return _buildTablePage(pageData);
    }
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
    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Table'),
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
        ],
      ),
    );
  }

  Widget _buildContentEditablePage(Map<String, dynamic> pageData) {
    final editableFields = (pageData['editableFields'] as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ??
        [];
    final content = pageData['content'] as String?;

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
        ],
      ),
    );
  }
}
