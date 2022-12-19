// ignore_for_file: unnecessary_const

import 'package:bmi/constans/constan.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});

  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";

    if (bmiValue < 16.0) {
      category = underWeightSevere;
    } else if (bmiValue >= 16.0 && bmiValue < 17) {
      category = underWeightModerate;
    } else if (bmiValue > 17.0 && bmiValue < 18.5) {
      category = underWeightMild;
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      category = normal;
    } else if (bmiValue > 25 && bmiValue < 30) {
      category = overweight;
    } else if (bmiValue >= 30 && bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue > 35 && bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue > 40) {
      category = obeseIII;
    }
    return category;
  }

  String getHealtRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underWeightSevere:
      case underWeightModerate:
      case underWeightMild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;

      case normal:
        desc = "Low risk (healty range)";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus";
        break;

      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMICard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      determineBmiCategory(bmi),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      getHealtRiskDescription(determineBmiCategory(bmi)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: const Color(0xffec3c66),
              child: const Center(
                  child: const Text(
                "Hitung Ulang",
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
