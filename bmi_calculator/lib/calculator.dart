import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color myColor = Colors.transparent;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String result = "BMI: ";

  void calculateBMI(String weight, String height) {
    final double myDoubleWeight = double.parse(weight);
    final double myDoubleHeight = double.parse(height);

    final double res = myDoubleWeight / (myDoubleHeight * myDoubleHeight);

    setState(() {
      result = "BMI: ${res.toStringAsFixed(2)}";
      if (res < 18.5) {
        myColor = const Color(0xFF87B1D9);
      } else if (res >= 18.5 && res <= 24.9) {
        myColor = const Color(0xFF3DD365);
      } else if (res >= 25 && res <= 29.9) {
        myColor = const Color(0xFFEEE133);
      } else if (res >= 30 && res <= 34.9) {
        myColor = const Color(0xFFFD802E);
      } else {
        myColor = const Color(0xFFF95353);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6DD5ED),
                  Color(0xFF2193B0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0038FF),
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your weight (kg)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your height (m)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateBMI(
                          weightController.text,
                          heightController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0038FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: screenWidth * 0.8,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text(
                        result,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLegendItem(const Color(0xFF87B1D9), "Underweight"),
                        _buildLegendItem(const Color(0xFF3DD365), "Normal"),
                        _buildLegendItem(const Color(0xFFEEE133), "Overweight"),
                        _buildLegendItem(const Color(0xFFFD802E), "Obese"),
                        _buildLegendItem(const Color(0xFFF95353), "Extreme"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
