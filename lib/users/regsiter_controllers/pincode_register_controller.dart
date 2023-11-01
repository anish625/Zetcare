import 'package:flutter/material.dart';

final registerpincodeEditingController=TextEditingController();

final registerpincodeField = TextFormField(
  autofocus: false,
  controller: registerpincodeEditingController,
  keyboardType: TextInputType.number,
  validator: (value) {
    RegExp regex= RegExp(r'^.{6,}$');
    if(value!.isEmpty){
      return "Pincode Cannot be Empty";
    }
    if(!regex.hasMatch(value)){
      return "Please Enter Valid Pincode ";
    }
    return null;
  },
  onSaved: (value) {
    registerpincodeEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.pin_drop_outlined,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Pin code",
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