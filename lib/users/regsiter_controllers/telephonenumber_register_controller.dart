import 'package:flutter/material.dart';

final registertelephonenumberEditingController=TextEditingController();

final registertelephonenumberField = TextFormField(
  autofocus: false,
  controller: registertelephonenumberEditingController,
  keyboardType: TextInputType.number,
  validator: (value) {
    // if(value!.isEmpty) {
    //   return "Please Enter Your Telephone Number";
    // }
  },
  onSaved: (value) {
    registertelephonenumberEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.phone,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Telephone Number",
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