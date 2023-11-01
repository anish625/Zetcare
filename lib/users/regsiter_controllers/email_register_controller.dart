import 'package:flutter/material.dart';

final registeremailEditingController=TextEditingController();

final registeremailField = TextFormField(
  autofocus: false,
  controller: registeremailEditingController,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if(value!.isEmpty){
      return "Email Cannot be Empty";
    }
    //reg expression for email validation
    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
      return "Please Enter a Valid Email";
    }
    return null;
  },
  onSaved: (value) {
    registeremailEditingController.text = value!;
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