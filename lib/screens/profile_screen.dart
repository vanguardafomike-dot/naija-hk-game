import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), backgroundColor: const Color(0xFF008751)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(radius: 50, backgroundColor: Color(0xFF008751), child: Icon(Icons.person, size: 50, color: Colors.white)),
                const SizedBox(height: 12),
                const Text('Hustler Mike', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('vanguardafomike@gmail.com', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(20)),
                  child: const Text('Level 5 - Oga Hustler', style: TextStyle(color: Color(0xFF008751), fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _profileTile(Icons.share, 'My Referral Link', 'Earn ₦500 per friend', Colors.blue),
          _profileTile(Icons.leaderboard, 'My Rank', '#245 in Nigeria', Colors.orange),
          _profileTile(Icons.security, 'KYC Verification', 'Verified', Colors.green),
          _profileTile(Icons.headset_mic, 'Support', 'Chat with us', Colors.purple),
          _profileTile(Icons.settings, 'Settings', '', Colors.grey),
          const SizedBox(height: 20),
          Card(
            color: Colors.orange.shade50,
            child: ListTile(
              leading: const Icon(Icons.admin_panel_settings, color: Colors.orange),
              title: const Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Only for owner'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/admin'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTile(IconData icon, String title, String subtitle, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
        title: Text(title),
        subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}
