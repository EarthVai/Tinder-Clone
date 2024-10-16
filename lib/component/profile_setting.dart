import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Setting Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to profile_screen.dart
            },
            child: const Text('Done', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Subscription Options
          _buildSubscriptionOption(
            'tinder platinum',
            'สิทธิพิเศษสูงที่สุดยิ่งกว่าสองแผนล่าง กดเลย!',
            Colors.grey,
            'assets/images/tinder.png',
          ),
          _buildSubscriptionOption(
            'tinder gold',
            'ดูว่าใคร Like คุณและสิทธิพิเศษอีกเพียบ!',
            Colors.amber,
            'assets/images/tinder.png',
          ),
          _buildSubscriptionOption(
            'tinder +',
            'Like ได้ไม่อั้นและสิทธิพิเศษอีกเพียบ!',
            Colors.red,
            'assets/images/tinder.png',
          ),

          const SizedBox(height: 20),

          // Features Section
          _buildFeatureOption('รับ Super Like เพิ่ม', Colors.blue, Icons.star),
          _buildFeatureOption('รับ Boost เพิ่ม', Colors.purple, Icons.flash_on),
          _buildFeatureOption(
              'เปิดโหมดซ่อนแอป', Colors.grey, Icons.visibility_off),
          _buildFeatureOption('ซื้อโหมด Passport™', Colors.red, Icons.flight),

          const SizedBox(height: 20),
          const Divider(color: Colors.grey),

          // Account Settings Section
          _buildAccountSettingsSection(context),

          // Privacy Section
          const SizedBox(height: 20),
          _buildSectionTitle('Privacy'),
          _buildSettingOption(context, 'Cookie Policy'),
          _buildSettingOption(context, 'Privacy Policy'),
          _buildSettingOption(context, 'Privacy Preferences'),
          _buildSettingOption(context, 'Privacy Forms'),

          // Legal Section
          const SizedBox(height: 20),
          _buildSectionTitle('Legal'),
          _buildSettingOption(context, 'Licenses'),
          _buildSettingOption(context, 'Terms of Service'),

          // Logout and App Version Section
          const SizedBox(height: 20),
          _buildLogoutSection(),
          _buildAppVersion(),
        ],
      ),
    );
  }

  // Subscription Options Widget
  Widget _buildSubscriptionOption(
    String title,
    String subtitle,
    Color color,
    String imagePath,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40, height: 40), // Subscription logo
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  // Feature Options Widget
  Widget _buildFeatureOption(String title, Color color, IconData icon) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: () {
        // Implement feature purchase action
      },
    );
  }

  // Account Settings Section
  Widget _buildAccountSettingsSection(BuildContext context) {
    return Column(
      children: [
        _buildAccountSettingOption(context, 'หมายเลขโทรศัพท์', '66805151542'),
        _buildAccountSettingOption(context, 'บัญชีที่เชื่อมต่อไว้', ''),
        _buildAccountSettingOption(context, 'อีเมล', 'earthearthv@gmail.com'),
      ],
    );
  }

  // Single Account Setting Option Widget
  Widget _buildAccountSettingOption(
      BuildContext context, String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Implement account settings action
      },
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey[500], fontSize: 16),
      ),
    );
  }

  // Single Setting Option Widget
  Widget _buildSettingOption(BuildContext context, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[500]),
      onTap: () {
        // Navigate to the specific settings page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }

  // Logout Section Widget
  Widget _buildLogoutSection() {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        ListTile(
          title: const Center(
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () {
            // Handle log out logic
          },
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }

  // App Version Section Widget
  Widget _buildAppVersion() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Column(
            children: [
              Image.asset('assets/images/tinder.png',
                  width: 50), // Tinder logo
              const SizedBox(height: 10,),
              Text(
                'Version 15.18.0',
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
