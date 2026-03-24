import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SimpleBudgetingCourseScreen extends StatefulWidget {
  const SimpleBudgetingCourseScreen({super.key});

  @override
  State<SimpleBudgetingCourseScreen> createState() =>
      _SimpleBudgetingCourseScreenState();
}

class _SimpleBudgetingCourseScreenState extends State<SimpleBudgetingCourseScreen> {
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
        'module': 'Course Introduction',
        'title': 'Course Introduction',
        'content': 'Welcome to Simple Budgeting.\n\nThis course will help you:',
        'bullets': [
          'Understand exactly where your money goes',
          'Forecast future revenue with clarity',
          'Calculate your break-even point',
          'Plan quarterly growth strategically',
        ],
        'footer': 'Most businesses don\'t fail from lack of sales. They fail from lack of financial visibility.',
      },
      {
        'type': 'content',
        'module': 'Why Budgeting Matters',
        'title': 'Why Budgeting Matters',
        'content': 'Budgeting is not about restriction.\n\nIt is about:',
        'bullets': [
          'Control',
          'Stability',
          'Strategic growth',
          'Confident decision-making',
        ],
        'footer': 'When you know your numbers, you reduce stress and increase power.',
      },
      {
        'type': 'content',
        'module': 'Understanding Cash Flow',
        'title': 'Understanding Cash Flow',
        'content': 'Cash Flow = Money In – Money Out\n\nThere are 3 types:',
        'bullets': [
          'Operating cash flow (daily business income & expenses)',
          'Investing cash flow (equipment, assets, systems)',
          'Financing cash flow (loans, investors, owner contributions)',
        ],
        'footer': 'Cash flow problems sink profitable businesses.',
      },
      {
        'type': 'content',
        'module': 'Module 1: Cost Structure Clarity',
        'title': 'Fixed Costs Explained',
        'content':
            'Fixed costs stay the same monthly, regardless of sales.\n\nExamples (South Africa context):',
        'bullets': [
          'Office rent: R8,000',
          'WiFi & utilities: R2,000',
          'Software subscriptions: R1,200',
          'Insurance: R1,000',
          'Salaries: R25,000',
        ],
        'footer': 'Total example fixed costs: R37,200 per month. These must be covered even if you make zero sales.',
      },
      {
        'type': 'content',
        'module': 'Variable Costs Explained',
        'title': 'Variable Costs Explained',
        'content': 'Variable costs increase as sales increase.\n\nExamples:',
        'bullets': [
          'Packaging: R20 per order',
          'Courier: R80 per order',
          'Payment gateway fees: 3% per transaction',
          'Marketing ads: R5,000–R15,000 depending on campaign',
        ],
        'footer': 'More sales = higher variable costs.',
      },
      {
        'type': 'content',
        'module': 'Why This Distinction Is Critical',
        'title': 'Why This Distinction Is Critical',
        'content': 'If you don\'t separate fixed and variable costs:',
        'bullets': [
          'You cannot calculate break-even',
          'You cannot forecast profit accurately',
          'You may overspend during slow months',
        ],
        'footer': 'Financial clarity starts with categorisation.',
      },
      {
        'type': 'table',
        'module': 'Monthly Cost Tracking Template',
        'title': 'Monthly Cost Tracking Template',
        'content': 'Create a simple table. Track this monthly.',
        'rows': [
          ['Category', 'Fixed (R)', 'Variable (R)', 'Notes'],
          ['Rent', '8,000', '-', 'Lease'],
          ['Marketing', '-', '7,500', 'Paid ads'],
          ['Software', '1,200', '-', 'Subscriptions'],
        ],
      },
      {
        'type': 'content',
        'module': 'Module 2: Revenue Forecasting',
        'title': 'Why Forecast Revenue?',
        'content': 'Forecasting helps you:',
        'bullets': [
          'Plan hiring',
          'Budget marketing',
          'Order stock confidently',
          'Prepare for slow months',
        ],
        'footer': 'Without forecasting, you\'re reacting — not leading.',
      },
      {
        'type': 'content',
        'module': 'Forecasting Method 1 – Historical Average',
        'title': 'Forecasting Method 1 – Historical Average',
        'content': 'If last 3 months revenue was:\nMonth 1: R60,000\nMonth 2: R70,000\nMonth 3: R65,000',
        'bullets': null,
        'footer': 'Average = R65,000. Use this as your baseline projection.',
      },
      {
        'type': 'content',
        'module': 'Forecasting Method 2 – Sales Pipeline',
        'title': 'Forecasting Method 2 – Sales Pipeline',
        'content':
            'Formula:\nProjected Revenue = Leads × Conversion Rate × Average Sale\n\nExample:\n300 leads • 10% conversion • R1,500 average sale',
        'bullets': null,
        'footer': '300 × 0.10 × R1,500 = R45,000 projected revenue',
      },
      {
        'type': 'content',
        'module': 'Conservative vs Optimistic Forecasting',
        'title': 'Conservative vs Optimistic Forecasting',
        'content': 'Always create 3 projections:',
        'bullets': [
          'Conservative: R50,000',
          'Expected: R65,000',
          'Aggressive: R85,000',
        ],
        'footer': 'Plan expenses based on conservative revenue.',
      },
      {
        'type': 'content',
        'module': 'Module 3: Break-Even Awareness',
        'title': 'What Is Break-Even?',
        'content':
            'Break-even is when:\nRevenue = Total Costs\n\nNo profit. No loss.',
        'bullets': null,
        'footer': 'It is your survival line.',
      },
      {
        'type': 'content',
        'module': 'Break-Even Formula (Rands Example)',
        'title': 'Break-Even Formula (Rands Example)',
        'content':
            'Break-Even Revenue = Fixed Costs ÷ (1 − Variable Cost %)\n\nExample:\nFixed Costs = R40,000\nVariable Cost = 35%',
        'bullets': [
          'Break-even = R40,000 ÷ (1 − 0.35)',
          'R40,000 ÷ 0.65 = R61,538',
        ],
        'footer': 'You must generate at least R61,538 per month to survive.',
      },
      {
        'type': 'content',
        'module': 'Contribution Margin Explained',
        'title': 'Contribution Margin Explained',
        'content':
            'If you sell a product for R1,000\nAnd variable costs are R400\n\nContribution margin = R600',
        'bullets': null,
        'footer': 'That R600 helps cover fixed costs. The higher your margin, the faster you break even.',
      },
      {
        'type': 'content',
        'module': 'Lowering Your Break-Even Point',
        'title': 'Lowering Your Break-Even Point',
        'content': 'You can lower break-even by:',
        'bullets': [
          'Reducing fixed costs',
          'Increasing price',
          'Improving efficiency',
          'Negotiating supplier pricing',
          'Increasing customer lifetime value',
        ],
        'footer': 'Smart businesses focus on margin first.',
      },
      {
        'type': 'content',
        'module': 'Module 4: Quarterly Growth Planning',
        'title': 'Why Quarterly Planning Works',
        'content': 'Quarterly planning allows:',
        'bullets': [
          'Strategic adjustments',
          'Measurable milestones',
          'Financial discipline',
          'Clear execution cycles',
        ],
        'footer': '12 months is too far. 30 days is too reactive. 90 days is strategic.',
      },
      {
        'type': 'content',
        'module': 'Quarterly Financial Targets',
        'title': 'Quarterly Financial Targets',
        'content': 'Each quarter define:',
        'bullets': [
          'Revenue target (e.g., R240,000 total)',
          'Expense ceiling (e.g., R180,000)',
          'Profit goal (e.g., R60,000)',
          'Reserve allocation (e.g., R20,000)',
        ],
        'footer': 'Plan before spending.',
      },
      {
        'type': 'content',
        'module': 'Expense Allocation Model',
        'title': 'Expense Allocation Model',
        'content': 'Suggested structure:',
        'bullets': [
          '45% Operations',
          '20% Marketing',
          '10% Admin',
          '10% Growth & Innovation',
          '15% Profit & Reserves',
        ],
        'footer': 'Adjust based on your industry.',
      },
      {
        'type': 'content',
        'module': 'Building a Cash Reserve',
        'title': 'Building a Cash Reserve',
        'content':
            'Healthy businesses keep:\n3–6 months of operating expenses saved.',
        'bullets': null,
        'footer': 'If your monthly costs = R50,000, target reserve = R150,000–R300,000. This protects you during slow seasons.',
      },
      {
        'type': 'content',
        'module': 'Module 5: Implementation System',
        'title': 'Weekly Money Check-In (15 Minutes)',
        'content': 'Every week review:',
        'bullets': [
          'Revenue collected',
          'Expenses paid',
          'Bank balance',
          'Forecast vs actual',
        ],
        'footer': 'Small weekly reviews prevent large problems.',
      },
      {
        'type': 'content',
        'module': 'Monthly Financial Review',
        'title': 'Monthly Financial Review',
        'content': 'At month-end:',
        'bullets': [
          'Compare projected vs actual revenue',
          'Identify unnecessary spending',
          'Adjust next month\'s forecast',
          'Review margins',
        ],
        'footer': 'Discipline creates stability.',
      },
      {
        'type': 'content',
        'module': 'Financial Dashboard Essentials',
        'title': 'Financial Dashboard Essentials',
        'content': 'Track:',
        'bullets': [
          'Monthly revenue',
          'Fixed costs',
          'Variable costs',
          'Net profit',
          'Break-even',
          'Cash reserves',
        ],
        'footer': 'Clarity reduces anxiety.',
      },
      {
        'type': 'content',
        'module': 'Module 6: Advanced Budget Strategy',
        'title': 'Planning for Tax',
        'content': 'In South Africa, always allocate for tax.',
        'bullets': [
          'Set aside 20–30% of profit for tax planning.',
        ],
        'footer': 'Never treat tax money as spendable cash.',
      },
      {
        'type': 'content',
        'module': 'Scaling Responsibly',
        'title': 'Scaling Responsibly',
        'content': 'When revenue increases, do NOT: Immediately upgrade lifestyle • Overspend on office space • Hire too quickly',
        'bullets': [
          'Instead: Increase reserves',
          'Invest in automation',
          'Improve systems',
        ],
      },
      {
        'type': 'content',
        'module': 'Managing Slow Seasons',
        'title': 'Managing Slow Seasons',
        'content': 'Plan ahead for:',
        'bullets': [
          'Holiday dips',
          'Industry cycles',
          'Economic shifts',
        ],
        'footer': 'Save during strong months to survive weaker ones.',
      },
      {
        'type': 'content',
        'module': 'Common Budgeting Mistakes',
        'title': 'Common Budgeting Mistakes',
        'content': null,
        'bullets': [
          'Mixing personal and business money',
          'Ignoring small recurring subscriptions',
          'Overspending after one good month',
          'Not forecasting ahead',
          'Ignoring margins',
        ],
        'footer': 'Avoid these and you outperform most startups.',
      },
      {
        'type': 'content',
        'module': 'Final Section',
        'title': '7-Day Action Plan',
        'content': 'Within 7 days:',
        'bullets': [
          'List all fixed costs',
          'List all variable costs',
          'Calculate break-even',
          'Forecast next 3 months revenue',
          'Set quarterly revenue goal',
        ],
        'footer': 'Take action immediately.',
      },
      {
        'type': 'content',
        'module': 'Budgeting Worksheet Prompt',
        'title': 'Budgeting Worksheet Prompt',
        'content': 'Answer:',
        'bullets': [
          'What is my exact monthly fixed cost?',
          'What is my variable cost percentage?',
          'What is my break-even revenue?',
          'What is my 90-day revenue goal?',
        ],
        'footer': 'Clarity creates momentum.',
      },
      {
        'type': 'content',
        'module': 'Financial Mindset Shift',
        'title': 'Financial Mindset Shift',
        'content': 'Successful founders think:',
        'bullets': [
          'In margins',
          'In systems',
          'In sustainability',
          'In long-term wealth',
        ],
        'footer': 'Not in emotional spending.',
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion',
        'content': 'You now have:',
        'bullets': [
          'Clear cost structure',
          'Revenue forecasting framework',
          'Break-even awareness',
          'Quarterly planning system',
          'Reserve strategy',
        ],
        'footer': 'Financial visibility turns stress into structure. Structure turns small businesses into scalable companies.',
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
          'Simple Budgeting',
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
    if (pageData['type'] == 'table') {
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
    final content = pageData['content'] as String?;

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
        ],
      ),
    );
  }
}
