import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet'), backgroundColor: const Color(0xFF008751)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: const Color(0xFF008751), borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  const Text('Available Balance', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  const Text('₦12,500.00', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_downward), label: const Text('Withdraw'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Color(0xFF008751)))),
                      const SizedBox(width: 12),
                      Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.history), label: const Text('History'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white24, foregroundColor: Colors.white))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transaction History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _txItem('Task Reward', '+₦100', 'Today 10:30 AM', Icons.task, Colors.green),
                  _txItem('Referral Bonus', '+₦500', 'Today 09:15 AM', Icons.people, Colors.blue),
                  _txItem('Withdrawal', '-₦5000', 'Yesterday', Icons.arrow_upward, Colors.red),
                  _txItem('Spin Win', '+₦250', 'Yesterday', Icons.casino, Colors.purple),
                  _txItem('Daily Check-in', '+₦50', '2 days ago', Icons.calendar_today, Colors.orange),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.info, size: 20),
                  SizedBox(width: 8),
                  Expanded(child: Text('Minimum withdrawal is ₦1000 via Opay, Palmpay or Bank Transfer. Instant payment!', style: TextStyle(fontSize: 11))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _txItem(String title, String amount, String time, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color, size: 20)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(time, style: const TextStyle(fontSize: 12)),
      trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold, color: amount.startsWith('+') ? Colors.green : Colors.red)),
    );
  }
}
