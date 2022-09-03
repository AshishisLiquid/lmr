import 'package:lmr/auth/login.dart';
import 'package:lmr/auth/register.dart';
import 'package:lmr/dashboard/dashboard.dart';
import 'package:lmr/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/complete-application': (context) => const RegistrationScreen(),
  '/dashboard': (context) => const DashboardScreen(),
};