import 'package:flutter/material.dart';
import '../login_controllers/email_login_controller.dart';
import '../login_controllers/mobilenumber_login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      Center(child: EmailLogin()),
                      Center(child: MobilenumberLogin()),
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
