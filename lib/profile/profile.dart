import 'package:flutter/material.dart';
import 'package:lmr/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ElevatedButton(
          child: const Text('signout'),
          onPressed: () async {
            await AuthService().signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          }),
    );
  }
}