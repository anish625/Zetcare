import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/zetpeak_widget.dart';
import '../../../widgets/round_button.dart';

class EmailForgotPassword extends StatefulWidget {
  const EmailForgotPassword({Key? key}) : super(key: key);

  @override
  State<EmailForgotPassword> createState() => _EmailForgotPasswordState();
}

class _EmailForgotPasswordState extends State<EmailForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final forgotpasswordemailEditingController = TextEditingController();

  @override
  void dispose() {
    forgotpasswordemailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forgotpasswordemailField = TextFormField(
      autofocus: false,
      controller: forgotpasswordemailEditingController,
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
        forgotpasswordemailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Enter Your Email",
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
                  forgotpasswordemailField,
                  const SizedBox(height: 50),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                      child: RoundButton(
                        title: "Submit",
                        onTap: () {
                          emailpasswordReset();
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

  void emailpasswordReset() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: forgotpasswordemailEditingController.text);
        Fluttertoast.showToast(msg: "Reset link is sent to your mail");
      } catch (e) {
        Fluttertoast.showToast(
            msg: "There is no user corresponding to this identifier");
      }
    }
  }
}
