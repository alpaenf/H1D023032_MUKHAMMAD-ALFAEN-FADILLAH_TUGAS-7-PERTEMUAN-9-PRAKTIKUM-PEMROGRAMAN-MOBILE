import 'package:flutter/material.dart';
import 'package:tugas7/constants/app_theme.dart';
import 'package:tugas7/widgets/side_menu.dart';
import 'package:tugas7/services/storage_service.dart';

class ProfilePage extends StatelessWidget {
  final StorageService _storageService = StorageService();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 1,
        shadowColor: AppTheme.sageGreen.withOpacity(0.3),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
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
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.pureWhite,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.pureWhite,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppTheme.sageGreenDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FutureBuilder<String?>(
                    future: _storageService.getUsername(),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? 'User',
                        style: AppTheme.heading2.copyWith(
                          color: AppTheme.pureWhite,
                          fontSize: 26,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.pureWhite.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Active Member',
                      style: AppTheme.subtitle.copyWith(
                        color: AppTheme.pureWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Profile Information
            Text(
              'Profile Information',
              style: AppTheme.heading3,
            ),
            const SizedBox(height: 16),

            _buildInfoCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'user@example.com',
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: '+62 812 3456 7890',
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.location_on_outlined,
              title: 'Location',
              value: 'Jakarta, Indonesia',
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.cake_outlined,
              title: 'Joined',
              value: 'November 2025',
            ),
            const SizedBox(height: 32),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Edit profile feature coming soon!',
                        style: AppTheme.bodyText.copyWith(
                          color: AppTheme.pureWhite,
                        ),
                      ),
                      backgroundColor: AppTheme.sageGreenDark,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.sageGreenLight,
              borderRadius: BorderRadius.circular(12),
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
                  style: AppTheme.subtitle,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTheme.bodyText.copyWith(
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
}
