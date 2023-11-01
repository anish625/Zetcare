import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/forgot_button.dart';
import '/widgets/zetpeak_widget.dart';
import '../../../widgets/round_button.dart';
import 'otp_number_login_controller.dart';

class MobilenumberLogin extends StatefulWidget {
  const MobilenumberLogin({Key? key}) : super(key: key);

  @override
  State<MobilenumberLogin> createState() => _MobilenumberLoginState();
}

class _MobilenumberLoginState extends State<MobilenumberLogin> {
  bool loading=false;

  final _formKey = GlobalKey<FormState>();
  final loginmobilenumberEditingController = TextEditingController();
  final loginmobilenumberpasswordEditingController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final loginmobilenumberField = TextFormField(
      autofocus: false,
      controller: loginmobilenumberEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp(r'^.{13,}$');
        if(value!.isEmpty){
          return "Please Enter Mobile Number With Country Code";
        }
        if (!regex.hasMatch(value)) {
          return "Please Enter a Valid Mobile Number";
        }
        return null;
      },
      onSaved: (value) {
        loginmobilenumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone_android,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Mobile Number",
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        // hintText: "Mobile Number",
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
                  loginmobilenumberField,
                  const SizedBox(height: 20),
                  // loginmobilenumberpasswordField,
                  const ForgotButton(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45,20,45,0),
                      child: RoundButton(
                        loading: loading,
                        title: "Login",
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            verifyNumber();
                          }
                        },
                      )
                  ),
                  const SizedBox(height: 100),
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
      loading=true;
    });
    _auth.verifyPhoneNumber(
        phoneNumber: loginmobilenumberEditingController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) => {
            print("logged in"),
          });
          setState(() {
            loading=false;
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
          Fluttertoast.showToast(msg: "Something Went Wrong! Try Again");
          setState(() {
            loading=false;
          });
        },
        codeSent: (String verificationID, int? resendToken) {
          Fluttertoast.showToast(msg: "Mobile Number Verified");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPNumberLogin(verificationID:verificationID,)));
          Fluttertoast.showToast(msg: "OTP is sent to your number");
          setState(() {
            loading=false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
