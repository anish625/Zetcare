import 'package:flutter/material.dart';

final registeraddressEditingController=TextEditingController();

final registeraddressField = TextFormField(
  autofocus: false,
  controller: registeraddressEditingController,
  keyboardType: TextInputType.streetAddress,
  validator: (value) {
    RegExp regex= RegExp(r'^.{3,}$');
    if(value!.isEmpty){
      return "Address Cannot be Empty";
    }
    if(!regex.hasMatch(value)){
      return "Please Enter a Valid Address (Min 3 Characters)";
    }
    return null;
  },
  onSaved: (value) {
    registeraddressEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.location_pin,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Address",
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