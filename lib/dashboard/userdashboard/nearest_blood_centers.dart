import 'package:flutter/material.dart';

class NearestBloodCenters extends StatefulWidget {
  const NearestBloodCenters({Key? key}) : super(key: key);

  @override
  State<NearestBloodCenters> createState() => _NearestBloodCentersState();
}

class _NearestBloodCentersState extends State<NearestBloodCenters> {
  List<String> cities = ["City 1", "City 2", "City 3"];

  List<String> states = ["State 1", "State 2", "State 3"];

  String selectedCity = "City 1";

  String selectedState = "State 1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Nearest Red Crescent",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedCity,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    },
                    items: cities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    value: selectedState,
                    onChanged: (newValue) {
                      setState(() {
                        selectedState = newValue!;
                      });
                    },
                    items: states.map((state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset('assets/img.png'),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.4, // Adjust this factor as needed

                        child: Card(
                          elevation: 5,
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Batı Akdeniz Bölge Kan Merkezi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                    'MURATPAŞA MH. ÇATALKÖPRÜ CD. YAŞAR ÇÖPELCİ İŞ MERK. NO:11 K:1 D:5 MURATPAŞA / ANTALYA'),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Telephone',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('123-456-7890'),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Open Hours',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('9:00 AM - 5:00 PM'),
                                  ],
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add functionality to get directions here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    "Get Directions",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
