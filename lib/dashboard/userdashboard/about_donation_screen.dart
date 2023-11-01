import 'package:flutter/material.dart';
import 'package:zetcare/widgets/zetpeak_widget.dart';

class AboutDonation extends StatefulWidget {
  const AboutDonation({Key? key}) : super(key: key);

  @override
  State<AboutDonation> createState() => _AboutDonationState();
}

class _AboutDonationState extends State<AboutDonation> {
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
      body: Column(
        children: [
          const Divider(
            thickness: 1.5,
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Apheresis Blood  Donation',
                  style: TextStyle(fontSize: 15),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Stem cell Donation',
                  style: TextStyle(fontSize: 15),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'About Donation',
                  style: TextStyle(fontSize: 15),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: 400),
          const ZetpeakLogo(),
        ],
      ),
    );
  }
}
