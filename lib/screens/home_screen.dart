import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hustle Kingdom'),
        backgroundColor: const Color(0xFF008751),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF008751), Color(0xFF00C853)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total Balance', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 5),
                      const Text('₦12,500', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                        child: const Text('+₦500 today', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  const Icon(Icons.account_balance_wallet, size: 50, color: Colors.white70),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Daily Hustle Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                _taskCard('Watch Ads', '₦50/task', Icons.play_circle, Colors.orange),
                _taskCard('Follow & Earn', '₦100/task', Icons.favorite, Colors.pink),
                _taskCard('Spin Wheel', 'Up to ₦1000', Icons.casino, Colors.purple),
                _taskCard('Refer Friends', '₦500/refer', Icons.people, Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.yellow.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.yellow.shade200)),
              child: Row(
                children: [
                  const Icon(Icons.emoji_events, color: Colors.orange, size: 40),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HK Hustler Leaderboard', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Top hustler today earned ₦15,000 - Join now!', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('View')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskCard(String title, String reward, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 30),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(reward, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}
