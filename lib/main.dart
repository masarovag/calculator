import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mainValue = "0";
  String? otherValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //theOtherNumber
              Text(
                "${otherValue ?? ""}",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 15.0),
              //theMainNumber
              Text(
                "$mainValue",
                style: TextStyle(fontSize: 36.0),
              ),
              SizedBox(height: 15.0),
              Container(height: 4.0, color: Colors.black12),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorNumberButton(
                    onTap: () {},
                    value: "+",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {},
                    value: "-",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {},
                    value: "=",
                    hasLowerOpacity: true,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "1";
                        });
                      },
                      value: "1"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "2";
                        });
                      },
                      value: "2"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "3";
                        });
                      },
                      value: "3"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorNumberButton extends StatelessWidget {
  final Function() onTap;
  final String value;
  final bool hasLowerOpacity;
  const CalculatorNumberButton({
    required this.onTap,
    required this.value,
    this.hasLowerOpacity = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 90,
        color:
            hasLowerOpacity ? Colors.indigo.withOpacity(0.75) : Colors.indigo,
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(fontSize: 58, color: Colors.amber),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
