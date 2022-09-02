import 'package:lmr/routes.dart';
// import 'package:lmr/services/firestore.dart';
// import 'package:lmr/services/models.dart';
// import 'package:lmr/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:lmr/themes.dart';
// import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  // Create the initialization Future outside of `build`:
  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text('error', textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              routes: appRoutes,
              // theme: appTheme,
              debugShowCheckedModeBanner: false,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text('loading', textDirection: TextDirection.ltr,);
      },
    );
  }
}