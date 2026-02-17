import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'What is Suitable Focus?',
      answer: 'Suitable Focus is a comprehensive platform designed to help entrepreneurs and small business owners grow their businesses through education, networking, and access to valuable resources.',
    ),
    FAQItem(
      question: 'How do I join the SF Family?',
      answer: 'You can join the SF Family by signing up on our platform. Simply navigate to the Community page and enter your email or use a referral code to get started.',
    ),
    FAQItem(
      question: 'What services does Suitable Focus offer?',
      answer: 'We offer a range of services including Social Media Management, Event Management, Graphic Design, and Photography & Videography. Visit our Services page to learn more.',
    ),
    FAQItem(
      question: 'How do I access courses and learning materials?',
      answer: 'All courses and learning materials are available on the Learn page. You can browse featured courses, recommendations, and continue your learning journey from where you left off.',
    ),
    FAQItem(
      question: 'What are SF Family Perks?',
      answer: 'SF Family members enjoy exclusive benefits including early access to events, discounts on selected services, and access to the Founder\'s Weekly Wisdom.',
    ),
    FAQItem(
      question: 'How do I track my learning progress?',
      answer: 'Your learning progress is displayed on the Home and Learn pages under the "Continue" section. You can see your completion percentage for each course.',
    ),
    FAQItem(
      question: 'Can I refer others to Suitable Focus?',
      answer: 'Yes! You can refer friends and earn rewards through our Refer & Earn program. Check the Discover More section on the Home page for more details.',
    ),
    FAQItem(
      question: 'How do I book a service?',
      answer: 'To book a service, navigate to the Services page, select the service you need, and follow the booking process. You can also use the "Book" action button on the Home page.',
    ),
    FAQItem(
      question: 'What events are available?',
      answer: 'You can view all upcoming events on the Events page. We regularly host workshops, networking events, and educational sessions for our community.',
    ),
    FAQItem(
      question: 'How do I contact support?',
      answer: 'You can reach out to us through the "Send Us A Message" section on the Community page. We typically respond within 24-48 hours.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.accentColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Got questions? We\'ve got answers!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              ..._faqs.map((faq) => _buildFAQItem(faq)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faq) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Text(
            faq.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconColor: AppColors.accentColor,
          collapsedIconColor: AppColors.accentColor,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                faq.answer,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}









