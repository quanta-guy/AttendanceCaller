import 'package:attendace_caller_app/PADisplay.dart';
import 'package:attendace_caller_app/login.dart';
import 'package:attendace_caller_app/selectionPanel.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const Attendance());
}

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Calling app',
      initialRoute: '/',
      routes: {
        '/first': (context) => const LoginScreen(),
        '/second': (context) => const SelectionPanel(),
        '/third': (context) => DataEntryScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

@override
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: const Duration(milliseconds: 1500),
      centered: true,
      splash: 'assets/SplashScreen.png',
      duration: 1000,
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
      splashIconSize: 350,
    );
  }
}
