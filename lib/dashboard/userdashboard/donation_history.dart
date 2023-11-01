import 'package:flutter/material.dart';
import '../../dashboard/userdashboard/donation_rewards.dart';
import '../../widgets/zetpeak_widget.dart';

class DonationHistory extends StatefulWidget {
  const DonationHistory({Key? key}) : super(key: key);

  @override
  State<DonationHistory> createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Donation History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 4,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                //constraints: const BoxConstraints.,
                height: 90,
                //color: Colors.black12,
                //margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                      ),
                ), //             <--- BoxDecoration here
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 10, top: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                                child: Text(
                              'Red Crescent Donation Awards',
                              style: (TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                            )),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DonationRewards()));
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset(
                              'assets/donor-man.jpg',
                            ),
                          ),
                          const Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'gains',
                                  style: TextStyle(fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset(
                              'assets/bronze-medal.jpg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              'assets/silver-medal.jpg',
                            ),
                          ),
                        ],
                      ),
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10, top: 10),
            child: Container(
              constraints: const BoxConstraints.expand(height: 150),

              //color: Colors.black12,
              //margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                    ),
              ), //             <--- BoxDecoration here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 9),
                    child: Text(
                      'Next Donation Date',
                      style: (TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 18.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/blooddropaid.jpg',
                          ),
                        ),
                        const Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Blood donation',
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                        const Text(
                          '22.02.2021',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
              child: Container(
                  //constraints: const BoxConstraints.,
                  height: 130,
                  //color: Colors.black12,
                  //margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                        ),
                  ), //             <--- BoxDecoration here
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0, top: 9),
                                child: Text(
                                  'Bangalore',
                                  style: (TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40, top: 5),
                                child: Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Blood donation',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 15),
                                        )),
                                  ),
                                ),
                              ),
                              Image.asset('assets/blooddropaid.jpg'),
                              IconButton(
                                onPressed: (() {}),
                                icon: const Icon(
                                    Icons.keyboard_arrow_up_outlined),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 5),
                            child: Text(
                                'Bangalore Muratpasa Turkish Red Crescent Branch In Testing Phase'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 76),
                        child: Column(
                          children: [
                            Image.asset('assets/test-tube.jpg'),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                '14.11.2020',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
              child: Container(
                //constraints: const BoxConstraints.,
                height: 130,
                //color: Colors.black12,
                //margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(9.0) //
                      ),
                ),
              )),
          const SizedBox(height: 50),
          const ZetpeakLogo(),
        ]));
  }
}
