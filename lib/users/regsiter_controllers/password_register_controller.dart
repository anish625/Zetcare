import 'package:flutter/material.dart';

final registerpasswordEditingController=TextEditingController();

final registerpasswordField = TextFormField(
  autofocus: false,
  controller: registerpasswordEditingController,
  keyboardType: TextInputType.visiblePassword,
  obscureText: true,
  validator: (value) {
    RegExp regex= RegExp(r'^.{6,}$');
    if(value!.isEmpty){
      return "Password Cannot be Empty";
    }
    if(!regex.hasMatch(value)){
      return "Please Enter a Valid Password (Min 6 Characters)";
    }
    return null;
  },
  onSaved: (value) {
    registerpasswordEditingController.text = value!;
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