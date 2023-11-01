import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/zetpeak_widget.dart';
import '../../../widgets/round_button.dart';
import 'forgot_password_otp_controller.dart';

class MobileForgotPassword extends StatefulWidget {
  const MobileForgotPassword({Key? key}) : super(key: key);

  @override
  State<MobileForgotPassword> createState() => _MobileForgotPasswordState();
}

class _MobileForgotPasswordState extends State<MobileForgotPassword> {
  final forgotpasswordmobilenumberEditingController = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgotpasswordmobilenumberField = TextFormField(
      autofocus: false,
      controller: forgotpasswordmobilenumberEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp(r'^.{12,}$');
        if (value!.isEmpty) {
          return "Please Enter Mobile Number With Country Code";
        }
        if (!regex.hasMatch(value)) {
          return "Please Enter a Valid Mobile Number";
        }
      },
      onSaved: (value) {
        forgotpasswordmobilenumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone_android,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Enter Your Mobile Number",
        labelText: "Enter Your Mobile Number",
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  forgotpasswordmobilenumberField,
                  const SizedBox(height: 50),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                      child: RoundButton(
                        loading: loading,
                        title: "Submit",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            verifyNumber();
                          }
                        },
                      )),
                  const SizedBox(height: 120),
                  const ZetpeakLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyNumber() {
    setState(() {
      loading = true;
    });
    _auth.verifyPhoneNumber(
        phoneNumber: forgotpasswordmobilenumberEditingController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) => {
                print("You are logged in"),
              });
          setState(() {
            loading = false;
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
          setState(() {
            loading = false;
          });
        },
        codeSent: (String verificationID, int? resendToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OTPForgot(verificationID: verificationID)));
          setState(() {
            loading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
