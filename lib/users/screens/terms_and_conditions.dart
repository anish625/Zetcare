import 'package:flutter/material.dart';
import 'package:zetcare/users/screens/welcome_screen.dart';
import '/widgets/zetpeak_widget.dart';
import '../../../widgets/round_button.dart';

class TermsandConditionsScreen extends StatefulWidget {
  const TermsandConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsandConditionsScreen> createState() =>
      _TermsandConditionsScreenState();
}

class _TermsandConditionsScreenState extends State<TermsandConditionsScreen> {
  bool loading=false;
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
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/zetcare_logo.png"),
                  ),
                  const Text(
                      "The customer is very important, the customer will be followed by the customer. It was painful, but it was really sad to have some pain. The pure smile of the easy bow, but not tomorrow but the inhabitants. Let it be as well as the bed of Euismod. Everyone expected to enjoy the chocolate bar. Flattering in the free will, every element of the god was present in the children. Or, lake, tomorrow always maecenas to put the price of vulputate whole turpis. A sad eros, cartoon like price and adipiscing. Urna, but the basketball course of the university. For the football is in no way, the ugliness is necessary at the players. It was painful, but it was really sad to have some pain. The pure smile of the easy bow, but not tomorrow but the inhabitants. Let it be as well as the bed of Euismod. Everyone expected to enjoy the chocolate bar. Flattering in the free will, every element of the god was present in the children. Or, lake, tomorrow always maecenas to put the price of vulputate whole turpis. A sad eros, cartoon like price and adipiscing. Urna, but the basketball course of the university. For the football is in no way, the ugliness is necessary at the players. It was painful, but it was really sad to have some pain. The pure smile of the easy bow, but not tomorrow but the inhabitants. Let it be as well as the bed of Euismod. Everyone expected to enjoy the chocolate bar. Flattering in the free will, every element of the god was present in the children. Or, lake, tomorrow always maecenas to put the price of vulputate whole turpis. A sad eros, cartoon like price and adipiscing. Urna, but the basketball course of the university. For the football is in no way, the ugliness is necessary at the players. It was painful, but it was really sad to have some pain. The pure smile of the easy bow, but not tomorrow but the inhabitants. Let it be as well as the bed of Euismod. Everyone expected to enjoy the chocolate bar. Flattering in the free will, every element of the god was present in the children. Or, lake, tomorrow always maecenas to put the price of vulputate whole turpis. A sad eros, cartoon like price and adipiscing. Urna, but the basketball course of the university. For the football is in no way, the ugliness is necessary at the players. It was painful, but it was really sad to have some pain. The pure smile of the easy bow, but not tomorrow but the inhabitants. Let it be as well as the bed of Euismod. Everyone expected to enjoy the chocolate bar. Flattering in the free will, every element of the god was present in the children. Or, lake, tomorrow always maecenas to put the price of vulputate whole turpis."),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                      child: RoundButton(
                        title: "I Agree",
                        loading: loading,
                        onTap: () {
                          setState(() {
                            loading=true;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                      )),
                  const ZetpeakLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
