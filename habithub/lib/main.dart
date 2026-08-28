import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habithub/Auth/Bloc/auth_bloc.dart';
import 'package:habithub/Auth/services/auth_service.dart';
import 'package:habithub/Auth/user_Bloc/user_bloc.dart';
import 'package:habithub/firebase_options.dart';
import 'package:habithub/views/splash_screen_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          authService: AuthService(),
        ),
      ),

      BlocProvider(
        create: (_) => UserBloc(),
      ),
    ],
    child: const MyApp(),
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HabitHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF22C55E)),
      ),
      home: const SplashScreenView(),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:habithub/Auth/Bloc/auth_bloc.dart';
// import 'package:habithub/Auth/services/auth_service.dart';
// import 'package:habithub/Auth/user_Bloc/user_bloc.dart';
// import 'package:habithub/firebase_options.dart';
// import 'package:habithub/views/main_navigation_view.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // Temporary development setup.
//   // Bypasses the normal Splash/Auth flow.

//   FirebaseFirestore.instance.settings = const Settings(
//     persistenceEnabled: false,
//   );

//   final auth = FirebaseAuth.instance;

//   try {
//     if (auth.currentUser == null) {
//       await auth.signInAnonymously();
//     }

//     debugPrint('DEV USER UID: ${auth.currentUser?.uid}');
//   } catch (e) {
//     debugPrint('ANONYMOUS AUTH ERROR: $e');
//   }

//   runApp(const HabitHubDevApp());
// }

// class HabitHubDevApp extends StatelessWidget {
//   const HabitHubDevApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'HabitHub',

//       theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),

//       home: MultiBlocProvider(
//         providers: [
//           BlocProvider<AuthBloc>(
//             create: (_) => AuthBloc(authService: AuthService()),
//           ),

//           BlocProvider<UserBloc>(create: (_) => UserBloc()),
//         ],

//         child: const MainNavigationView(),
//       ),
//     );
//   }
// }
