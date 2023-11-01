import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/users/screens/home_screen.dart';
import '/widgets/round_button.dart';
import '/widgets/zetpeak_widget.dart';
import '../screens/login_screen.dart';

final loginmobilenumberotpEditingController=TextEditingController();

final loginmobilenumberotpField = TextFormField(
  autofocus: false,
  controller: loginmobilenumberotpEditingController,
  keyboardType: TextInputType.number,
  validator: (value) {
    return null;
  },
  onSaved: (value) {
    loginmobilenumberotpEditingController.text = value!;
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


class OTPNumberLogin extends StatefulWidget {
  final String verificationID;
  const OTPNumberLogin({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<OTPNumberLogin> createState() => _OTPNumberLoginState();
}

class _OTPNumberLoginState extends State<OTPNumberLogin> {

  bool loading=false;

  final _formKey=GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
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
            padding:const EdgeInsets.fromLTRB(20,20,20,0),
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
                  loginmobilenumberotpField,
                  const SizedBox(height:20 ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45,20,45,0),
                      child: RoundButton(
                        loading: loading,
                        title: "Login",
                        onTap: () {
                          verifycode();
                        },
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45,20,45,0),
                      child: RoundButton(
                        title: "Resend Code",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
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

  void verifycode() async {
    setState(() {
      loading=true;
    });
    final credential = PhoneAuthProvider.credential(verificationId: widget.verificationID, smsCode: loginmobilenumberotpEditingController.text);

    try{
      await _auth.signInWithCredential(credential);
      Fluttertoast.showToast(msg: "OTP is Verified");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      setState(() {
        loading=false;
      });
    }catch(err){
      Fluttertoast.showToast(msg: "Invalid OTP");
      setState(() {
        loading=false;
      });
    };
  }
}
