import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0, num2 = 0;
  String operator = '+';
  String result = '';

  Future<void> calculate() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/calc'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'num1': num1, 'num2': num2, 'operator': operator}),
    );

    if (response.statusCode == 200) {
      setState(() {
        result = jsonDecode(response.body)['result'].toString();
      });
    } else {
      setState(() {
        result = 'Error: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Number 1'),
              keyboardType: TextInputType.number,
              onChanged: (value) => num1 = double.tryParse(value) ?? 0,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Number 2'),
              keyboardType: TextInputType.number,
              onChanged: (value) => num2 = double.tryParse(value) ?? 0,
            ),
            DropdownButton<String>(
              value: operator,
              items: ['+', '-', '*', '/']
                  .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                  .toList(),
              onChanged: (value) => setState(() => operator = value!),
            ),
            ElevatedButton(onPressed: calculate, child: Text('Calculate')),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}