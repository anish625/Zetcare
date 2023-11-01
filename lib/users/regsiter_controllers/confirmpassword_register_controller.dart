import 'package:flutter/material.dart';
import '/users/regsiter_controllers/password_register_controller.dart';

final registerconfirmpasswordEditingController=TextEditingController();

final registerconfirmpasswordField = TextFormField(
  autofocus: false,
  controller: registerconfirmpasswordEditingController,
  obscureText: true,
  validator: (value) {
    if(registerpasswordEditingController.text!=registerconfirmpasswordEditingController.text) {
      return "Password does not match";
    }
  },
  onSaved: (value) {
    registerconfirmpasswordEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.vpn_key,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Confirm Password",
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