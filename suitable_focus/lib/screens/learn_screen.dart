import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/cart_provider.dart';
import 'course_intro_screen.dart';
import 'ideation_foundation_course_screen.dart';
import 'where_do_i_start_course_screen.dart';
import 'ideal_customer_profile_course_screen.dart';
import 'free_tools_course_screen.dart';
import 'partnerships_course_screen.dart';
import 'compliance_course_screen.dart';
import 'simple_budgeting_course_screen.dart';
import 'marketing_plan_course_screen.dart';
import 'build_your_brand_course_screen.dart';
import 'where_to_go_next_course_screen.dart';
import 'community_screen.dart';
import 'services_screen.dart';
import 'events_screen.dart';
import 'cart_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _currentIndex = 3; // Learn tab is active
  final ScrollController _featuredScrollController = ScrollController();
  int _featuredPage = 0;
  static const int _featuredItemCount = 11; // intro + 10 courses

  // Intro card + 10 courses in order. imagePath = background for card (optional).
  final List<Map<String, dynamic>> _featuredItems = [
    {
      'title': 'Introduction to SF Courses',
      'isIntro': true,
      'imagePath': null,
    },
    {
      'title': 'Ideation to Foundation',
      'isIntro': false,
      'imagePath': 'assets/images/ideation_to_foundation.png',
    },
    {
      'title': 'Where Do I Start?',
      'isIntro': false,
      'imagePath': 'assets/images/where_do_i_start.png',
    },
    {
      'title': 'Ideal Customer Profile',
      'isIntro': false,
      'imagePath': 'assets/images/ideal_customer_profile.png',
    },
    {
      'title': 'Free Tools I Can Start With',
      'isIntro': false,
      'imagePath': null,
    },
    {
      'title': 'Partnerships, Collaborations & Sponsorships',
      'isIntro': false,
      'imagePath': 'assets/images/Partnerships.png',
    },
    {
      'title': 'Compliance (Data, Financial, POPIA)',
      'isIntro': false,
      'imagePath': 'assets/images/Compliance.png',
    },
    {
      'title': 'Simple Budgeting',
      'isIntro': false,
      'imagePath': 'assets/images/budgeting.png',
    },
    {
      'title': 'Marketing Plan & Dashboard',
      'isIntro': false,
      'imagePath': 'assets/images/marketingplan.png',
    },
    {
      'title': 'Build Your Brand(s) as a Founder or Team',
      'isIntro': false,
      'imagePath': 'assets/images/build_your_brand.png',
    },
    {
      'title': 'Where To Go Next',
      'isIntro': false,
      'imagePath': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _featuredScrollController.addListener(_onFeaturedScroll);
  }

  void _onFeaturedScroll() {
    const cardWidth = 168.0;
    const padding = 12.0;
    final offset = _featuredScrollController.offset;
    final page = (offset / (cardWidth + padding)).round().clamp(0, _featuredItemCount - 1);
    if (page != _featuredPage && mounted) {
      setState(() => _featuredPage = page);
    }
  }

  @override
  void dispose() {
    _featuredScrollController.removeListener(_onFeaturedScroll);
    _featuredScrollController.dispose();
    super.dispose();
  }

  void _navigateToFeaturedItem(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CourseIntroScreen()),
      );
      return;
    }
    Widget screen;
    switch (index) {
      case 1:
        screen = const IdeationFoundationCourseScreen();
        break;
      case 2:
        screen = const WhereDoIStartCourseScreen();
        break;
      case 3:
        screen = const IdealCustomerProfileCourseScreen();
        break;
      case 4:
        screen = const FreeToolsCourseScreen();
        break;
      case 5:
        screen = const PartnershipsCourseScreen();
        break;
      case 6:
        screen = const ComplianceCourseScreen();
        break;
      case 7:
        screen = const SimpleBudgetingCourseScreen();
        break;
      case 8:
        screen = const MarketingPlanCourseScreen();
        break;
      case 9:
        screen = const BuildYourBrandCourseScreen();
        break;
      case 10:
        screen = const WhereToGoNextCourseScreen();
        break;
      default:
        return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.school,
                    color: AppColors.accentColor,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Learn',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.search, color: AppColors.accentColor),
                    onPressed: () {},
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: AppColors.accentColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartScreen(),
                                ),
                              );
                            },
                          ),
                          if (cartProvider.itemCount > 0)
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '${cartProvider.itemCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: AppColors.accentColor),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Browse courses and learning materials',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Featured section header: "Featured" + arrow
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Featured',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.accentColor,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Horizontal scroll of intro + 10 course cards
            SizedBox(
              height: 200,
              child: ListView.builder(
                controller: _featuredScrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _featuredItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: index < _featuredItems.length - 1 ? 12 : 0),
                    child: _buildFeaturedCard(index),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _featuredItemCount.clamp(0, 11),
                (index) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: index == _featuredPage
                          ? AppColors.accentColor
                          : AppColors.accentColor.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Popular Courses section
            _buildSectionHeader('Popular Courses'),
            const SizedBox(height: 12),
            _buildCourseCardStrip(const [2, 4, 7]),
            const SizedBox(height: 24),

            // Continue Learning section
            _buildSectionHeader('Continue Learning'),
            const SizedBox(height: 12),
            _buildCourseCardStrip(const [1]),
            const SizedBox(height: 24),

            // "Continue" or secondary section placeholder so layout doesn’t collapse
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scroll left or right above to see all courses',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  static const double _cardWidth = 168;
  static const double _cardHeight = 200;

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.accentColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCourseCardStrip(List<int> indexes) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: indexes.length,
        itemBuilder: (context, stripIndex) {
          final featuredIndex = indexes[stripIndex];
          return Padding(
            padding: EdgeInsets.only(right: stripIndex < indexes.length - 1 ? 12 : 0),
            child: _buildFeaturedCard(featuredIndex),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedCard(int index) {
    final item = _featuredItems[index];
    final title = item['title'] as String;
    final isIntro = item['isIntro'] as bool? ?? false;
    final imagePath = item['imagePath'] as String?;

    return GestureDetector(
      onTap: () => _navigateToFeaturedItem(index),
      child: Container(
        width: _cardWidth,
        height: _cardHeight,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image with dark overlay (for course cards with image)
            if (imagePath != null && !isIntro)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              ),
            if (imagePath != null && !isIntro)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            // Intro card: show logo
            if (isIntro)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/suitableFocus.png',
                        width: 56,
                        height: 56,
                        fit: BoxFit.contain,
                        errorBuilder: (_, _, _) => Icon(
                          Icons.school,
                          color: Colors.black,
                          size: 48,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Intro to SF Courses',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            // Course card: star top-right, title bottom-left, duration bottom-right
            if (!isIntro) ...[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.star_outline,
                    color: imagePath != null ? Colors.white : Colors.black,
                    size: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: imagePath != null ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      shadows: imagePath != null
                          ? [
                              const Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Colors.black,
                              ),
                            ]
                          : null,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: imagePath != null ? Colors.white : Colors.black,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          '1 hr',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventsScreen()),
            );
          } else if (index == 2) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicesScreen()),
            );
          } else if (index == 4) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CommunityScreen()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.inputBackground,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}
