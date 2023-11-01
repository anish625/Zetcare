import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zetcare/users/screens/terms_and_conditions.dart';
import '/widgets/round_button.dart';
import '/widgets/zetpeak_widget.dart';
import '../regsiter_controllers/aadhar_regsiter_controller.dart';
import '../regsiter_controllers/address_register_controller.dart';
import '../regsiter_controllers/bloodgroup_register_controller.dart';
import '../regsiter_controllers/confirmpassword_register_controller.dart';
import '../regsiter_controllers/email_register_controller.dart';
import '../regsiter_controllers/model/user_model.dart';
import '../regsiter_controllers/name_register_controller.dart';
import '../regsiter_controllers/password_register_controller.dart';
import '../regsiter_controllers/phonenumber_register_controller.dart';
import '../regsiter_controllers/pincode_register_controller.dart';
import '../regsiter_controllers/telephonenumber_register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String selectedCountry = '';
  String? selectedState = '';
  String? selectedCity = '';

  bool loading = false;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    final cscpickerField = CSCPicker(
      layout: Layout.vertical,
      countryDropdownLabel: "Select Your Country",
      onCountryChanged: (country) {
        setState(() {
          selectedCountry = country;
        });
      },
      stateDropdownLabel: "Select Your State",
      onStateChanged: (state) {
        setState(() {
          selectedState = state;
        });
      },
      cityDropdownLabel: "Select Your City",
      onCityChanged: (city) {
        setState(() {
          selectedCity = city;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[700],
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.call,
                  size: 24,
                  color: Colors.red[700],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/zetcare_logo.png"),
                  ),
                  const SizedBox(height: 10),
                  registernameField,
                  const SizedBox(height: 20),
                  registerphonenumberField,
                  const SizedBox(height: 20),
                  registeremailField,
                  const SizedBox(height: 20),
                  registertelephonenumberField,
                  const SizedBox(height: 20),
                  cscpickerField,
                  const SizedBox(height: 20),
                  registeraddressField,
                  const SizedBox(height: 20),
                  registerpasswordField,
                  const SizedBox(height: 20),
                  registerconfirmpasswordField,
                  const SizedBox(height: 20),
                  registerbloodgroupField,
                  const SizedBox(height: 20),
                  registerpincodeField,
                  const SizedBox(height: 20),
                  registeraadharField,
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked1,
                        activeColor: Colors.red[700],
                        onChanged: (value) {
                          setState(() {
                            isChecked1 = value;
                          });
                        },
                      ),
                      const Text("I have read and understood the Text.")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        activeColor: Colors.red[700],
                        onChanged: (value) {
                          setState(() {
                            isChecked2 = value;
                          });
                        },
                      ),
                      const Text("I want to be informed about Blood Services.")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        activeColor: Colors.red[700],
                        onChanged: (value) {
                          setState(() {
                            isChecked3 = value;
                          });
                        },
                      ),
                      const Text("I want to be a donor.")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: RoundButton(
                      loading: loading,
                      title: "Register",
                      onTap: () {
                        if (isChecked1 == false ||
                            isChecked2 == false ||
                            isChecked3 == false) {
                          Fluttertoast.showToast(
                              msg: "Please check all the checkboxes");
                          return;
                        }
                        signUp(
                          registeremailEditingController.text,
                          registerpasswordEditingController.text,
                        );
                      },
                    ),
                  ),
                  const ZetpeakLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    setState(() {
      loading = true;
    });

    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        postDetailsToFirebase();
        setState(() {
          loading = false;
        });
      }).catchError((err) {
        Fluttertoast.showToast(msg: err!.message);
        setState(() {
          loading = false;
        });
      });
    }
  }

  void postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
      uid: user!.uid,
      name: registernameEditingController.text,
      phonenumber: registerphonenumberEditingController.text,
      email: registeremailEditingController.text,
      telephonenumber: registertelephonenumberEditingController.text,
      country: selectedCountry,
      state: selectedState,
      city: selectedCity,
      address: registeraddressEditingController.text,
      password: registerpasswordEditingController.text,
      bloodgroup: registerbloodgroupEditingController.text,
      pincode: registerpincodeEditingController.text,
      aadhar: registeraadharEditingController.text,
    );

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TermsandConditionsScreen(),
      ),
    );
  }

  @override
  void dispose() {
    registernameEditingController.dispose();
    registerphonenumberEditingController.dispose();
    registeremailEditingController.dispose();
    registertelephonenumberEditingController.dispose();
    registeraddressEditingController.dispose();
    registerpasswordEditingController.dispose();
    registerconfirmpasswordEditingController.dispose();
    registerbloodgroupEditingController.dispose();
    registerpincodeEditingController.dispose();
    registeraadharEditingController.dispose();
    super.dispose();
  }
}
