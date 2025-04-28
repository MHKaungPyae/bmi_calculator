import 'package:flutter/material.dart';
import 'constants.dart';

class Calculation extends StatelessWidget {
  final int weight;
  final int height;

  const Calculation({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate BMI here
    double heightInMeters = height.toDouble() / 100;
    double weightInKg = weight.toDouble();
    double bmiResult = (weightInKg / (heightInMeters * heightInMeters)).roundToDouble();

    String getResult(double result) {
      if (result < 18.5) {
        return 'Underweight';
      } else if (result >= 18.5 && result < 25) {
        return 'Normal';
      } else if (result >= 25 && result < 30) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    }

    String getInterpretation(double bmi) {
      if (bmi < 18.5) {
        return 'You have a lower than normal body weight. Try to eat more.';
      } else if (bmi >= 18.5 && bmi < 25) {
        return 'You have a normal body weight. Good job!';
      } else if (bmi >= 25 && bmi < 30) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else {
        return 'You have a very high body weight. Please consult a doctor.';
      }
    }

    String resultText = getResult(bmiResult);
    String interpretation = getInterpretation(bmiResult);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'YOUR RESULT',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 80),
            Expanded(
              child: Text(
                resultText,  // Use the calculated result
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18
                ),
              ),
            ),
            Expanded(
              child: Text(
                bmiResult.toString(),  // Display the BMI value
                style: kNumberTextStyle,
              ),
            ),
            Expanded(
              child: Text(
                interpretation,
                textAlign: TextAlign.center,// Use the interpretation
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);  // Go back to previous page
              },
              child: Container(
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}