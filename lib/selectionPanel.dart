import 'package:attendace_caller_app/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:gradient_borders/gradient_borders.dart';
import 'package:page_transition/page_transition.dart';
import 'package:attendace_caller_app/selectionPanel.dart';
import 'PADisplay.dart';

class TextHeader extends StatelessWidget {
  String text;
  double? size = 30.0;
  TextHeader({super.key, required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: Colors.purple,
          fontFamily: 'Gabriela',
          shadows: const [
            BoxShadow(color: Colors.black, blurRadius: 1),
          ]),
    );
  }
}

class SelectionPanel extends StatefulWidget {
  const SelectionPanel({super.key});

  @override
  State<SelectionPanel> createState() => _SelectionPanelState();
}

class _SelectionPanelState extends State<SelectionPanel> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Map<String, List<String>> course = {
    '2019': <String>["EMPS", 'Theory of Machines', 'Analog Electronics'],
    '2020': <String>[
      'ACS',
      'Digital Electronics',
      'Data Strctures and Algorithm'
    ],
    '2021': <String>['Chemistry', 'Physics', 'Maths'],
    '2022': <String>['English', 'Strength of Materials', 'Hydraulics']
  };

  List<String> hour = ['1', '2', '3', '4', '5', '6', '7', '8'];

  late List<String> batch = course.keys.toList();
  late var Batch = batch.first;
  late var Hour = hour.first;
  late var CourseName = course[batch.first];
  late var coursename = course[batch.first]?.first;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextHeader(
          text: "Selection Page",
          size: 35.0,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30.0,
              color: Colors.purple,
            ),
            onPressed: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        title: const Text('Logging Out'),
                        content: const Text(
                            'You are about to logout. Do you want to continue'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, '/second'),
                            child: const Text('No',
                                style: TextStyle(
                                    fontFamily: 'Times',
                                    fontSize: 17.0,
                                    color: Colors.black)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: const LoginScreen(),
                                    duration:
                                        const Duration(milliseconds: 500))),
                            child: const Text('Yes',
                                style: TextStyle(
                                    fontFamily: 'Times',
                                    fontSize: 17.0,
                                    color: Colors.black)),
                          ),
                        ],
                      ));
            }),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(padding: EdgeInsets.all(30.0)),
                TextHeader(
                  text: "BATCH",
                  size: 30.0,
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.deepPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: DropdownButton<String>(
                      value: Batch,
                      underline: Container(),
                      alignment: Alignment.center,
                      elevation: 0,
                      dropdownColor: Colors.white,
                      isExpanded: false,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.purple,
                          fontFamily: 'Gabriela',
                          shadows: [
                            BoxShadow(color: Colors.black, blurRadius: 1),
                          ]),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.purple, size: 30.0),
                      items: batch.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          Batch = value!;
                          CourseName = course[Batch];
                          coursename = course[Batch]?.first;
                        });
                      }),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: (size.height) * 0.0015,
                    right: 50.0,
                    left: 50.0,
                    bottom: 50.0)),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextHeader(
                  text: "COURSE NAME",
                  size: 30.0,
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                FittedBox(
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                        maxHeight: 50.0, maxWidth: double.infinity),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.deepPurple, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                          value: coursename.toString(),
                          underline: Container(),
                          alignment: Alignment.center,
                          elevation: 0,
                          dropdownColor: Colors.white,
                          isExpanded: false,
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                              fontFamily: 'Gabriela',
                              shadows: [
                                BoxShadow(color: Colors.black, blurRadius: 1),
                              ]),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.purple, size: 30.0),
                          items: CourseName?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              coursename = value!;
                            });
                          }),
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: (size.height) * 0.0015,
                    right: 50.0,
                    left: 50.0,
                    bottom: 40.0)),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextHeader(
                  text: "HOUR",
                  size: 30.0,
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.deepPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: DropdownButton<String>(
                      value: Hour,
                      underline: Container(),
                      alignment: Alignment.center,
                      elevation: 0,
                      dropdownColor: Colors.white,
                      isExpanded: false,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.purple,
                          fontFamily: 'Gabriela',
                          shadows: [
                            BoxShadow(color: Colors.black, blurRadius: 1),
                          ]),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.purple, size: 30.0),
                      items: hour.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          Hour = value!;
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all((size.height) * 0.0315),
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
                                child: DataEntryScreen(courseName: coursename),
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
                        'ENTER',
                        style: TextStyle(
                            color: Color.fromARGB(180, 141, 75, 241),
                            fontFamily: 'Gabriela',
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: (size.height * 0.21),
          width: 120,
          child: const FittedBox(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage('assets/SelectionPage.png'),
            ),
          ),
        ),
      ),
    );
  }
}
