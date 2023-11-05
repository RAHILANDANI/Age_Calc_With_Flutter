import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyappState();
}

class _MyappState extends State<MyApp> {

  int presentday =0;
  int presentmonth =0;
  int presentyear =0;


  var todaydate= DateTime.now();
  var ddcontroller = TextEditingController();
  var mmcontroller = TextEditingController();
  var yyyycontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff203A43),
          centerTitle: true,
          title: Text("Age Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's date",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: TextEditingController(text: "${todaydate.day}-${todaydate.month}-${todaydate.year}"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Date of birth",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: ddcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "DD"),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: mmcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "MM"),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: yyyycontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "YYYY"),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          ddcontroller.clear();
                          mmcontroller.clear();
                          yyyycontroller.clear();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: Color(0xff13547A)),
                          ),
                          child: Text(
                            "Clear",
                            style: TextStyle(fontSize: 24),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: (){

                          var dd = ddcontroller.text;
                          var mm = mmcontroller.text;
                          var yr = yyyycontroller.text;

                          var year = int.parse(yr);
                          var month = int.parse(mm);
                          var date = int.parse(dd);

                          var dob = DateTime(year,month,date);
                          agecalculate(todaydate, dob);

                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1, color: Colors.black45),
                              color: Color(0xff0F537D)),
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Present Age",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff13547A),
                          Color(0xff203A43),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$presentyear\nYear",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "$presentmonth\nMM",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text("$presentday\nDD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Next Birthday",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff6BBED9),
                          Color(0xff006ACB),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "00\nMM",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text("00\nDD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, color: Colors.white)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void agecalculate(DateTime todaydate,DateTime dob){
    print(todaydate.toString());
    print(dob.toString());
    var yr = todaydate.year-dob.year;
    var mm = todaydate.month-dob.month;
    var dd = todaydate.day-dob.day;

    presentday=dd;
    presentmonth=mm;
    presentyear=yr;

    //8+12-9=11
    //

    setState(() {});
    print("$yr , $mm ,$dd");

  }

}

