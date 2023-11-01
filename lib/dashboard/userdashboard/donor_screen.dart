import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../users/regsiter_controllers/model/user_model.dart';

class DonorScreen extends StatefulWidget {
  const DonorScreen({Key? key}) : super(key: key);

  @override
  State<DonorScreen> createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Donor Card',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.file_upload_outlined,
              size: 35,
              color: Colors.black,
            ),
          )
        ],
        shape:
        const Border(bottom: BorderSide(color: Colors.black12, width: 2)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: StreamBuilder<DocumentSnapshot>(
            stream: userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              UserModel userData = UserModel.fromMap(snapshot.data!.data()!);
              return Container(
                  constraints: BoxConstraints.tight(const Size.square(550)),
                  //color: Colors.black12,
                  margin: const EdgeInsets.all(19.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ), //             <--- BoxDecoration here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                userData.name ?? '',
                                style: (TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                              ),
                              Text('')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              'assets/silver-medal.jpg',
                              fit: BoxFit.cover,
                              height: 44.00,
                              width: 35.00,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            Text(
                              userData.bloodgroup ?? '',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                                  )),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/blood-bag.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Donated Unit',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            const Text(
                              '35',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/blood-donation.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Donation Dedline',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            const Text(
                              '14.11.2020',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/map-user.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Location',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            Text(
                              userData.city ?? '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 1,
                                    top: 18,
                                  ),
                                  child: Image.asset(
                                    'assets/Zetcare logo.jpg',
                                    height: 60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    top: 8,
                                  ),
                                  child: Image.asset(
                                    'assets/Zetpeak logo1.png',
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    "POWERED BY ZETPEAK",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
