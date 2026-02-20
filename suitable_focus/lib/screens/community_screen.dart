import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../providers/cart_provider.dart';
import 'events_screen.dart';
import 'learn_screen.dart';
import 'services_screen.dart';
import 'cart_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentIndex = 4; // Community tab is active
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _joinController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    _joinController.dispose();
    super.dispose();
  }

  Future<void> _confirmAndOpenExternalUrl(Uri url, String platform) async {
    final shouldOpen = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.inputBackground,
          title: Text(
            'Open External App',
            style: TextStyle(color: AppColors.accentColor),
          ),
          content: Text(
            'You are about to leave Suitable Focus and open $platform in an external app or browser.',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Continue', style: TextStyle(color: AppColors.accentColor)),
            ),
          ],
        );
      },
    );

    if (shouldOpen != true) return;

    final opened = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open $platform right now.'),
          backgroundColor: Colors.red[700],
        ),
      );
    }
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
                    // Connect With Us Section
                    _buildSectionHeader(
                      'Connect With Us!',
                      null,
                    ),
                    const SizedBox(height: 12),
                    _buildSocialMediaIcons(),

                    const SizedBox(height: 32),

                    // Here's What We've Been Up To Section
                    _buildSectionHeader(
                      "Here's What We've Been Up To",
                      Icons.arrow_forward_ios,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final activities = [
                            'Successful incubation with Eduvos',
                            'Building A Legacy with Rudy Paige',
                            'Unlocking AI with Eduvos',
                          ];
                          final images = [
                            'assets/images/incubation.jpg',
                            'assets/images/Rudy.jpg',
                            'assets/images/SuccessfulAi.jpg',
                          ];
                          return Container(
                            width: 200,
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
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                activities[index],
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
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // Send Us A Message Section
                    _buildSectionHeader('Send Us A Message', Icons.menu),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        children: [
                          TextField(
                            controller: _messageController,
                            maxLines: 5,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "What's On Your Mind?",
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              filled: true,
                              fillColor: AppColors.inputBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: AppColors.accentColor,
                                size: 24,
                              ),
                              onPressed: () {
                                // Handle send message
                                if (_messageController.text.isNotEmpty) {
                                  _messageController.clear();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // SF Family Perks Section
                    _buildSectionHeader('SF Family Perks', null),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          _buildPerkItem('Early Access to SF Events'),
                          _buildPerkItem('Up to 10% Discount on selected services'),
                          _buildPerkItem('Have access to the Founder\'s Weekly Wisdom'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Not Part of the SF Family? Section
                    _buildSectionHeader('Not Part of the SF Family?', null),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _joinController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter your email or code',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              filled: true,
                              fillColor: AppColors.inputBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle join
                                if (_joinController.text.isNotEmpty) {
                                  _joinController.clear();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentColor,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Join',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildSectionHeader(String title, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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

  Widget _buildPaginationDots(int total, int current) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Instagram Icon
          InkWell(
            onTap: () async {
              final instagramUrl = Uri.parse('https://www.instagram.com/suitablefocusptyltd');
              await _confirmAndOpenExternalUrl(instagramUrl, 'Instagram');
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
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
                Icons.camera_alt,
                color: AppColors.accentColor,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 24),
          // LinkedIn Icon
          InkWell(
            onTap: () async {
              final linkedInUrl = Uri.parse('https://www.linkedin.com/company/suitable-focus/posts/?feedView=all');
              await _confirmAndOpenExternalUrl(linkedInUrl, 'LinkedIn');
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
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
                Icons.business,
                color: AppColors.accentColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerkItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: AppColors.accentColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          if (text.isNotEmpty)
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
        ],
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
          } else if (index == 3) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnScreen()),
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

