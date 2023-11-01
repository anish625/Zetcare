import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zetcare/dashboard/userdashboard/nearest_blood_centers.dart';
import 'package:zetcare/users/screens/welcome_screen.dart';
import '../../dashboard/userdashboard/about_donation_screen.dart';
import '../../dashboard/userdashboard/appointment_page.dart';
import '../../dashboard/userdashboard/contact_screen.dart';
import '../../dashboard/userdashboard/donation_history.dart';
import '../../dashboard/userdashboard/donor_screen.dart';
import '../../dashboard/userdashboard/eligibility_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../users/regsiter_controllers/model/user_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  late Stream<DocumentSnapshot> userStream;

  @override
  void initState() {
    super.initState();
    userStream = FirebaseFirestore.instance
        .collection('users') // Change this to your collection name
        .doc(user?.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DonorScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
              child: Image.asset(
                'assets/donor-card-men.jpg',
                fit: BoxFit.cover,
                height: 40.00,
                width: 50.00,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                },
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: Colors.red[700],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: StreamBuilder<DocumentSnapshot>(
            stream: userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              UserModel userData = UserModel.fromMap(snapshot.data!.data()!);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 8,
                    ),
                    child: Text(userData.name ?? '',
                        style: const TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold)),
                  ),
                  const Divider(
                    color: Colors.black12,
                    thickness: 1.5,
                  ),
                  Container(
                    height: 65,
                    width: 380,
                    margin:
                        const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              7.0) //                 <--- border radius here
                          ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/donor-man.jpg',
                            ),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  userData.name ?? '',
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ),
                          Text(
                            userData.bloodgroup ?? '',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 380,
                    margin:
                        const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              7.0) //                 <--- border radius here
                          ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/blood-drop-hand.jpg',
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Number of Donations ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const Text(
                            '0',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 65,
                      width: 380,
                      margin:
                          const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                7.0) //                 <--- border radius here
                            ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/clipboard.jpg',
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DonationHistory()));
                                  },
                                  child: const Text(
                                    'Donation History',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            ),
                          ],
                        ),
                      )),
                  Container(
                      height: 65,
                      width: 380,
                      margin:
                          const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                7.0) //                 <--- border radius here
                            ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/hospital.jpg',
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AppointmentPage()));
                                  },
                                  child: const Text(
                                    'Blood Appointment',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            ),
                          ],
                        ),
                      )),
                  Container(
                      height: 65,
                      width: 380,
                      margin:
                          const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                7.0) //                 <--- border radius here
                            ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/test-tube-2.jpg',
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EligibilityScreen()));
                                  },
                                  child: const Text(
                                    'Compliance Check',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            ),
                          ],
                        ),
                      )),
                  Container(
                    height: 55,
                    width: 380,
                    margin:
                        const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              7.0) //                 <--- border radius here
                          ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NearestBloodCenters()));
                        },
                        child: const Center(
                          child: Text(
                            'Nearest Blood Donation Points',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 155,
                        margin: const EdgeInsets.only(
                            left: 15.0, top: 15, right: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  7.0) //                 <--- border radius here
                              ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AboutDonation()));
                            },
                            child: const Center(
                              child: Text(
                                'About Donation',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 155,
                        margin: const EdgeInsets.only(
                            left: 15.0, top: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  7.0) //                 <--- border radius here
                              ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ContactScreen()));
                            },
                            child: const Center(
                              child: Text(
                                'Communication',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 16,
              backgroundImage: AssetImage('assets/Zetcare logo.jpg'),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 16,
              backgroundImage: AssetImage('assets/Zetpeak logo1.png'),
            ),
            Text(
              "POWERED BY ZETPEAK",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
