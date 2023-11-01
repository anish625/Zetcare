import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/round_button.dart';
import '/widgets/zetpeak_widget.dart';
import '../screens/login_screen.dart';
import 'new_confirm_password_controller.dart';
import 'new_password_controller.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:const EdgeInsets.fromLTRB(20,0,20,0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/zetcare_logo.png"),
                  ),
                  const SizedBox(height: 20),
                  newpasswordField,
                  const SizedBox(height: 20),
                  newconfirmpasswordField,
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45,0,45,0),
                    child:RoundButton(
                      title: "Set New Password",
                      onTap: (){
                        changepassword();
                      },
                    ),
                  ),
                  const ZetpeakLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  final currentuser=FirebaseAuth.instance.currentUser;
  void changepassword() async {
    if(_formKey.currentState!.validate()){
      try{
        await currentuser!.updatePassword(newpasswordEditingController.text);
        FirebaseAuth.instance.signOut();
        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
        Fluttertoast.showToast(msg: "Your Password is Changed. Login Again!");
      }catch(e){
        Fluttertoast.showToast(msg: "Something Went Wrong! Try Again");
      }
    }
  }
}
