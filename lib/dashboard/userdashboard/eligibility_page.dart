import 'package:flutter/material.dart';
import '../../dashboard/userdashboard/main_screen.dart';
import '../../widgets/round_button.dart';
import '../../widgets/zetpeak_widget.dart';

class EligibilityScreen extends StatefulWidget {
  const EligibilityScreen({Key? key}) : super(key: key);

  @override
  State<EligibilityScreen> createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  int selectedIndex1 = -1;
  int selectedIndex2 = -1;
  int selectedIndex3 = -1;
  int selectedIndex4 = -1;

  final items = ['Items1', 'Items 2', 'items3', 'Items 4', 'Items 5'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Eligibility Check",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
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
              thickness: 2,
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Compliance Check',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
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
            const SizedBox(height: 15),
            Column(
              children: [
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Control 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Generally'),
                      ),
                      underline: const SizedBox(),
                      value: value,
                      iconSize: 26,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ]),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                        height: 40,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Control 3',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex1 = 0;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex1 == 0 ? Colors.green : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: selectedIndex1 == 0 ? Colors.green : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex1 = 1;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex1 == 1 ? Colors.red : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: selectedIndex1 == 1 ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                        height: 40,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Control 5',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex2 = 0;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex2 == 0 ? Colors.green : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: selectedIndex2 == 0 ? Colors.green : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex2 = 1;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex2 == 1 ? Colors.red : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: selectedIndex2 == 1 ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Control 2',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const TextField(),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Control 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('9 Months'),
                      ),
                      underline: const SizedBox(),
                      value: value,
                      iconSize: 26,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ]),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                        height: 40,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Control 4',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex3 = 0;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex3 == 0 ? Colors.green : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: selectedIndex3 == 0 ? Colors.green : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex1 = 1;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex3 == 1 ? Colors.red : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: selectedIndex3 == 1 ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                        height: 40,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Control 4',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex4 = 0;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex4 == 0 ? Colors.green : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: selectedIndex4 == 0 ? Colors.green : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex4 = 1;
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: selectedIndex4 == 1 ? Colors.red : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: selectedIndex4 == 1 ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Control 2',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 0.5)),
                    child: const TextField(),
                  ),
                ]),
              ],
            ),


            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(70,0,70,0),
                child:RoundButton(
                  title: "Finish Test",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                  },
                )
            ),
            const SizedBox(height: 10,),
            const ZetpeakLogo(),
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
