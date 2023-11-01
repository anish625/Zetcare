import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/users/screens/home_screen.dart';
import '../../../widgets/round_button.dart';
import '../../../widgets/zetpeak_widget.dart';
import '../screens/login_screen.dart';
import 'email_login_controller.dart';


class OTPEmailLogin extends StatefulWidget {
  final EmailOTP myauth;
  const OTPEmailLogin({Key? key, required this.myauth}) : super(key: key);

  @override
  State<OTPEmailLogin> createState() => _OTPEmailLoginState();
}

class _OTPEmailLoginState extends State<OTPEmailLogin> {
  final loginemailotpEditingController=TextEditingController();

  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    loginemailotpEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final loginemailotpField = TextFormField(
      autofocus: false,
      controller: loginemailotpEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        loginemailotpEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.password_outlined,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Enter OTP",
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black54),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/zetcare_logo.png"),
                  ),
                  const Text(
                    "1:30",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  loginemailotpField,
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                      child: RoundButton(
                        loading: loading,
                        title: "Login",
                        onTap: () async {
                          if(await widget.myauth.verifyOTP(otp: loginemailotpEditingController.text)==true){
                            Fluttertoast.showToast(msg: "OTP is Verified");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                          }
                          else{
                            Fluttertoast.showToast(msg: "Invalid OTP");
                          }
                        },
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                      child: RoundButton(
                        title: "Resend Code",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const EmailLogin()));
                        },
                      )
                  ),
                  const SizedBox(height: 60),
                  const ZetpeakLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}