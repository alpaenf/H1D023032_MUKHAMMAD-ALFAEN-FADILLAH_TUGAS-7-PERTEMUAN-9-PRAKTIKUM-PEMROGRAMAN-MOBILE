import 'package:flutter/material.dart';
import 'package:tugas7/constants/app_theme.dart';
import 'package:tugas7/services/storage_service.dart';
import 'package:tugas7/routes/app_routes.dart';

class SideMenu extends StatelessWidget {
  final StorageService _storageService = StorageService();

  SideMenu({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await _storageService.logout();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppTheme.pureWhite,
        child: Column(
          children: [
            // Drawer Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.sageGreenDark,
                    AppTheme.sageGreen,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.pureWhite,
                      shape: BoxShape.circle,
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
                      size: 40,
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
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Welcome back!',
                    style: AppTheme.subtitle.copyWith(
                      color: AppTheme.pureWhite.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    route: AppRoutes.dashboard,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Profile',
                    route: AppRoutes.profile,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    route: AppRoutes.settings,
                  ),
                ],
              ),
            ),

            // Divider
            Divider(
              height: 1,
              color: AppTheme.sageGreen,
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.sageGreenLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: AppTheme.sageGreenDark,
                  ),
                ),
                title: Text(
                  'Logout',
                  style: AppTheme.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () => _handleLogout(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: Colors.transparent,
                hoverColor: AppTheme.sageGreenLight,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isSelected = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.sageGreenDark
                : AppTheme.sageGreenLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? AppTheme.pureWhite : AppTheme.sageGreenDark,
          ),
        ),
        title: Text(
          title,
          style: AppTheme.bodyText.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? AppTheme.sageGreenDark : AppTheme.textDark,
          ),
        ),
        selected: isSelected,
        selectedTileColor: AppTheme.sageGreenLight.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () {
          Navigator.pop(context); // Close drawer
          if (!isSelected) {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }
}
