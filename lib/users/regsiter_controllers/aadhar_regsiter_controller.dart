import 'package:flutter/material.dart';

final registeraadharEditingController=TextEditingController();

final registeraadharField = TextFormField(
  autofocus: false,
  controller: registeraadharEditingController,
  keyboardType: TextInputType.number,
  validator: (value) {
    RegExp regex= RegExp(r'^.{12,}$');
    if(value!.isEmpty){
      return "Aadhar Number Cannot be Empty";
    }
    if(!regex.hasMatch(value)){
      return "Please Enter Valid Aadhar ";
    }
    return null;
  },
  onSaved: (value) {
    registeraadharEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.person_pin_rounded,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Aadhar No",
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