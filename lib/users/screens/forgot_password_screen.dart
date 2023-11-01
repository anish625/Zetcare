import 'package:flutter/material.dart';
import '../forgot_passwords/email_forgot_password.dart';
import '../forgot_passwords/mobile_forgot_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Image(
                  image: AssetImage('assets/zetcare_logo.png'),
                ),
              ),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color:Colors.red[700],
                    borderRadius:BorderRadius.circular(20),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: "Email",),
                    Tab(text: "Mobile Phone",),
                  ],
                ),
              ),
              const Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: EmailForgotPassword()),
                      Center(child: MobileForgotPassword()),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
