import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zetcare/widgets/round_button.dart';
import '/dashboard/userdashboard/eligibility_page.dart';
import '/dashboard/userdashboard/main_screen.dart';
import '/widgets/zetpeak_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String selectedCountry = '';
  String? selectedState = '';
  String? selectedCity = '';

  String? selectedHospital;
  int? selectedNumber;
  int? selectedThirdValue;

  List<String> hospitals = [
    'Bangalore Hospital',
    'Bangalore Institute Of Oncology',
    'Jayadeva Institute Of Cardiology',
  ];

  List<int> numbers = List.generate(31, (index) => index + 1);
  List<int> thirdValues = List.generate(12, (index) => index + 1);

  //firebase
  Future<void> storeAppointmentData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final appointmentData = {
          'country': selectedCountry,
          'state': selectedState,
          'city': selectedCity,
          'hospital': selectedHospital,
          'date': selectedNumber,
          'month': selectedThirdValue,
        };

        final userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        await userRef.update({'appointmentData': appointmentData});
        Fluttertoast.showToast(msg: "Appointment Booked Successfully");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error Creating an Appointment. Please try again");
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: <Widget>[
            const Divider(
              color: Colors.black12,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                height: 45,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EligibilityScreen()));
                        },
                        child: Text(
                          'Compliance Check',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/test-tube-2.png',
                        height: 40,
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Blood',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 325,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selectedHospital,
                    hint: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Select Blood Center'),
                    ),
                    iconSize: 26,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedHospital = value!;
                      });
                    },
                    items: hospitals.map((hospital) {
                      return DropdownMenuItem<String>(
                        value: hospital,
                        child: Text(hospital),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 144,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: DropdownButton<int>(
                    underline: const SizedBox(),
                    hint: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Date'),
                    ),
                    value: selectedNumber,
                    iconSize: 26,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    // items: items2.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedNumber = value;
                      });
                    },
                    items: numbers.map((number) {
                      return DropdownMenuItem<int>(
                        value: number,
                        child: Text(number.toString()),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Container(
                  width: 144,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: DropdownButton<int>(
                    underline: const SizedBox(),
                    hint: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Month'),
                    ),
                    value: selectedThirdValue,
                    iconSize: 26,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    // items: items2.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedThirdValue = value;
                      });
                    },
                    items: thirdValues.map((value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 90,
                ),
                SizedBox(
                    height: 44,
                    width: 196,
                    child: RoundButton(
                      title: "Make an Appointment",
                      onTap: () async {
                        await storeAppointmentData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 140,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                const ZetpeakLogo(),
              ],
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      );
}
