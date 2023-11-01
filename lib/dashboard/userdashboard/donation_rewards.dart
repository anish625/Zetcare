import 'package:flutter/material.dart';
import '../../widgets/zetpeak_widget.dart';

class DonationRewards extends StatefulWidget {
  const DonationRewards({Key? key}) : super(key: key);

  @override
  State<DonationRewards> createState() => _DonationRewardsState();
}

class _DonationRewardsState extends State<DonationRewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Reward System',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset(
                'assets/call.png',
              ),
            ),
          ],
          elevation: 4,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110,
                //color: Colors.black12,
                //margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                      ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset(
                              'assets/bronze-medal.jpg',
                              fit: BoxFit.cover,
                              height: 50.00,
                              width: 38.00,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              'assets/silver-medal.jpg',
                              fit: BoxFit.cover,
                              height: 50.00,
                              width: 38.00,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text('You must donate 3 for the Gold Medal')
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 8, right: 8),
              child: Container(
                height: 250,
                //color: Colors.black12,
                //margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                      ),
                ), //             <--- BoxDecoration here
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Awards',
                              style: (TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              'Number of Donations',
                              style: (TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/bronze-medal.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Number of Donations Bronze Medal',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            const Text(
                              '10',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/silver-medal.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Silver medal',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            const Text(
                              '25',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/gold-medal.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Golden medal',
                                    style: TextStyle(fontSize: 15),
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
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/ribbon.jpg',
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Red Crescent Honor Award',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            const Text(
                              '45',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height:200),
          const ZetpeakLogo(),
          ],
        ));
  }
}
