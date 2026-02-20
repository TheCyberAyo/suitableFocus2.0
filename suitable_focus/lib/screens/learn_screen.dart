import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/cart_provider.dart';
import 'events_screen.dart';
import 'community_screen.dart';
import 'services_screen.dart';
import 'cart_screen.dart';
import 'course_intro_screen.dart';
import 'ideation_foundation_course_screen.dart';
import 'where_do_i_start_course_screen.dart';
import 'ideal_customer_profile_course_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _currentIndex = 3; // Learn tab is active

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
                  // Logo
                  Image.asset(
                    'assets/images/suitableFocus.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  // User Avatar
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.accentColor,
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Greeting - Centered
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Hello, Ayongezwa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // Search Icon
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.accentColor,
                    ),
                    onPressed: () {},
                  ),
                  // Cart Icon
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Continue Section
                    _buildSectionHeader('Continue', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildContinueItem(
                      Icons.menu_book,
                      'SARS Compliance 101',
                      '10%',
                      0.10,
                    ),
                    _buildContinueItem(
                      Icons.lightbulb,
                      "Let's Elevate",
                      '10%',
                      0.10,
                    ),
                    _buildContinueItem(
                      Icons.groups,
                      'Eduvos x SF Hub',
                      '10%',
                      0.10,
                    ),

                    const SizedBox(height: 24),

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
                            Icon(
                              Icons.search,
                              color: AppColors.accentColor,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'What Are We Doing Today?',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: AppColors.accentColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(Icons.shopping_cart, 'Book'),
                          _buildActionButton(Icons.menu_book, 'Learn'),
                          _buildActionButton(Icons.attach_money, 'Earn'),
                          _buildActionButton(Icons.calendar_view_week, 'Attend'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Featured Section
                    _buildSectionHeader('Featured', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final courses = [
                            'Introduction to SF courses',
                            'Ideation to Foundation',
                            'Where Do I Start?',
                            'Ideal Customer Profile',
                            'Content Strategy',
                          ];
                          final images = [
                            'assets/images/suitableFocus.png',
                            'assets/images/ideation_to_foundation.png',
                            'assets/images/where_do_i_start.png',
                            'assets/images/ideal_customer_profile.png',
                            'assets/images/contentStrategy.jpeg',
                          ];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to course intro screen for "Introduction to SF courses"
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CourseIntroScreen(),
                                  ),
                                );
                              }
                              // Navigate to Ideation to Foundation course
                              else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IdeationFoundationCourseScreen(),
                                  ),
                                );
                              }
                              // Navigate to Where Do I Start? course
                              else if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WhereDoIStartCourseScreen(),
                                  ),
                                );
                              }
                              // Navigate to Ideal Customer Profile course
                              else if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IdealCustomerProfileCourseScreen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 160,
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.5),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    courses[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        '1hr',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 3,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildPaginationDots(2, 0),

                    const SizedBox(height: 32),

                    // Recommendation Section
                    _buildSectionHeader('Recommendation', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          final course = 'Ideal Customer Profile';
                          final image = 'assets/images/nagotiation.jpeg';
                          return Container(
                            width: 160,
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withValues(alpha: 0.5),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  course,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '1hr',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 3,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildPaginationDots(1, 0),

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

  Widget _buildSectionHeader(String title, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              color: AppColors.accentColor,
              size: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildContinueItem(IconData icon, String title, String progress, double progressValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.accentColor,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: progressValue,
                      strokeWidth: 4,
                      backgroundColor: Colors.grey[800],
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentColor),
                    ),
                  ),
                  Text(
                    progress,
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.accentColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.accentColor,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationDots(int total, int current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == current ? AppColors.accentColor : Colors.grey[800],
            shape: BoxShape.circle,
          ),
        );
      }),
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
          // Navigate based on index
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





