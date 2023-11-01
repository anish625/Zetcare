import 'package:flutter/material.dart';
import 'package:zetcare/users/screens/register_screen.dart';
import '/widgets/round_button.dart';
import '/widgets/zetpeak_widget.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool loginloading = false;
  bool registerloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[700],
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.call,
                  size: 24,
                  color: Colors.red[700],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Row(
              children: [
                SizedBox(width: 75),
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 15, 50, 10),
              child: Center(
                child: Image.asset('assets/zetcare_logo.png'),
              ),
            ),
            const SizedBox(height: 120),
            Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: RoundButton(
                  title: "Login",
                  loading: loginloading,
                  onTap: () {
                    setState(() {
                      loginloading = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: RoundButton(
                  loading: registerloading,
                  title: "Register",
                  onTap: () {
                    setState(() {
                      registerloading = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                )),
            const SizedBox(height: 10),
            const ZetpeakLogo(),
          ],
        ),
      ),
    );
  }
}
