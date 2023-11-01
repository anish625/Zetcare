import 'package:flutter/material.dart';
import 'new_password_controller.dart';

final newconfirmpasswordEditingController = TextEditingController();

final newconfirmpasswordField = TextFormField(
  autofocus: false,
  controller: newconfirmpasswordEditingController,
  keyboardType: TextInputType.visiblePassword,
  obscureText: true,
  validator: (value) {
    if (newconfirmpasswordEditingController.text !=
        newpasswordEditingController.text) {
      return "Password does not match";
    } else {
      return null;
    }
  },
  onSaved: (value) {
    newconfirmpasswordEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.vpn_key,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    // hintText: "Confirm Your Password",
    labelText: "Confirm Your Password",
    labelStyle: const TextStyle(
      color: Colors.black54,
    ),
    // hintText: "Password",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.black54),
    ),
  ),
);
