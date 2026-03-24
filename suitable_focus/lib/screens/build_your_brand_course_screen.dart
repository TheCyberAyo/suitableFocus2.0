import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BuildYourBrandCourseScreen extends StatefulWidget {
  const BuildYourBrandCourseScreen({super.key});

  @override
  State<BuildYourBrandCourseScreen> createState() =>
      _BuildYourBrandCourseScreenState();
}

class _BuildYourBrandCourseScreenState extends State<BuildYourBrandCourseScreen> {
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
      'positioningStatement',
      'uniqueAngle1',
      'uniqueAngle2',
      'nicheStatement',
      'peers',
      'mentors',
      'amplifiers',
      'week1Action',
      'week2Action',
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
        'module': 'Course Introduction',
        'title': 'Course Introduction',
        'content':
            'Your business brand grows faster when the founder is visible.\n\nIn today\'s economy:',
        'bullets': [
          'People trust people more than logos',
          'Authority attracts opportunity',
          'Visibility drives partnerships, sales, and influence',
        ],
        'footer': 'This course will help you: Craft your personal brand positioning • Build authority strategically • Strengthen online and offline presence • Map networking for intentional growth',
      },
      {
        'type': 'content',
        'module': 'Why Founder Branding Matters',
        'title': 'Why Founder Branding Matters',
        'content': 'A strong founder brand:',
        'bullets': [
          'Builds trust faster',
          'Reduces marketing costs',
          'Attracts partnerships',
          'Increases perceived value',
          'Makes your business memorable',
        ],
        'footer': 'Your visibility is not ego — it is leverage.',
      },
      {
        'type': 'content',
        'module': 'Module 1: Personal Brand Positioning',
        'title': 'What Is Personal Brand Positioning?',
        'content': 'Your positioning answers:',
        'bullets': [
          'Who are you?',
          'Who do you help?',
          'What problem do you solve?',
          'Why should people trust you?',
        ],
        'footer': 'Clarity removes confusion.',
      },
      {
        'type': 'content_editable',
        'module': 'Crafting Your Positioning Statement',
        'title': 'Crafting Your Positioning Statement',
        'content':
            'Use this formula:\nI help [specific audience] achieve [specific result] through [unique method], so they can [desired transformation].\n\nExample: I help small South African startups improve financial clarity through simplified budgeting systems, so they can scale sustainably.',
        'bullets': null,
        'editableFields': [
          {
            'key': 'positioningStatement',
            'label': 'My positioning statement',
            'hint': 'Write your statement using the formula above',
            'maxLines': 4,
          },
        ],
        'footer': 'Keep it specific and outcome-focused.',
      },
      {
        'type': 'content_editable',
        'module': 'Identifying Your Unique Angle',
        'title': 'Identifying Your Unique Angle',
        'content': 'Ask: What lived experience do I bring? • What results have I created? • What perspective differentiates me? • What industry gaps do I see?',
        'bullets': null,
        'editableFields': [
          {
            'key': 'uniqueAngle1',
            'label': 'My unique angle (experience or results)',
            'hint': 'e.g. 10 years in fintech',
            'maxLines': 2,
          },
          {
            'key': 'uniqueAngle2',
            'label': 'What differentiates my perspective',
            'hint': 'e.g. I focus on bootstrapped growth',
            'maxLines': 2,
          },
        ],
        'footer': 'Your uniqueness = your credibility multiplier.',
      },
      {
        'type': 'content_editable',
        'module': 'Niche Clarity vs Broad Appeal',
        'title': 'Niche Clarity vs Broad Appeal',
        'content':
            'Broad: "I help businesses grow."\nClear: "I help early-stage service businesses increase monthly revenue from R30,000 to R100,000 through strategic positioning."',
        'bullets': null,
        'editableFields': [
          {
            'key': 'nicheStatement',
            'label': 'My specific positioning (who + what result)',
            'hint': 'e.g. I help early-stage founders in SA get to R100k/month',
            'maxLines': 3,
          },
        ],
        'footer': 'Specific positioning attracts serious clients.',
      },
      {
        'type': 'content',
        'module': 'Module 2: Authority Building',
        'title': 'What Builds Authority?',
        'content': 'Authority is built through:',
        'bullets': [
          'Demonstrated expertise',
          'Consistency',
          'Results',
          'Visibility',
          'Social proof',
        ],
        'footer': 'Authority = Perceived competence + trust.',
      },
      {
        'type': 'content',
        'module': '5 Authority Pillars',
        'title': '5 Authority Pillars',
        'content': null,
        'bullets': [
          'Content creation (educational value)',
          'Speaking opportunities',
          'Client results & testimonials',
          'Media features',
          'Strategic partnerships',
        ],
        'footer': 'Build at least 2 consistently.',
      },
      {
        'type': 'content',
        'module': 'Content Strategy for Authority',
        'title': 'Content Strategy for Authority',
        'content': 'Focus on:',
        'bullets': [
          'Teaching what you know',
          'Sharing insights from experience',
          'Breaking down complex topics',
          'Industry commentary',
        ],
        'footer': 'Avoid: Random posting • Trend chasing without relevance. Consistency builds recognition.',
      },
      {
        'type': 'content',
        'module': 'Thought Leadership Positioning',
        'title': 'Thought Leadership Positioning',
        'content': 'Thought leaders:',
        'bullets': [
          'Share strong perspectives',
          'Challenge outdated thinking',
          'Offer frameworks',
          'Provide solutions',
        ],
        'footer': 'Don\'t just repost information — interpret it.',
      },
      {
        'type': 'content',
        'module': 'Leveraging Social Proof',
        'title': 'Leveraging Social Proof',
        'content': 'Types of social proof:',
        'bullets': [
          'Client testimonials',
          'Case studies',
          'Revenue milestones',
          'Awards',
          'Collaborations',
        ],
        'footer': 'Document your wins. Visibility amplifies credibility.',
      },
      {
        'type': 'content',
        'module': 'Module 3: Online vs Offline Presence',
        'title': 'Online Presence Foundations',
        'content': 'Your online ecosystem should include:',
        'bullets': [
          'Professional bio',
          'Clear positioning',
          'Updated profile photo',
          'Consistent messaging',
          'Evidence of expertise',
        ],
        'footer': 'Digital presence = modern reputation.',
      },
      {
        'type': 'content',
        'module': 'Choosing Your Core Platforms',
        'title': 'Choosing Your Core Platforms',
        'content':
            'You do not need to be everywhere.\nChoose based on audience:',
        'bullets': [
          'LinkedIn → B2B, professional audience',
          'Instagram → Visual storytelling',
          'YouTube → Deep education',
          'X (Twitter) → Ideas & thought leadership',
        ],
        'footer': 'Focus on 1–2 platforms consistently.',
      },
      {
        'type': 'content',
        'module': 'Bio & Profile Clarity',
        'title': 'Bio & Profile Clarity',
        'content': 'Your bio should clearly state:',
        'bullets': [
          'Who you help',
          'What you help them achieve',
          'What you\'re known for',
          'Call-to-action',
        ],
        'footer': 'Confused visitors don\'t convert.',
      },
      {
        'type': 'content',
        'module': 'Offline Visibility Still Matters',
        'title': 'Offline Visibility Still Matters',
        'content': 'Offline authority includes:',
        'bullets': [
          'Industry events',
          'Conferences',
          'Workshops',
          'Networking breakfasts',
          'Community involvement',
        ],
        'footer': 'Relationships deepen offline.',
      },
      {
        'type': 'content',
        'module': 'Speaking as a Visibility Multiplier',
        'title': 'Speaking as a Visibility Multiplier',
        'content': 'Speaking builds: Trust • Authority • Lead generation • Brand recognition',
        'bullets': [
          'Start small: Panel discussions',
          'Local business events',
          'Guest sessions',
        ],
        'footer': 'Momentum builds over time.',
      },
      {
        'type': 'content',
        'module': 'Module 4: Networking Mapping',
        'title': 'Networking With Intention',
        'content':
            'Random networking wastes energy.\n\nInstead ask: Who influences my target audience? • Who shares a similar audience? • Who can open doors to opportunities?',
        'bullets': null,
        'footer': 'Networking must be strategic.',
      },
      {
        'type': 'content_editable',
        'module': 'Your Networking Map',
        'title': 'Your Networking Map',
        'content': 'Create 3 categories. Each serves a different growth function:',
        'bullets': null,
        'editableFields': [
          {
            'key': 'peers',
            'label': 'Peers (similar stage founders) — names or types',
            'hint': 'e.g. Other SA startup founders',
            'maxLines': 2,
          },
          {
            'key': 'mentors',
            'label': 'Mentors (ahead of you) — who can guide you',
            'hint': 'e.g. Serial entrepreneurs in my space',
            'maxLines': 2,
          },
          {
            'key': 'amplifiers',
            'label': 'Amplifiers (access to audience) — who can extend reach',
            'hint': 'e.g. Podcast hosts, community leaders',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Strategic Introductions',
        'title': 'Strategic Introductions',
        'content': 'When reaching out:',
        'bullets': [
          'Be clear about value exchange',
          'Be respectful of time',
          'Offer mutual benefit',
          'Avoid vague requests',
        ],
        'footer': 'Professionalism builds reputation.',
      },
      {
        'type': 'content',
        'module': 'Value Exchange Framework',
        'title': 'Value Exchange Framework',
        'content': 'Before asking:',
        'bullets': [
          'What can I offer?',
          'How can I create value?',
          'What does this person care about?',
          'How does collaboration benefit both sides?',
        ],
        'footer': 'Relationships are built on contribution.',
      },
      {
        'type': 'content',
        'module': 'Collaboration Leverage',
        'title': 'Collaboration Leverage',
        'content': 'Collaboration ideas:',
        'bullets': [
          'Joint webinars',
          'Co-hosted events',
          'Podcast features',
          'Social media takeovers',
          'Cross-promotion',
        ],
        'footer': 'Collaboration accelerates growth.',
      },
      {
        'type': 'content',
        'module': 'Module 5: Brand Consistency & Scaling',
        'title': 'Consistency Builds Recognition',
        'content': 'Your: Visual identity • Tone of voice • Messaging themes • Core topics — must remain consistent.',
        'bullets': null,
        'footer': 'Repetition builds authority.',
      },
      {
        'type': 'content',
        'module': 'Founder vs Company Brand',
        'title': 'Founder vs Company Brand',
        'content': 'Founder brand: Human • Personal • Story-driven\n\nCompany brand: Structured • Scalable • Process-driven',
        'bullets': null,
        'footer': 'They should align, not compete.',
      },
      {
        'type': 'content',
        'module': 'Delegating Brand Representation',
        'title': 'Delegating Brand Representation',
        'content': 'As you grow:',
        'bullets': [
          'Train team members',
          'Align messaging',
          'Provide brand guidelines',
          'Ensure consistency',
        ],
        'footer': 'Visibility must scale beyond you.',
      },
      {
        'type': 'content',
        'module': 'Reputation Management',
        'title': 'Reputation Management',
        'content': 'Protect your brand by:',
        'bullets': [
          'Responding professionally',
          'Addressing criticism calmly',
          'Avoiding public conflicts',
          'Maintaining integrity',
        ],
        'footer': 'Reputation compounds over time.',
      },
      {
        'type': 'content_editable',
        'module': 'Module 6: Action Plan',
        'title': '30-Day Founder Visibility Plan',
        'content':
            'Week 1: Finalise positioning statement • Optimise profiles\nWeek 2: Publish 3 authority-building posts • Reach out to 2 strategic connections\nWeek 3: Engage in 5 industry conversations • Secure one collaboration opportunity\nWeek 4: Host or participate in one visibility event',
        'bullets': null,
        'editableFields': [
          {
            'key': 'week1Action',
            'label': 'My Week 1 commitment (positioning + profile)',
            'hint': 'e.g. Finalise LinkedIn bio and positioning',
            'maxLines': 2,
          },
          {
            'key': 'week2Action',
            'label': 'My Week 2 commitment (content + connections)',
            'hint': 'e.g. 3 posts, 2 DMs to potential collaborators',
            'maxLines': 2,
          },
        ],
      },
      {
        'type': 'content',
        'module': 'Authority Audit',
        'title': 'Authority Audit',
        'content': 'Ask:',
        'bullets': [
          'Does my online presence reflect expertise?',
          'Is my positioning clear?',
          'Am I visible consistently?',
          'Am I building the right relationships?',
        ],
        'footer': 'Clarity drives improvement.',
      },
      {
        'type': 'content',
        'module': 'Visibility Metrics to Track',
        'title': 'Visibility Metrics to Track',
        'content': 'Track:',
        'bullets': [
          'Profile views',
          'Engagement rate',
          'Speaking invitations',
          'Collaboration opportunities',
          'Lead inquiries',
        ],
        'footer': 'Measure momentum.',
      },
      {
        'type': 'content',
        'module': 'Mindset Shift',
        'title': 'Mindset Shift',
        'content':
            'Visibility is not about self-promotion.\n\nIt is about: Leadership • Education • Contribution • Impact',
        'bullets': null,
        'footer': 'Own your space confidently.',
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion',
        'content': 'You now have:',
        'bullets': [
          'A clear personal brand positioning',
          'Authority-building framework',
          'Online & offline presence strategy',
          'Strategic networking map',
          '30-day execution plan',
        ],
        'footer': 'When founders become visible, businesses grow faster. Your brand is not separate from your business — it is a growth lever.',
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
          'Build Your Brand',
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
