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
      title: 'Calculate your BMI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("yourBMI")),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xfffbc2eb), Color(0xffa6c1ee)],
            begin: FractionalOffset(1.0,
                0.0), // here first colors stars from top digonally and become transparent in end
            end: FractionalOffset(0.0, 1.0),
          )),
          // for good gradient color goto webgradient.com
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wtcontroller,
                      decoration: InputDecoration(
                        label: Text("Enter your weight( in kilogram)"),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftcontroller,
                      decoration: InputDecoration(
                        label: Text("Enter your Height( in feet)"),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: incontroller,
                      decoration: InputDecoration(
                        label: Text("Enter your height( in inch"),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtcontroller.text.toString();
                          var ft = ftcontroller.text.toString();
                          var inch = incontroller.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            //BMI calculation
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tinch = (ift * 12) + iInch;
                            var tcm = tinch * 2.54;
                            var tM = tcm / 100;
                            var bmi = iwt / (tM * tM);

                            var msg = "";
                            if (bmi > 25) {
                              msg = "you're Overweight";
                              bgcolor = Colors.orange.shade200;
                            } else if (bmi < 18) {
                              msg = "You're underweight";
                              bgcolor = Colors.red.shade200;
                            } else {
                              msg = "You'are Healthy!!";
                              bgcolor = Colors.green.shade200;
                            }
                            setState(() {
                              result = "Your BMI is:${bmi.toStringAsFixed(4)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill all the required blanks!! ";
                            });
                          }
                        },
                        child: Text(
                          "Calculate",
                        )),
                    SizedBox(
                      height: 11,
                    ),
                    Text(result, style: TextStyle(fontSize: 17)),
                  ]),
            ),
          ),
        ));
  }
}
