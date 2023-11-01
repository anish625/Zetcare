import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

final registerphonenumberEditingController=TextEditingController();

final registerphonenumberField=IntlPhoneField(
  controller: registerphonenumberEditingController,
  initialCountryCode: 'IN',
  showDropdownIcon: false,
  validator: (value){
    if(value==""){
      return "Phone Number Cannot be Empty";
    }
  },
  onSaved: (value) {
    registerphonenumberEditingController.text = value as String;
  },
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.phone_android,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Phone Number",
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