import 'package:flutter/material.dart';
import 'package:tugas7/constants/app_theme.dart';
import 'package:tugas7/widgets/side_menu.dart';
import 'package:tugas7/services/storage_service.dart';

class DashboardPage extends StatelessWidget {
  final StorageService _storageService = StorageService();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 1,
        shadowColor: AppTheme.sageGreen.withOpacity(0.3),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            FutureBuilder<String?>(
              future: _storageService.getUsername(),
              builder: (context, snapshot) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.sageGreenDark,
                        AppTheme.sageGreen,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.sageGreen.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back,',
                        style: AppTheme.subtitle.copyWith(
                          color: AppTheme.pureWhite.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        snapshot.data ?? 'User',
                        style: AppTheme.heading1.copyWith(
                          color: AppTheme.pureWhite,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.pureWhite.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'You\'re all set!',
                          style: AppTheme.subtitle.copyWith(
                            color: AppTheme.pureWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),

            // Quick Stats
            Text(
              'Quick Stats',
              style: AppTheme.heading3,
            ),
            const SizedBox(height: 16),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard(
                  icon: Icons.task_alt,
                  title: 'Tasks',
                  value: '12',
                  color: AppTheme.sageGreenDark,
                ),
                _buildStatCard(
                  icon: Icons.trending_up,
                  title: 'Progress',
                  value: '85%',
                  color: AppTheme.accentGreen,
                ),
                _buildStatCard(
                  icon: Icons.notifications_active,
                  title: 'Notifications',
                  value: '5',
                  color: AppTheme.sageGreen,
                ),
                _buildStatCard(
                  icon: Icons.star,
                  title: 'Points',
                  value: '240',
                  color: AppTheme.sageGreenDark,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Recent Activity
            Text(
              'Recent Activity',
              style: AppTheme.heading3,
            ),
            const SizedBox(height: 16),

            _buildActivityCard(
              icon: Icons.check_circle_outline,
              title: 'Task Completed',
              subtitle: 'You completed "Mobile Development"',
              time: '2 hours ago',
            ),
            const SizedBox(height: 12),
            _buildActivityCard(
              icon: Icons.edit_outlined,
              title: 'Profile Updated',
              subtitle: 'Your profile information was updated',
              time: '1 day ago',
            ),
            const SizedBox(height: 12),
            _buildActivityCard(
              icon: Icons.settings_outlined,
              title: 'Settings Changed',
              subtitle: 'Your preferences were saved',
              time: '3 days ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.pureWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.sageGreenLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.sageGreen.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 32,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTheme.heading2.copyWith(
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTheme.subtitle,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.pureWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.sageGreenLight, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.sageGreenLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppTheme.sageGreenDark,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTheme.subtitle,
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: AppTheme.subtitle.copyWith(
                    fontSize: 12,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
