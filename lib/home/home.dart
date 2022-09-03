import 'package:flutter/material.dart';
import 'package:lmr/auth/login.dart';
import 'package:lmr/auth/register.dart';
import 'package:lmr/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: AuthService().userStream,
    builder: ((context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
            return const RegistrationScreen();
          } else {
            return const LoginScreen();
        }
    }));
  }
}