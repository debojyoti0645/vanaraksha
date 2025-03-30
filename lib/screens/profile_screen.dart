import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Image
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                    backgroundImage: const AssetImage(
                      'lib/assets/images/post.jpeg',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: theme.colorScheme.surface,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // User Info
            Text(
              'User ID',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 5),
            Text(
              'Forest Guardian',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            // Stats Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(context, 'Reports', '23'),
                  _buildStatColumn(context, 'Trees Planted', '15'),
                  _buildStatColumn(context, 'Points', '450'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Menu Items
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildMenuItem(context, Icons.notifications, 'Notifications'),
                  Divider(height: 1, color: theme.dividerColor),
                  _buildMenuItem(context, Icons.settings, 'Settings'),
                  Divider(height: 1, color: theme.dividerColor),
                  _buildMenuItem(context, Icons.help, 'Help & Support'),
                  Divider(height: 1, color: theme.dividerColor),
                  _buildMenuItem(context, Icons.logout, 'Logout', isDestructive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String title, String value) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {bool isDestructive = false}) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon, 
        color: isDestructive ? theme.colorScheme.error : theme.colorScheme.primary,
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: isDestructive ? theme.colorScheme.error : null,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () async {
        if (title == 'Logout') {
          final bool? confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Logout', style: theme.textTheme.titleLarge),
              content: Text(
                'Are you sure you want to logout?',
                style: theme.textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ],
            ),
          );

          if (confirm == true && mounted) {
            await Provider.of<UserProvider>(context, listen: false).logout();
            if (mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (Route<dynamic> route) => false,
              );
            }
          }
        } else if (title == 'Settings') {
          Navigator.of(context).pushNamed('/settings');
        }
      },
    );
  }
}