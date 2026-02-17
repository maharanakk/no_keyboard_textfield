import 'package:flutter/material.dart';
import 'package:no_keyboard_textfield/no_keyboard_textfield.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  String lastScan = "Nothing scanned yet";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('No Keyboard TextField Example')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Scan using hardware scanner (keyboard will NOT open)",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: NoKeyboardEditableText(
                  controller: controller,
                  autofocus: true,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  cursorColor: Colors.blue,
                  onSubmitted: (value) {
                    setState(() {
                      lastScan = value;
                    });
                    controller.clear();
                  },
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Last scanned value:",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                lastScan,
                style: const TextStyle(fontSize: 22, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
