import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetcare/dashboard/userdashboard/main_screen.dart';
import '../../widgets/zetpeak_widget.dart';
import '../../widgets/round_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String selectedCountry = '';
  String? selectedState = '';
  String? selectedCity = '';
  String? selectedFileName;
  String userInput = '';

  // Future<void> pickFile() async {
  //   PermissionStatus permissionStatus = await Permission.storage.status;

  //   if (permissionStatus.isGranted) {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();

  //     if (result != null) {
  //       PlatformFile file = result.files.first;
  //       setState(() {
  //         selectedFileName = file.name;
  //       });
  //       print("Selected file: ${file.name}");
  //     } else {
  //       // User canceled the file picking
  //     }
  //   } else {
  //     permissionStatus = await Permission.storage.request();

  //     if (permissionStatus.isGranted) {
  //       FilePickerResult? result = await FilePicker.platform.pickFiles();
  //       if (result != null) {
  //         PlatformFile file = result.files.first;
  //         setState(() {
  //           selectedFileName = file.name;
  //         });
  //         print("Selected file: ${file.name}");
  //       } else {
  //         // User canceled the file picking
  //       }
  //     } else {
  //       print("Permission denied");
  //     }
  //   }
  // }

  Future<void> pickFile() async {
    PermissionStatus permissionStatus = await Permission.storage.status;

    if (permissionStatus.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;

        // Get a reference to the Firebase Storage location where you want to upload the file.
        Reference storageReference = FirebaseStorage.instance.ref().child(
            'File Attachment/${DateTime.now().millisecondsSinceEpoch}-${file.name}');

        // Upload the file to Firebase Storage.
        try {
          await storageReference.putFile(File(file.path!));

          // Get the download URL for the uploaded file.
          String downloadURL = await storageReference.getDownloadURL();

          setState(() {
            selectedFileName = file.name;
            // Store the download URL in your database along with other contact data.
            // You can add this line to store the download URL.
            // 'downloadURL': downloadURL,
          });

          print("Selected file: ${file.name}");
        } catch (error) {
          print("Error uploading file: $error");
        }
      } else {
        // User canceled the file picking
      }
    } else {
      permissionStatus = await Permission.storage.request();

      if (permissionStatus.isGranted) {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          PlatformFile file = result.files.first;
          // Continue with the same upload logic as above...
        } else {
          // User canceled the file picking
        }
      } else {
        print("Permission denied");
      }
    }
  }

//Firebase

  Future<void> storeContactData() async {
    if (selectedCountry.isNotEmpty &&
        selectedState != null &&
        selectedCity != null) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Fetch user's name, phone number, and email from Firestore
          final userData = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          final userName = userData['name'];
          final userPhone = userData['phonenumber'];
          final userEmail = userData['email'];

          // Create a new Firestore document
          final documentReference =
              await FirebaseFirestore.instance.collection('contact Us').add({
            'userId': user.uid,
            'userName': userName,
            'userPhone': userPhone,
            'userEmail': userEmail,
            'country': selectedCountry,
            'state': selectedState,
            'city': selectedCity,
            'fileName': selectedFileName ?? '',
            // Include the download URL here
            'userInput': userInput,
          });

          // Store the selected file name in Firestore
          await documentReference.update({
            'fileName': selectedFileName ?? '',
          });

          print('Contact data added to Firestore');
        } else {
          print('No user authenticated');
        }
      } catch (error) {
        print('Error adding contact data: $error');
      }
    } else {
      print('Please fill in all required fields');
    }
  }

  bool areMandatoryFieldsFilled() {
    return selectedCountry.isNotEmpty &&
        selectedState != null &&
        selectedCity != null &&
        userInput.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Communication',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              thickness: 1.5,
              color: Colors.black12,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                  child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: Colors.red[700],
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Zetpeak-1 Sokak No:32 Yenişehir 06420 Bangalore/ Karnataka',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
                  child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.red[700],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '+91 9342068026',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 8, 5),
                  child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.red[700],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'support@zetpeak.com',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                    width: 292,
                    height: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/twitter.png'),
                        Image.asset('assets/facebook.jpg'),
                        Image.asset('assets/linkedin.png'),
                        Image.asset('assets/youtube.png'),
                        Image.asset('assets/instagram.png'),
                        Image.asset('assets/whatsapp.png'),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: CSCPicker(
                    countryDropdownLabel: "Country",
                    onCountryChanged: (country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                    stateDropdownLabel: "State",
                    onStateChanged: (state) {
                      setState(() {
                        selectedState = state;
                      });
                    },
                    cityDropdownLabel: "City",
                    onCityChanged: (city) {
                      setState(() {
                        selectedCity = city;
                      });
                    },
                  ),
                ),
                // const  Padding(
                //   padding: const  EdgeInsets.fromLTRB(10,10,16,10),
                //   child: DependentDropdowns(),
                // ),
                //
                // //Reason Dropdown
                // Padding(
                //   padding: EdgeInsets.fromLTRB(10,10,16,10),
                //   child: Container(
                //     width: 385,
                //     height: 44,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       border: Border.all(width: 1),
                //     ),
                //     child: DropdownButton<String>(
                //       value: dropdownValue,
                //       icon: const Icon(Icons.arrow_downward),
                //       // iconSize: 24,
                //       hint: const Text('Reason for Application') ,
                //       isExpanded: true,
                //       onChanged: (String? value) {
                //         // This is called when the user selects an item.
                //         setState(() {
                //           dropdownValue = value!;
                //         });
                //       },
                //       items: list.map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: Container(
                      width: 385,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1),
                      ),
                      child: SizedBox(
                        width: 375,
                        height: 38,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              userInput = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: ' Your Text',
                          ),
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Container(
                        width: 385,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1),
                        ),
                        child: InkWell(
                          onTap: () {
                            pickFile(); // Call the file picker function
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectedFileName ??
                                  "File Attachment"), // Display selectedFileName
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ))),
                SizedBox(
                    height: 50,
                    width: 196,
                    child: RoundButton(
                      title: "Send",
                      onTap: () async {
                        if (areMandatoryFieldsFilled()) {
                          await storeContactData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MainScreen())); // Navigate back to the previous screen
                        }
                      },
                    )),
                const ZetpeakLogo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
