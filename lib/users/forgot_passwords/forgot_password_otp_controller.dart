import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/round_button.dart';
import '/widgets/zetpeak_widget.dart';
import 'mobile_forgot_password.dart';
import 'new_password.dart';

class OTPForgot extends StatefulWidget {
  final String verificationID;
  const OTPForgot({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<OTPForgot> createState() => _OTPForgotState();
}

class _OTPForgotState extends State<OTPForgot> {
  final _formKey=GlobalKey<FormState>();
  final forgotpasswordotpEditingController=TextEditingController();
  bool loading=false;

  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    forgotpasswordotpEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final forgotpasswordotpField = TextFormField(
      autofocus: false,
      controller: forgotpasswordotpEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        forgotpasswordotpEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.password_outlined,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Enter OTP",
        labelText: "Enter OTP",
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        // hintText: "Password",
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
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MobileForgotPassword()));
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
                  forgotpasswordotpField,
                  const SizedBox(height:20 ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45,20,45,0),
                      child: RoundButton(
                        title: "Set New Password",
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const MobileForgotPassword()));
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
    final credential = PhoneAuthProvider.credential(verificationId: widget.verificationID, smsCode: forgotpasswordotpEditingController.text);

    try{
      await _auth.signInWithCredential(credential);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassword()));
      Fluttertoast.showToast(msg: "OTP Verified");
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
