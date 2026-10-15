import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  double _balance = 0.0;
  double get balance => _balance;

  int _points = 0;
  int get points => _points;

  Future<void> fetchWallet() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        _balance = (doc.data()?['balance'] ?? 0).toDouble();
        _points = doc.data()?['points'] ?? 0;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Wallet fetch error: $e');
    }
  }

  Future<void> addReward(double amount, int points) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      _balance += amount;
      _points += points;

      await _firestore.collection('users').doc(user.uid).set({
        'balance': _balance,
        'points': _points,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      notifyListeners();
    } catch (e) {
      debugPrint('Add reward error: $e');
    }
  }

  Future<void> withdraw(double amount) async {
    if (_balance >= amount) {
      _balance -= amount;
      notifyListeners();
      
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'balance': _balance,
        });
      }
    }
  }
}
