import 'package:attendace_caller_app/PADisplay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

int count(List PA) {
  int j = 0, i = 0;
  for (i = 0; i < PA.length; i++) {
    if (PA[i]) {
      j++;
    }
  }
  return j;
}

class ReportPage extends StatefulWidget {
  dynamic courseName, present, absent;
  ReportPage({super.key, this.courseName, this.present, this.absent});

  @override
  // ignore: no_logic_in_create_state
  State<ReportPage> createState() => _ReportPageState(
      courseName: courseName, present: present, absent: absent);
}

class _ReportPageState extends State<ReportPage> {
  dynamic courseName, present, absent;
  _ReportPageState({this.courseName, this.present, this.absent});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String date = DateFormat("dd-MM-yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Gabriela',
            fontSize: 40.0,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 136, 73, 177),
            size: 35.0,
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: DataEntryScreen(),
                    duration: const Duration(milliseconds: 500)));
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: size.height * 0.71,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30.0),
            color: const Color.fromARGB(208, 219, 188, 239),
            border: Border.all(
                color: const Color.fromARGB(255, 170, 105, 205), width: 3.0),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "DATE",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Times', fontSize: 25.0),
                ),
                Container(
                  height: 50.0,
                  width: 140,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(84, 37, 37, 37),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -2.0,
                      blurRadius: 5.0,
                    ),
                  ], borderRadius: BorderRadius.circular(60.0)),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12.0),
                      child: Text(
                        date,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Times',
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "COURSE NAME",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Times', fontSize: 25.0),
                ),
                Container(
                  height: 50.0,
                  width: 140,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(84, 37, 37, 37),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -2.0,
                      blurRadius: 5.0,
                    ),
                  ], borderRadius: BorderRadius.circular(60.0)),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12.0),
                      child: Text(
                        courseName.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Times',
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "NO.OF PRESENT",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Times', fontSize: 25.0),
                ),
                Container(
                  height: 50.0,
                  width: 140,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(84, 37, 37, 37),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -2.0,
                      blurRadius: 5.0,
                    ),
                  ], borderRadius: BorderRadius.circular(60.0)),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12.0),
                      child: Text(
                        (present.length - count(present)).toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Times',
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "NO.OF ABSENT",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Times', fontSize: 25.0),
                ),
                Container(
                  height: 50.0,
                  width: 140,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(84, 37, 37, 37),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -2.0,
                      blurRadius: 5.0,
                    ),
                  ], borderRadius: BorderRadius.circular(60.0)),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12.0),
                      child: Text(
                        (absent.length - count(absent)).toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Times',
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_download_outlined,
                    color: Color.fromARGB(180, 141, 75, 241),
                    size: 30.0,
                  ),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          width: 2.0, color: Color.fromARGB(255, 145, 81, 168)),
                      elevation: 10,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  label: const Text(
                    'DOWNLOAD',
                    style: TextStyle(
                        color: Color.fromARGB(180, 141, 75, 241),
                        fontFamily: 'Gabriela',
                        fontSize: 20.0),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
