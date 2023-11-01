import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/forgot_button.dart';
import '/widgets/zetpeak_widget.dart';
import '../../../widgets/round_button.dart';
import 'otp_email_login_controller.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  EmailOTP myauth = EmailOTP();
  bool loading = false;
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final loginemailEditingController = TextEditingController();
  final loginemailpasswordEditingController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    loginemailEditingController.dispose();
    loginemailpasswordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginemailField = TextFormField(
      autofocus: false,
      controller: loginemailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Email";
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return "Please Enter a Valid Email";
        }
        return null;
      },
      onSaved: (value) {
        loginemailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email",
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
    final loginemailpasswordField = TextFormField(
      autofocus: false,
      controller: loginemailpasswordEditingController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password is Required for Login";
        }
        if (!regex.hasMatch(value)) {
          return "Please Enter Valid Password";
        }
        return null;
      },
      onSaved: (value) {
        loginemailpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Password",
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  loginemailField,
                  const SizedBox(height: 20),
                  loginemailpasswordField,
                  const ForgotButton(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                    child: RoundButton(
                      loading: loading,
                      title: "Login",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final email = loginemailEditingController.text;
                          final password = loginemailpasswordEditingController.text;
                          signIN(email, password);
                        }
                      },
                    ),
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

  void signIN(String email, String password) async {
    setState(() {
      loading = true;
    });
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Login Successful");

      myauth.setConfig(
        appEmail: "zetcare@gmail.com",
        appName: "Email OTP",
        userEmail: email,
        otpLength: 4,
        otpType: OTPType.digitsOnly,
      );
      if (await myauth.sendOTP() == true) {
        Fluttertoast.showToast(msg: "OTP has been sent to your email");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPEmailLogin(myauth: myauth)),
        );
      } else {
        Fluttertoast.showToast(msg: "Oops, OTP send failed");
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.code);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
