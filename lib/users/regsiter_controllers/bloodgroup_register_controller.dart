import 'package:flutter/material.dart';

final registerbloodgroupEditingController=TextEditingController();

final registerbloodgroupField = TextFormField(
  autofocus: false,
  controller: registerbloodgroupEditingController,
  keyboardType: TextInputType.name,
  validator: (value) {
    if(value!.isEmpty){
      return "Blood Group Cannot be Empty";
    }
    //reg expression for blood group validation
    if(!RegExp("^(A|B|AB|O)[+-]?").hasMatch(value)){
      return "Please Enter a valid Blood Group";
    }
    return null;
  },
  onSaved: (value) {
    registerbloodgroupEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  cursorColor: Colors.red,
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.bloodtype,
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: "Blood Group",
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