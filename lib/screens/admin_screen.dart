import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Control - Boss Only'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _adminCard(context, 'Total Users', '10,245', Icons.people, Colors.blue, '/admin/users'),
            _adminCard(context, 'Total Revenue', '₦2.5M', Icons.attach_money, Colors.green, '/admin/revenue'),
            _adminCard(context, 'Pending Payouts', '45 Requests', Icons.pending, Colors.orange, '/admin/payouts'),
            _adminCard(context, 'Manage Tasks', '12 Active', Icons.task, Colors.purple, '/admin/tasks'),
            _adminCard(context, 'Push Message', 'Send Notice', Icons.notifications_active, Colors.red, '/admin/push'),
            _adminCard(context, 'Settings', 'App Config', Icons.settings, Colors.grey, '/admin/settings'),
          ],
        ),
      ),
    );
  }

  Widget _adminCard(BuildContext context, String title, String value, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          border: Border.all(color: color.withOpacity(0.2)),
       
