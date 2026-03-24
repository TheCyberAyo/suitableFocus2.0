import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FreeToolsCourseScreen extends StatefulWidget {
  const FreeToolsCourseScreen({super.key});

  @override
  State<FreeToolsCourseScreen> createState() => _FreeToolsCourseScreenState();
}

class _FreeToolsCourseScreenState extends State<FreeToolsCourseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _pages {
    return [
      {
        'type': 'content',
        'module': 'Welcome & Course Objective',
        'title': 'Welcome & Course Objective',
        'content':
            'Starting a business does NOT require expensive software.\n\nThis course will show you:',
        'bullets': [
          'Free email marketing tools',
          'CRM basics (customer management)',
          'Project management platforms',
          'Design tools',
          'Accounting starter tools',
          'All-in-one bundled startup platforms',
        ],
        'footer': 'By the end, you will know exactly which tools to use based on your stage and budget.',
      },
      {
        'type': 'content',
        'module': 'Tool Selection Strategy',
        'title': 'Tool Selection Strategy',
        'content': 'Before choosing tools, answer:',
        'bullets': [
          'What is my current monthly budget? R0 | R500–R1,500 | R1,500+',
          'What stage am I in? Idea stage | Pre-launch | Early revenue | Growing team',
        ],
        'footer': '💡 Rule: Start FREE. Upgrade only when revenue justifies it.',
      },
      {
        'type': 'content',
        'module': 'Email Marketing Starter Tools',
        'title': 'Email Marketing Starter Tools',
        'content': 'Why email marketing?',
        'bullets': [
          'You own your audience',
          'No algorithm restrictions',
          'High ROI',
          'Builds trust',
        ],
        'footer': 'Free tools help you: Capture leads • Send newsletters • Automate welcome emails',
      },
      {
        'type': 'content',
        'module': 'Recommended Free Email Tools',
        'title': 'Recommended Free Email Tools',
        'content': 'Top Free Options:',
        'bullets': [
          'Mailchimp — Free up to limited contacts, basic automation, easy templates',
          'Brevo (formerly Sendinblue) — Free daily email limit, SMS option, CRM included',
          'MailerLite — Clean interface, landing pages included, good automation starter',
        ],
        'footer': '💡 Best for beginners: MailerLite (simple UI)',
      },
      {
        'type': 'content',
        'module': 'CRM Basics',
        'title': 'CRM Basics (Customer Relationship Management)',
        'content': 'A CRM helps you:',
        'bullets': [
          'Track leads',
          'Track conversations',
          'Monitor deals',
          'Follow up properly',
        ],
        'footer': 'Without CRM = Lost opportunities.',
      },
      {
        'type': 'content',
        'module': 'Free CRM Tools',
        'title': 'Free CRM Tools',
        'content': 'Recommended:',
        'bullets': [
          'HubSpot CRM (Free) — Contact management, deal tracking, email tracking',
          'Zoho CRM (Free tier) — Lead management, basic automation',
          'Notion (Custom CRM Template) — Fully customizable, free for individuals, manual but flexible',
        ],
        'footer': '💡 If solo founder → Start with HubSpot Free.',
      },
      {
        'type': 'content',
        'module': 'Project Management Tools',
        'title': 'Project Management Tools',
        'content': 'Why you need one:',
        'bullets': [
          'Track tasks',
          'Manage deadlines',
          'Collaborate',
          'Avoid chaos',
        ],
        'footer': 'Even solo founders need structure.',
      },
      {
        'type': 'content',
        'module': 'Free Project Management Tools',
        'title': 'Free Project Management Tools',
        'content': 'Options:',
        'bullets': [
          'Trello — Kanban board style, extremely simple, great for beginners',
          'ClickUp — More advanced, good for growing teams',
          'Asana (Free plan) — Clean UI, good task tracking',
        ],
        'footer': '💡 Idea stage → Trello | Growing team → ClickUp',
      },
      {
        'type': 'content',
        'module': 'Design Tools',
        'title': 'Design Tools (Branding & Content)',
        'content': 'You do NOT need a graphic designer on day one.\n\nYou need:',
        'bullets': [
          'Logo',
          'Social media posts',
          'Simple website visuals',
          'Pitch deck slides',
        ],
      },
      {
        'type': 'content',
        'module': 'Free Design Platforms',
        'title': 'Free Design Platforms',
        'content': 'Best Options:',
        'bullets': [
          'Canva (Free) — Social posts, presentations, logo templates, very beginner-friendly',
          'Figma (Free plan) — UI/UX design, wireframes, collaboration',
        ],
        'footer': '💡 Non-designer? → Start with Canva.',
      },
      {
        'type': 'content',
        'module': 'Accounting Starter Tools',
        'title': 'Accounting Starter Tools',
        'content': 'Why you need this early:',
        'bullets': [
          'Track expenses',
          'Track income',
          'Prepare for tax',
          'Understand profitability',
        ],
        'footer': 'Most founders ignore this early — don\'t.',
      },
      {
        'type': 'content',
        'module': 'Free Accounting Tools',
        'title': 'Free Accounting Tools',
        'content': 'Free Options:',
        'bullets': [
          'Wave (Free) — Invoicing, expense tracking, financial reports',
          'Zoho Books (Free tier in some regions) — Invoices, bank reconciliation',
          'Google Sheets / Excel — Custom manual tracking, simple startup option',
        ],
        'footer': '💡 Early stage → Google Sheets | Consistent revenue → Wave',
      },
      {
        'type': 'content',
        'module': 'Bundled Startup Platforms',
        'title': 'Bundled Startup Platforms (All-in-One)',
        'content': 'Instead of many tools, you can use integrated systems.\n\nOptions:',
        'bullets': [
          'Notion — CRM, project management, notes, content calendar',
          'GoHighLevel — CRM, funnels, email, automation',
          'Kajabi — Courses, email marketing, website, payments',
        ],
        'footer': '💡 Solo bootstrapper → Notion | Service business scaling → GoHighLevel',
      },
      {
        'type': 'content',
        'module': 'Your Free Tool Stack Blueprint',
        'title': 'Your Free Tool Stack Blueprint',
        'content': null,
        'bullets': [
          '🎯 Based on R0 Budget:\n  Email → MailerLite | CRM → HubSpot Free | Project Management → Trello | Design → Canva | Accounting → Google Sheets',
          '🎯 Based on Small Budget:\n  Email → Brevo | CRM → HubSpot | Project → ClickUp | Design → Canva Pro (optional) | Accounting → Wave',
        ],
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion Outcome',
        'content': 'You now have:',
        'bullets': [
          'A free email marketing system',
          'A CRM to manage leads',
          'A project management system',
          'A design tool',
          'An accounting tracker',
          'A clear tool stack based on your budget',
        ],
        'footer': 'You are now operational without heavy expenses.',
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
          'Free Tools To Start With',
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
                return _buildPage(_pages[index]);
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

  Widget _buildPage(Map<String, dynamic> pageData) {
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
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildContentPage(Map<String, dynamic> pageData) {
    final content = pageData['content'] as String?;
    final bulletsRaw = pageData['bullets'];
    final bullets = bulletsRaw is List
        ? (bulletsRaw).cast<String>()
        : null;
    final footer = pageData['footer'] as String?;

    return _shell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBlock(pageData['title'] ?? 'Page'),
          const SizedBox(height: 24),
          if (content != null && content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.7,
                letterSpacing: 0.3,
              ),
            ),
          if (bullets != null && bullets.isNotEmpty) ...[
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
                  ...bullets.map<Widget>(
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
                                fontSize: 15,
                                height: 1.6,
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
          if (footer != null && footer.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
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
                  fontSize: 15,
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
