import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Tasks'), backgroundColor: const Color(0xFF008751)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Complete tasks and earn instantly!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          _taskItem(context, 'Watch 5 Ads', 'Watch short ads for 30s each', '₦250', Icons.play_circle_fill, false),
          _taskItem(context, 'Follow Instagram Page', 'Follow @naija.hk.hustle', '₦100', Icons.camera_alt, true),
          _taskItem(context, 'Invite 3 Friends', 'Share your referral link', '₦1500', Icons.share, false),
          _taskItem(context, 'Daily Check-in', 'Login everyday bonus', '₦50', Icons.calendar_today, true),
          _taskItem(context, 'Spin & Win', 'Spin the lucky wheel', '₦1000', Icons.casino, false),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrange]), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SPECIAL OFFER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Complete all tasks today and get extra ₦500 bonus!', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white), child: const Text('Claim', style: TextStyle(color: Colors.deepOrange))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskItem(BuildContext context, String title, String desc, String reward, IconData icon, bool completed) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: completed ? Colors.green.shade100 : Colors.orange.shade100, child: Icon(icon, color: completed ? Colors.green : Colors.orange)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, decoration: completed ? TextDecoration.lineThrough : null)),
        subtitle: Text(desc),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(reward, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF008751))),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: completed ? Colors.green : const Color(0xFF008751), borderRadius: BorderRadius.circular(20)),
              child: Text(completed ? 'Done' : 'Start', style: const TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ],
        ),
        onTap: () {
          if (!completed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Starting $title... +$reward will be added to wallet!')));
          }
        },
      ),
    );
  }
}
