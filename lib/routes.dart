import 'package:lmr/auth/login.dart';
import 'package:lmr/dashboard/dashboard.dart';
import 'package:lmr/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/dashboard': (context) => const DashboardScreen(),
};