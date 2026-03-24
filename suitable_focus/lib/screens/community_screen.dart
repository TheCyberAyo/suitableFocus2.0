import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'events_screen.dart';
import 'services_screen.dart';
import 'learn_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentIndex = 4; // Community tab is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.accentColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Community',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.groups,
                  size: 80,
                  color: AppColors.accentColor.withValues(alpha: 0.8),
                ),
                const SizedBox(height: 24),
                Text(
                  'SF Community',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Connect with fellow entrepreneurs.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
          } else if (index == 3) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnScreen()),
            );
          } else {
            setState(() => _currentIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.inputBackground,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Community'),
        ],
      ),
    );
  }
}
