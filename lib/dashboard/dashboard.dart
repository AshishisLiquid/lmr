import 'package:flutter/material.dart';
import 'package:lmr/shared/shared.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue[400],
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
