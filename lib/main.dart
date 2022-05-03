import 'package:flutter/material.dart';
import 'package:untitled/data/enums.dart';

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
  MathSign? sign;

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
                "${otherValue ?? ""} ${_mathSignToString()}",
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
                    onTap: () {
                      setState(() {
                        sign = null;
                        mainValue = "0";
                        otherValue = null;
                      });
                    },
                    value: "CE",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        mainValue = "0";
                      });
                    },
                    value: "C",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        if (mainValue.length == 1 && mainValue != "0") {
                          mainValue = "0";
                          return;
                        }
                        if (mainValue.length > 0) {
                          mainValue =
                              mainValue.substring(0, mainValue.length - 1);
                        }
                      });
                    },
                    value: "<-",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (sign == null || otherValue == null) {
                            return;
                          }

                          int mainValueInt = int.parse(mainValue);
                          int otherValueInt = int.parse(otherValue!);

                          int sum =
                              calculateResult(otherValueInt, mainValueInt);
                          mainValue = "$sum";
                          otherValue = null;
                          sign = null;
                        });
                      },
                      value: "=",
                      hasLowerOpacity: true),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        otherValue = mainValue;
                        mainValue = "0";
                        sign = MathSign.PLUS;
                      });
                    },
                    value: "+",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        otherValue = mainValue;
                        mainValue = "0";
                        sign = MathSign.MINUS;
                      });
                    },
                    value: "-",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        otherValue = mainValue;
                        mainValue = "0";
                        sign = MathSign.MULTIPLY;
                      });
                    },
                    value: "*",
                    hasLowerOpacity: true,
                  ),
                  SizedBox(width: 10),
                  CalculatorNumberButton(
                    onTap: () {
                      setState(() {
                        otherValue = mainValue;
                        mainValue = "0";
                        sign = MathSign.DIVIDE;
                      });
                    },
                    value: "/",
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
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "";
                        });
                      },
                      value: "😊")
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
                          mainValue = mainValue + "4";
                        });
                      },
                      value: "4"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "5";
                        });
                      },
                      value: "5"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "6";
                        });
                      },
                      value: "6"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "";
                        });
                      },
                      value: "❤"),
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
                          mainValue = mainValue + "7";
                        });
                      },
                      value: "7"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "8";
                        });
                      },
                      value: "8"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "9";
                        });
                      },
                      value: "9"),
                  SizedBox(width: 10.0),
                  CalculatorNumberButton(
                      onTap: () {
                        setState(() {
                          if (mainValue == "0") {
                            mainValue = "";
                          }
                          mainValue = mainValue + "0";
                        });
                      },
                      value: "0"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  int calculateResult(int number1, int number2) {
    if (sign == MathSign.PLUS) {
      return number1 + number2;
    } else if (sign == MathSign.MINUS) {
      return number1 - number2;
    } else if (sign == MathSign.MULTIPLY) {
      return number1 * number2;
    } else if (sign == MathSign.DIVIDE) {
      return number1 ~/ number2;
    } else {
      return 0;
    }
  }

  String _mathSignToString() {
    if (sign == MathSign.PLUS) {
      return "+";
    } else if (sign == MathSign.MINUS) {
      return "-";
    } else if (sign == MathSign.MULTIPLY) {
      return "*";
    } else if (sign == MathSign.DIVIDE) {
      return "/";
    } else {
      return "";
    }
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
        height: 65,
        width: 65,
        color:
            hasLowerOpacity ? Colors.indigo.withOpacity(0.75) : Colors.indigo,
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(fontSize: 30, color: Colors.amber),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
