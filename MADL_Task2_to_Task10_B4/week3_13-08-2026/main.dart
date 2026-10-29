import 'package:flutter/material.dart';

void main() => runApp(const CommonWidgetsApp());

class CommonWidgetsApp extends StatelessWidget {
  const CommonWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Task 4: Common Widgets')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Welcome to Flutter UI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(color: Colors.indigo.shade100, borderRadius: BorderRadius.circular(12)),
                child: const Text('This is a styled Container widget.'),
              ),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'Enter your name', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () {}, child: const Text('Submit')),
              const Icon(Icons.flutter_dash, size: 48),
            ],
          ),
        ),
      ),
    );
  }
}
