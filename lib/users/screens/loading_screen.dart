import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetcare/dashboard/userdashboard/main_screen.dart';
import 'package:zetcare/users/screens/welcome_screen.dart';
import 'package:zetcare/widgets/zetpeak_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAppropriateScreen();
  }

  _navigateToAppropriateScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});

    if (FirebaseAuth.instance.currentUser != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/zetcare_logo.png'),
          ),
        ],
      ),
      bottomNavigationBar: const ZetpeakLogo(),
    );
  }
}
