import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ComplianceCourseScreen extends StatefulWidget {
  const ComplianceCourseScreen({super.key});

  @override
  State<ComplianceCourseScreen> createState() => _ComplianceCourseScreenState();
}

class _ComplianceCourseScreenState extends State<ComplianceCourseScreen> {
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
        'module': 'Welcome to Compliance Readiness',
        'title': 'Welcome to Compliance Readiness',
        'content':
            'Why this matters:\nCompliance is not just about avoiding fines — it builds trust, protects your customers, and safeguards your business long-term.\n\nIn South Africa, small businesses must understand:',
        'bullets': [
          'Data protection laws',
          'Financial record-keeping obligations',
          'Tax compliance requirements',
          'POPIA responsibilities',
        ],
        'footer': 'By the end of this course, you will: Understand your legal risk areas • Implement basic compliance systems • Create a simple compliance checklist for your business',
      },
      {
        'type': 'content',
        'module': 'What Is Compliance?',
        'title': 'What Is Compliance?',
        'content':
            'Compliance means operating your business in line with:\nNational laws • Industry regulations • Tax requirements • Data protection laws',
        'bullets': [
          'Protection of Personal Information Act (POPIA)',
          'Companies Act',
          'South African Revenue Service regulations',
          'Consumer Protection Act',
        ],
        'footer': 'In South Africa, key legislation includes the above.',
      },
      {
        'type': 'content',
        'module': 'Section 1: Data Protection Fundamentals',
        'title': 'What Is Personal Information?',
        'content': 'Under POPIA, personal information includes:',
        'bullets': [
          'Full names',
          'ID numbers',
          'Phone numbers',
          'Email addresses',
          'Physical addresses',
          'Bank details',
          'IP addresses',
          'Biometric information',
        ],
        'footer': 'If you collect ANY of the above, POPIA applies to you.',
      },
      {
        'type': 'content',
        'module': 'Why Data Protection Matters',
        'title': 'Why Data Protection Matters',
        'content': 'Risks of poor data protection:',
        'bullets': [
          'Financial penalties',
          'Legal action',
          'Reputational damage',
          'Customer trust loss',
        ],
        'footer': 'Customers expect: Secure storage • Limited access • Responsible usage • No unauthorized sharing. Compliance builds credibility.',
      },
      {
        'type': 'content',
        'module': "POPIA's 8 Key Conditions (Simplified)",
        'title': "POPIA's 8 Key Conditions (Simplified)",
        'content': "POPIA requires you to:",
        'bullets': [
          'Be accountable',
          'Process data lawfully',
          'Collect minimal data',
          'Inform customers why you\'re collecting data',
          'Keep data secure',
          'Allow customers access to their data',
          'Correct inaccurate data',
          'Delete data when no longer needed',
        ],
      },
      {
        'type': 'content',
        'module': 'Section 2: Customer Information Handling',
        'title': 'Data Collection Checklist',
        'content': 'Before collecting data, ask:',
        'bullets': [
          'Why am I collecting this?',
          'Is it necessary?',
          'Do I have consent?',
          'How long will I keep it?',
          'Where is it stored?',
        ],
        'footer': 'If you can\'t answer these clearly — revise your process.',
      },
      {
        'type': 'content',
        'module': 'Secure Storage Basics',
        'title': 'Secure Storage Basics',
        'content': 'Minimum requirements:',
        'bullets': [
          'Password-protected devices',
          'Secure cloud platforms',
          'Limited employee access',
          'Encrypted payment gateways',
          'Regular password updates',
        ],
        'footer': 'Avoid: Storing ID copies on WhatsApp • Saving customer spreadsheets on unsecured laptops • Sharing databases via email without protection',
      },
      {
        'type': 'content',
        'module': 'Privacy Policy Requirements',
        'title': 'Privacy Policy Requirements',
        'content': 'If you have a website or collect data online, you MUST have:',
        'bullets': [
          'A Privacy Policy',
          'Clear consent language',
          'Cookie disclosure (if applicable)',
          'Contact details for your Information Officer',
        ],
      },
      {
        'type': 'content',
        'module': 'Information Officer Requirement',
        'title': 'Information Officer Requirement',
        'content':
            'Under POPIA:\nEvery business must appoint an Information Officer. Usually, the business owner fulfills this role. You must register with the Information Regulator.',
        'bullets': [
          'Monitor compliance',
          'Handle complaints',
          'Ensure staff awareness',
        ],
        'footer': 'Your role includes the above.',
      },
      {
        'type': 'content',
        'module': 'Section 3: Basic Financial Record Structure',
        'title': 'Why Financial Records Matter',
        'content': 'Good records:',
        'bullets': [
          'Prevent SARS penalties',
          'Support loan applications',
          'Protect against audits',
          'Track business performance',
        ],
        'footer': 'South African law requires businesses to keep records for at least 5 years.',
      },
      {
        'type': 'content',
        'module': 'Core Financial Records You Must Keep',
        'title': 'Core Financial Records You Must Keep',
        'content': null,
        'bullets': [
          'Sales invoices',
          'Expense receipts',
          'Bank statements',
          'Payroll records',
          'Asset register',
          'Tax submissions',
        ],
        'footer': 'Digital copies are acceptable if securely stored.',
      },
      {
        'type': 'content',
        'module': 'Simple Accounting Structure',
        'title': 'Simple Accounting Structure',
        'content': 'Minimum structure:',
        'bullets': [
          'Income: Sales, Service revenue, Other income',
          'Expenses: Rent, Utilities, Marketing, Staff salaries, Software, Transport',
          'Assets: Equipment, Vehicles, Inventory',
          'Liabilities: Loans, Supplier payments, VAT owed',
        ],
      },
      {
        'type': 'content',
        'module': 'Separation of Business & Personal Finances',
        'title': 'Separation of Business & Personal Finances',
        'content':
            'Critical rule:\nNever mix personal and business funds.',
        'bullets': [
          'Open: Dedicated business bank account',
          'Separate card for business expenses',
        ],
        'footer': 'This simplifies: Tax filing • Cash flow tracking • Audit readiness',
      },
      {
        'type': 'content',
        'module': 'Section 4: Tax Awareness Checkpoints (South Africa)',
        'title': 'Registering with SARS',
        'content': 'Most businesses must register for:',
        'bullets': [
          'Income Tax',
          'Provisional Tax (if self-employed)',
          'PAYE (if hiring staff)',
          'VAT (if turnover exceeds R1 million annually)',
        ],
        'footer': 'Always confirm thresholds with South African Revenue Service.',
      },
      {
        'type': 'content',
        'module': 'VAT Basics',
        'title': 'VAT Basics',
        'content':
            'VAT registration becomes mandatory when taxable supplies exceed R1 million in a 12-month period. Optional registration possible from R50,000 turnover.',
        'bullets': [
          'Submit VAT201 returns',
          'Pay VAT collected',
          'Keep VAT invoices',
        ],
        'footer': 'VAT obligations include the above.',
      },
      {
        'type': 'content',
        'module': 'Provisional Tax Overview',
        'title': 'Provisional Tax Overview',
        'content': 'Provisional tax applies to: Sole proprietors • Freelancers • Company directors',
        'bullets': [
          'Payments due: August',
          'Payments due: February',
        ],
        'footer': 'It\'s an advance payment on expected annual income.',
      },
      {
        'type': 'content',
        'module': 'PAYE Responsibilities',
        'title': 'PAYE Responsibilities',
        'content': 'If you employ staff, you must:',
        'bullets': [
          'Deduct PAYE',
          'Deduct UIF',
          'Possibly deduct SDL',
          'Submit EMP201 monthly',
          'Issue IRP5 annually',
        ],
        'footer': 'Failure can result in penalties.',
      },
      {
        'type': 'content',
        'module': 'Section 5: POPIA Overview Summary',
        'title': 'What Happens If You Don\'t Comply?',
        'content': 'Penalties under POPIA may include:',
        'bullets': [
          'Fines up to R10 million',
          'Civil damages claims',
          'Criminal penalties in serious cases',
          'Business shutdown risks',
        ],
        'footer': 'Compliance is cheaper than non-compliance.',
      },
      {
        'type': 'content',
        'module': 'Data Breach Protocol',
        'title': 'Data Breach Protocol',
        'content': 'If customer data is compromised, you must:',
        'bullets': [
          'Investigate immediately',
          'Notify affected customers',
          'Inform the Information Regulator',
          'Document corrective actions',
        ],
        'footer': 'Delaying reporting increases penalties.',
      },
      {
        'type': 'content',
        'module': 'Consent & Marketing',
        'title': 'Consent & Marketing',
        'content': 'Under POPIA, you cannot: Send unsolicited marketing emails • Buy contact lists • Add customers without consent',
        'bullets': [
          'Always provide unsubscribe option',
          'Record consent proof',
        ],
      },
      {
        'type': 'content',
        'module': 'Third-Party Vendors',
        'title': 'Third-Party Vendors',
        'content':
            'If using payment processors, cloud storage, CRM platforms, or marketing software — you remain responsible for ensuring they are compliant.',
        'bullets': [
          'Data processing agreements',
          'Security policies',
          'Hosting locations',
        ],
        'footer': 'Review the above.',
      },
      {
        'type': 'content',
        'module': 'Section 6: Practical Implementation Plan',
        'title': '30-Day Compliance Starter Plan',
        'content': null,
        'bullets': [
          'Week 1: Register Information Officer, Draft Privacy Policy',
          'Week 2: Organize financial records, Separate bank accounts',
          'Week 3: Review tax registrations, Confirm SARS compliance',
          'Week 4: Implement data storage safeguards, Train staff on data handling',
        ],
      },
      {
        'type': 'content',
        'module': 'Compliance Risk Self-Assessment',
        'title': 'Compliance Risk Self-Assessment',
        'content': 'Ask yourself:',
        'bullets': [
          'Do I store ID copies securely?',
          'Do I have written consent records?',
          'Are my tax submissions up to date?',
          'Are my financial records organized?',
          'Do staff understand POPIA basics?',
        ],
        'footer': 'Score: 0–2 = High Risk | 3–4 = Moderate Risk | 5 = Good Compliance Standing',
      },
      {
        'type': 'content',
        'module': 'Building a Compliance Culture',
        'title': 'Building a Compliance Culture',
        'content': 'Compliance is not a once-off task.\nEmbed it into:',
        'bullets': [
          'Onboarding process',
          'Staff training',
          'Contract drafting',
          'Vendor selection',
          'Annual reviews',
        ],
      },
      {
        'type': 'content',
        'module': 'When to Seek Professional Help',
        'title': 'When to Seek Professional Help',
        'content': 'Consult: Accountant (tax & financial compliance) • Legal advisor (POPIA & contracts) • Compliance consultant (if scaling)',
        'bullets': [
          'Especially when expanding nationally',
          'Hiring multiple employees',
          'Handling sensitive data',
          'Raising investment',
        ],
      },
      {
        'type': 'content',
        'module': 'Compliance & Funding',
        'title': 'Compliance & Funding',
        'content': 'Investors and banks assess:',
        'bullets': [
          'Financial record quality',
          'Tax clearance status',
          'Legal compliance',
          'POPIA readiness',
        ],
        'footer': 'Compliance increases funding eligibility.',
      },
      {
        'type': 'content',
        'module': 'Compliance Document Checklist',
        'title': 'Compliance Document Checklist',
        'content': 'You should have:',
        'bullets': [
          'Privacy Policy',
          'Terms & Conditions',
          'POPIA consent form',
          'Tax registration documents',
          'Company registration certificate',
          'Financial statements',
          'Employee contracts',
        ],
      },
      {
        'type': 'content',
        'module': 'Red Flags to Avoid',
        'title': 'Red Flags to Avoid',
        'content': null,
        'bullets': [
          'Ignoring SARS letters',
          'Sharing customer databases',
          'No written contracts',
          'Paying staff cash without payroll records',
          'Mixing funds',
          'Delaying VAT submissions',
        ],
      },
      {
        'type': 'content',
        'module': 'Compliance Growth Mindset',
        'title': 'Compliance Growth Mindset',
        'content': 'Think of compliance as:',
        'bullets': [
          'Asset protection',
          'Trust building',
          'Business credibility',
          'Risk management',
          'Long-term sustainability',
        ],
      },
      {
        'type': 'content',
        'module': 'Final Action Plan',
        'title': 'Final Action Plan',
        'content': null,
        'bullets': [
          'Today: Review your data handling, Check tax registrations, Organize financial files',
          'This Week: Draft/update Privacy Policy, Confirm POPIA readiness, Ensure bank separation',
          'This Month: Conduct compliance audit, Fix gaps, Document procedures',
        ],
      },
      {
        'type': 'content',
        'module': 'Course Completion',
        'title': 'Course Completion Outcome',
        'content': 'You now have:',
        'bullets': [
          'Clear understanding of South African compliance landscape',
          'Basic POPIA knowledge',
          'Financial record structure clarity',
          'Tax awareness checkpoints',
          'A 30-day readiness roadmap',
        ],
        'footer': 'Compliance is not optional — it is foundational.',
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
          'Compliance (Data, Financial & POPIA)',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 12,
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
}
