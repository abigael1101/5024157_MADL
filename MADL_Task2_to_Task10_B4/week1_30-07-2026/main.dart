import 'package:flutter/material.dart';

void main() => runApp(const SetupDemoApp());

class SetupDemoApp extends StatelessWidget {
  const SetupDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Setup Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Task 2: Flutter Setup')),
        body: const Center(
          child: Text('Flutter is ready!', style: TextStyle(fontSize: 26)),
        ),
      ),
    );
  }
}
