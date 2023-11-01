import 'package:flutter/material.dart';


class ForgotButton extends StatelessWidget {
  const ForgotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:(){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordScreen()));
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
        child: Text(
          "I forgot my password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
