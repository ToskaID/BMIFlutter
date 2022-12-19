// ignore_for_file: unnecessary_const

import 'package:bmi/constans/constan.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreen();
}

class _BmiDataScreen extends State<BmiDataScreen> {
  int height = 100;
  int weigth = 50;
  int age = 17;
  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;
    double bmi = weigth / (heightInMeter * heightInMeter);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                gender = "male";
                setState(() {});
              },
              child: BMICard(
                borderColor: (gender == "male") ? Colors.white : primaryColor,
                child: const GenderIconText(
                  icon: Icons.male,
                  title: 'Male',
                ),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {});
                },
                child: BMICard(
                  borderColor:
                      (gender == 'female') ? Colors.white : primaryColor,
                  child: const GenderIconText(
                    icon: Icons.female,
                    title: 'Female',
                  ),
                ),
              ),
            ),
          ])),
          Expanded(
              child: BMICard(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: labelTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$height ",
                    style: numberTextStyle,
                  ),
                  Text(
                    "cm",
                    style: labelTextStyle,
                  ),
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: 80,
                max: 200,
                thumbColor: Colors.red,
                activeColor: Colors.white,
                onChanged: (value) {
                  height = value.toInt();
                  setState(() {});
                },
              )
            ],
          ))),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: BMICard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                      ),
                      Text(
                        "$weigth",
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weigth += 1;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 40,
                              height: 40,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              weigth -= 1;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 40,
                              height: 40,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BMICard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Text(
                        "$age",
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              age += 1;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 40,
                              height: 40,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              age -= 1;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 40,
                              height: 40,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: calculateBmi(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: const Color(0xffec3c66),
              child: const Center(
                  child: const Text(
                "Hitung BMI",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff272a4e),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!)),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
