// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var color = Color(0xff203a43);
  var ts = TextStyle(color: Colors.white, fontSize: 18);

  var ddController = TextEditingController();
  var mmController = TextEditingController();
  var yyyyController = TextEditingController();
  var todayDate = DateTime.now();

  int presentDay = 0;
  int presentMonth = 0;
  int presentYear = 0;

  int nextMonth = 0;
  int nextDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: color,
          title: Text("Age Calculator"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today's Date"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: TextEditingController(text: "${todayDate.day}-${todayDate.month}-${todayDate.year}"),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Date of Birth"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: ddController,
                        decoration: InputDecoration(
                            hintText: "DD",
                            hintStyle: TextStyle(color: Color(0xffe5e5e5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: color),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: color),
                            )),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.length > 2) {
                            ddController.clear();
                          } else {
                            int val = int.parse(value);
                            if (val > 31) {
                              ddController.clear();
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: mmController,
                        decoration: InputDecoration(
                            hintText: "MM",
                            hintStyle: TextStyle(color: Color(0xffe5e5e5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: color),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: color),
                            )),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: yyyyController,
                        decoration: InputDecoration(
                          hintText: "YYYY",
                          hintStyle: TextStyle(color: Color(0xffe5e5e5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: color),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: color),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          ddController.clear();
                          mmController.clear();
                          yyyyController.clear();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text("Clear"),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xff13547a))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var dd = ddController.text;
                          var mm = mmController.text;
                          var yyyy = yyyyController.text;

                          var year = int.parse(yyyy);
                          var month = int.parse(mm);
                          var day = int.parse(dd);

                          var dob = DateTime(year, month, day);
                          ageCal(todayDate, dob);
                          nextBd(dob);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Claculate",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff13547a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff13547a)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Present Age"),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 55),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff13547a),
                          Color(0xff203a43),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "$presentYear\nYear",
                        textAlign: TextAlign.center,
                        style: ts,
                      )),
                      Expanded(
                          child: Text(
                        "$presentMonth\nMM",
                        textAlign: TextAlign.center,
                        style: ts,
                      )),
                      Expanded(
                          child: Text(
                        "$presentDay\nDD",
                        textAlign: TextAlign.center,
                        style: ts,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Next Birthday"),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 55),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff6bbed9),
                          Color(0xff006acb),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "$nextMonth\nMM",
                        textAlign: TextAlign.center,
                        style: ts,
                      ),
                      Text(
                        "$nextDay\nDD",
                        textAlign: TextAlign.center,
                        style: ts,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void ageCal(DateTime todayDate, DateTime dob) {
    var year = todayDate.year - dob.year;
    var month = todayDate.month - dob.month;
    var day = todayDate.day - dob.day;

    if (day < 0) {
      month--;
      day = day + 30;
    }
    if (month < 0) {
      year--;
      month = month + 12;
    }

    presentDay = day;
    presentMonth = month;
    presentYear = year;
    setState(() {});

    print("year $year, month $month, day $day");
  }

  void nextBd(DateTime dob) {
    DateTime now = DateTime.now();
    DateTime nextDob = DateTime(now.year, dob.month, dob.day);

    if (nextDob.isBefore(now)) {
      nextDob = DateTime(now.year + 1, dob.month, dob.day);
    }

    var diff = nextDob.difference(now);
    var inDays = diff.inDays;
    var inMonth = inDays ~/ 30;
    inDays = inDays % 30;

    print("inDays $inDays");
    print("inMonth $inMonth");

    //2023-07-26
    //2023-08-24
  }
}
