import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _currentIndex = 1; // Events tab is active

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
                    Icons.calendar_view_week,
                    color: AppColors.accentColor,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Events',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.accentColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: AppColors.accentColor,
                    ),
                    onPressed: () {},
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
                    color: AppColors.accentColor.withOpacity(0.3),
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
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // My Events Section
                    _buildSectionHeader('My Events', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                    ]),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // Filter Section
                    _buildSectionHeader('Filter', Icons.menu),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildFilterButton(Icons.shopping_cart, 'Biz'),
                          _buildFilterButton(Icons.menu_book, 'Work'),
                          _buildFilterButton(Icons.attach_money, 'Fun'),
                          _buildFilterButton(Icons.grid_view, 'Other'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Featured Section
                    _buildSectionHeader('Featured', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Event Name',
                      'Event Name',
                    ]),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // Near You Section
                    _buildSectionHeader('Near You', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Event Name',
                      'Event Name',
                    ]),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // Recommendations Section
                    _buildSectionHeader('Recommendations', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Event Name',
                      'Event Name',
                    ]),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // See All Section
                    _buildSectionHeader('See All', Icons.arrow_forward_ios),

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

  Widget _buildSectionHeader(String title, IconData icon) {
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
          Icon(
            icon,
            color: AppColors.accentColor,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildEventCardList(List<String> eventNames) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: eventNames.length,
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  eventNames[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: AppColors.accentColor,
                          size: 16,
                        ),
                        const Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.accentColor.withOpacity(0.3),
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

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
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
            Navigator.pop(context);
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Trending',
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

