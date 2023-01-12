import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:gradient_borders/gradient_borders.dart';
import 'package:page_transition/page_transition.dart';
import 'package:attendace_caller_app/selectionPanel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Image.asset(
          'assets/LoginScreen.png',
          scale: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.89,
            color: Colors.white,
            child: Center(
              child: Text(
                "ATTENDANCE",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Gabriela',
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(60, 20),
                        const <Color>[
                          Color.fromARGB(255, 167, 16, 217),
                          Color.fromARGB(255, 79, 52, 184),
                        ],
                      ),
                    shadows: const [
                      Shadow(
                          offset: Offset(1.0, 2.2),
                          blurRadius: 1.0,
                          color: Color.fromARGB(156, 0, 0, 0))
                    ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 42.0, left: 42.0, top: 5, bottom: 20.0),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: size.height * 0.5, maxWidth: size.width * 0.89),
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(194, 134, 110, 229),
                    Color.fromARGB(237, 70, 59, 116),
                  ],
                ),
              ),
              borderRadius: BorderRadius.circular(80.0),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.width * 0.1,
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Text(
                  "USERNAME",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Sans',
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                  right: MediaQuery.of(context).size.width * 0.09,
                  left: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      maxHeight: double.infinity, maxWidth: 700.0),
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      width: 2.0,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(131, 109, 219, 1),
                          Color.fromARGB(155, 165, 146, 240),
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                      hintText: "User ID",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(117, 141, 75, 241),
                          fontFamily: 'Gabriela',
                          fontSize: 20.0),
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.people,
                        color: Color.fromRGBO(142, 75, 241, 1),
                      ),
                      enabled: true,
                    )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    right: MediaQuery.of(context).size.width * 0.09,
                    left: MediaQuery.of(context).size.width * 0.09),
                child: const Text(
                  "PASSWORD",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Sans',
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.width * 0.09,
                  left: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      maxHeight: double.infinity, maxWidth: 700),
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      width: 2.0,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(131, 109, 219, 1),
                          Color.fromARGB(155, 165, 146, 240),
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(109, 141, 75, 241),
                          fontFamily: 'Gabriela',
                          fontSize: 20.0),
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(142, 75, 241, 1),
                      ),
                      enabled: true,
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 20, right: 20),
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        width: 4,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(131, 109, 219, 1),
                            Color.fromARGB(155, 165, 146, 240),
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(60.0)),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SelectionPanel(),
                              duration: const Duration(milliseconds: 500)));
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Color.fromARGB(180, 141, 75, 241),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    label: const Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: Color.fromARGB(180, 141, 75, 241),
                          fontFamily: 'Gabriela',
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(0.0),
          child: Text(
            "PSG COLLEGE OF TECHNOLOGY",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Gabriela', fontSize: 15.0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(2.0),
          child: Text(
            "ROBOTICS AND AUTOMATION",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Gabriela', fontSize: 10.0),
          ),
        ),
      ]),
    );
  }
}
