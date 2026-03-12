import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController a = TextEditingController();
  final TextEditingController b = TextEditingController();
  final TextEditingController c= TextEditingController();
  double result = 0;

  @override
  void dispose() {
    a.dispose();
    b.dispose();
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: a,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter first number",
              ),
            ),
            TextField(
              controller: b,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter second number",
              ),
            ),
            TextField(
              controller: c,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter operator",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  switch (c.text) {
                    case "+":
                    result =double.parse(a.text)+double.parse(b.text);
                      break;

                    case "-":
                      result=double.parse(a.text)-double.parse(b.text);
                      break;


                    case "*":
                      result= double.parse(a.text)*double.parse(b.text);
                      break;

                    case "/":
                      result=double.parse(a.text)/double.parse(b.text);
                      break;
                    default:
                      print(result=0);
                    }
                });
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text(
              "Result: $result",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
