import 'package:attendace_caller_app/Report.dart';
import 'package:attendace_caller_app/selectionPanel.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gradient_borders/gradient_borders.dart';

class DataEntryScreen extends StatefulWidget {
  dynamic courseName;
  DataEntryScreen({super.key, this.courseName});

  @override
  State<DataEntryScreen> createState() =>
      _DataEntryScreenState(courseName: courseName);
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future speak(String text) async {
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setLanguage("en-UK");
    await flutterTts.setPitch(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(1.0);

    await flutterTts.speak(text);
  }

  dynamic courseName;
  _DataEntryScreenState({this.courseName});
  Map<String, String> nameList = {
    '21R201': 'Aditya Guruprasad',
    '21R202': 'Selvan',
    '21R203': 'Kishore',
    '21R204': 'Yashwant'
  };
  List<bool> _green = [true, true, true, true];
  List<bool> _red = [true, true, true, true];
  var i = 0;
  void initState() {
    speak(nameList.keys.toList().first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var names = nameList.values.toList();
    var roll = nameList.keys.toList();
    var Size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(224, 217, 255, 1),
            Color.fromRGBO(255, 255, 255, 1)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35.0,
                      color: Colors.purple,
                    ),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SelectionPanel(),
                              duration: const Duration(milliseconds: 500))),
                    },
                  ),
                ),
                SizedBox(
                  height: Size.height * 0.15,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: Size.height * 0.2,
                    width: Size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 3.5,
                            spreadRadius: -0.5,
                            offset: Offset(-1, -1),
                          )
                        ],
                        border: Border.all(
                            color: const Color.fromRGBO(151, 71, 255, 1),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          bottom: 70,
                          left: 25,
                          right: 24,
                          child: FittedBox(
                              child: Text(
                            names[i],
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gabriela',
                                fontSize: 25),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Center(
                            child: FittedBox(
                                child: Text(
                              roll[i],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gabriela',
                                  fontSize: 25),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() {
                          _green[i] = !_green[i];

                          _red[i] ? _red[i] : _red[i] = !_red[i];
                        }),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.green,
                            shadowColor: Colors.black,
                            backgroundColor: _green[i].toString() == "true"
                                ? Colors.white
                                : Colors.green,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: _green[i].toString() == "true"
                                      ? const Color.fromRGBO(128, 185, 24, 1)
                                      : const Color.fromARGB(255, 0, 0, 0),
                                  width: 2),
                              borderRadius: BorderRadius.circular(60.0),
                            )),
                        child: FittedBox(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Present",
                                style: TextStyle(
                                    fontFamily: 'Roboto-Slab',
                                    color: _green[i].toString() == "true"
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 30),
                              ),
                            )),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _red[i].toString() == "true"
                                ? Colors.white
                                : Colors.red,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: _red[i].toString() == "true"
                                      ? const Color.fromARGB(255, 182, 12, 12)
                                      : const Color.fromARGB(255, 10, 10, 10),
                                  width: 2),
                              borderRadius: BorderRadius.circular(60.0),
                            )),
                        onPressed: () => setState(() {
                          _red[i] = !_red[i];
                          _green[i] ? _green[i] : _green[i] = !_green[i];
                        }),
                        child: FittedBox(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Absent",
                                style: TextStyle(
                                    fontFamily: 'Roboto-Slab',
                                    color: _red[i].toString() == "true"
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 30),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                i == names.length - 1
                    ? Column(
                        children: [
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
                                          child: ReportPage(
                                            courseName: courseName,
                                            absent: _red,
                                            present: _green,
                                          ),
                                          duration: const Duration(
                                              milliseconds: 500)));
                                },
                                icon: const Icon(
                                  Icons.exit_to_app,
                                  color: Color.fromARGB(180, 141, 75, 241),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor:
                                        const Color.fromARGB(255, 27, 27, 27),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                                label: const Text(
                                  "SUBMIT", //Submit
                                  style: TextStyle(
                                      color: Color.fromARGB(180, 141, 75, 241),
                                      fontFamily: 'Gabriela',
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Size.width * 0.01,
                                top: Size.height * 0.2),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color:
                                                Color.fromRGBO(151, 71, 255, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        )),
                                    onPressed: () {
                                      if (i != 0) {
                                        setState(() {
                                          i = i - 1;
                                        });
                                      } else {}
                                    },
                                    child: const FittedBox(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "Prev",
                                          style: TextStyle(
                                              fontFamily: 'Sans',
                                              color: Colors.black,
                                              fontSize: 30),
                                        )),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.transparent,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color:
                                                Color.fromRGBO(151, 71, 255, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        )),
                                    onPressed: () {},
                                    child: const FittedBox(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              fontFamily: 'Sans',
                                              color: Colors.black,
                                              fontSize: 30),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            top: Size.height * 0.33, left: Size.width * 0.01),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Color.fromRGBO(151, 71, 255, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    )),
                                onPressed: () {
                                  if (i != 0) {
                                    setState(() {
                                      i = i - 1;
                                    });
                                  } else {}
                                },
                                child: const FittedBox(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Prev",
                                      style: TextStyle(
                                          fontFamily: 'Sans',
                                          color: Colors.black,
                                          fontSize: 30),
                                    )),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Color.fromRGBO(151, 71, 255, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    )),
                                onPressed: () {
                                  setState(() {
                                    i = i + 1;
                                  });
                                  speak(roll[i]);
                                },
                                child: const FittedBox(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontFamily: 'Sans',
                                          color: Colors.black,
                                          fontSize: 30),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
              ])),
    );
  }
}
