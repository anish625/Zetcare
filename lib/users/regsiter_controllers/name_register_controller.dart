import 'package:flutter/material.dart';

final registernameEditingController=TextEditingController();

final registernameField = TextFormField(
  autofocus: false,
  controller: registernameEditingController,
  keyboardType: TextInputType.name,
  validator: (value) {
    if(value!.isEmpty){
      return "Name cannot be Empty";
    }
    return null;
  },
  onSaved: (value) {
    registernameEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.person,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Name",
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