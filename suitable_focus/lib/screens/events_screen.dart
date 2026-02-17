import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';
import 'learn_screen.dart';
import 'community_screen.dart';
import 'services_screen.dart';
import 'cart_screen.dart';

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
                                decoration: BoxDecoration(
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
                      'Bayhill Annual tournament',
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Entrepreneur Incubation Hub',
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

                    // Campaigns Section
                    _buildSectionHeader('Campaigns', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Bayhill Annual tournament',
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Entrepreneur Incubation Hub',
                    ]),
                    _buildPaginationDots(3, 0),

                    const SizedBox(height: 32),

                    // Past Events Section
                    _buildSectionHeader('Past Events', Icons.arrow_forward_ios),
                    const SizedBox(height: 12),
                    _buildEventCardList([
                      "Let's Elevate: The Tangible Way",
                      'Suitable Focus x SARS | Tax 101',
                      'Suitable Focus x Decode Africa Webinar',
                      'Entrepreneur Incubation Hub',
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
                      'Entrepreneur Incubation Hub',
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
          final isLetsElevate = eventNames[index].contains("Let's Elevate");
          final isBayhill = eventNames[index].contains("Bayhill");
          final isDecodeAfrica = eventNames[index].contains("Decode Africa");
          final isSARS = eventNames[index].contains("Suitable Focus x SARS");
          final isEduvos = eventNames[index].contains("Entrepreneur Incubation Hub");
          final hasBackgroundImage = isLetsElevate || isBayhill || isDecodeAfrica || isSARS || isEduvos;
          String? imagePath;
          if (isLetsElevate) {
            imagePath = 'assets/images/LetsElevate.jpg';
          } else if (isBayhill) {
            imagePath = 'assets/images/Bayhill.jpg';
          } else if (isDecodeAfrica) {
            imagePath = 'assets/images/Afriq.jpg';
          } else if (isSARS) {
            imagePath = 'assets/images/SARS-Webinar.jpeg';
          } else if (isEduvos) {
            imagePath = 'assets/images/SF-x-Eduvos.jpg';
          }
          return GestureDetector(
            onTap: () {
              _showEventDetailsModal(
                context,
                eventNames[index],
                imagePath,
                hasBackgroundImage,
              );
            },
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(12),
                image: hasBackgroundImage && imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.5),
                          BlendMode.darken,
                        ),
                      )
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.star,
                      color: hasBackgroundImage ? Colors.white : Colors.black,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    eventNames[index],
                    style: TextStyle(
                      color: hasBackgroundImage ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      shadows: hasBackgroundImage
                          ? [
                              Shadow(
                                offset: const Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black,
                              ),
                            ]
                          : null,
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

  void _showEventDetailsModal(
    BuildContext context,
    String eventName,
    String? imagePath,
    bool hasBackgroundImage,
  ) {
    // Sample data - in a real app, this would come from a data model
    final venue = _getVenueForEvent(eventName);
    final time = _getTimeForEvent(eventName);
    final ticketAmount = _getTicketAmountForEvent(eventName);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Event Image
            if (hasBackgroundImage && imagePath != null)
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event,
                      size: 64,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      eventName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

            // Event Details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Venue Section
                    _buildDetailRow(
                      icon: Icons.location_on,
                      label: 'Venue',
                      value: venue,
                    ),
                    const SizedBox(height: 20),

                    // Time Section
                    _buildDetailRow(
                      icon: Icons.access_time,
                      label: 'Time',
                      value: time,
                    ),
                    const SizedBox(height: 20),

                    // Ticket Amount Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.accentColor.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.confirmation_number,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ticket Price',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  ticketAmount,
                                  style: TextStyle(
                                    color: AppColors.accentColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // Buttons Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                border: Border(
                  top: BorderSide(
                    color: AppColors.accentColor.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Back Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: AppColors.accentColor,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Add to Cart Button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                        final cartProvider = Provider.of<CartProvider>(context, listen: false);
                        final cartItem = CartItem(
                          id: eventName.toLowerCase().replaceAll(' ', '_'),
                          name: eventName,
                          venue: venue,
                          time: time,
                          amount: ticketAmount,
                          imagePath: imagePath,
                        );
                        cartProvider.addItem(cartItem);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$eventName added to cart!'),
                            backgroundColor: AppColors.accentColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.accentColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart, size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accentColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.accentColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getVenueForEvent(String eventName) {
    if (eventName.contains("Let's Elevate")) {
      return 'Cape Town Convention Centre';
    } else if (eventName.contains("Bayhill")) {
      return 'Bayhill Sports Complex';
    } else if (eventName.contains("SARS")) {
      return 'Online Webinar';
    } else if (eventName.contains("Decode Africa")) {
      return 'Virtual Event Platform';
    } else if (eventName.contains("Incubation Hub")) {
      return 'Suitable Focus HQ';
    }
    return 'TBA - To Be Announced';
  }

  String _getTimeForEvent(String eventName) {
    if (eventName.contains("Let's Elevate")) {
      return 'Saturday, March 15, 2024 • 10:00 AM - 4:00 PM';
    } else if (eventName.contains("Bayhill")) {
      return 'Sunday, March 20, 2024 • 2:00 PM - 6:00 PM';
    } else if (eventName.contains("SARS")) {
      return 'Wednesday, March 25, 2024 • 6:00 PM - 8:00 PM';
    } else if (eventName.contains("Decode Africa")) {
      return 'Friday, March 28, 2024 • 7:00 PM - 9:00 PM';
    } else if (eventName.contains("Incubation Hub")) {
      return 'Monday, April 1, 2024 • 9:00 AM - 5:00 PM';
    }
    return 'Date and time to be announced';
  }

  String _getTicketAmountForEvent(String eventName) {
    if (eventName.contains("Let's Elevate")) {
      return 'R500';
    } else if (eventName.contains("Bayhill")) {
      return 'R300';
    } else if (eventName.contains("SARS")) {
      return 'Free';
    } else if (eventName.contains("Decode Africa")) {
      return 'R250';
    } else if (eventName.contains("Incubation Hub")) {
      return 'R1,200';
    }
    return 'TBA';
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
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicesScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnScreen()),
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

