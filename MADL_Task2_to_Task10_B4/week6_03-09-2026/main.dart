import 'package:flutter/material.dart';

void main() => runApp(const VisualWidgetsApp());

class VisualWidgetsApp extends StatelessWidget {
  const VisualWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Task 7: Icons, Images & Chart')),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        const Text('Flutter Visual Widgets', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        const Row(children: [Icon(Icons.star, color: Colors.amber, size: 32), SizedBox(width: 8), Text('Built-in icon widget')]),
        const SizedBox(height: 18),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            height: 170, fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => const SizedBox(height: 100, child: Center(child: Text('Image unavailable'))),
          ),
        ),
        const SizedBox(height: 18),
        const Text('Weekly progress'),
        const SizedBox(height: 8),
        ...[
          ('Mon', 0.35), ('Tue', 0.60), ('Wed', 0.85), ('Thu', 0.50), ('Fri', 0.95)
        ].map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(children: [
            SizedBox(width: 42, child: Text(item.$1)),
            Expanded(child: LinearProgressIndicator(value: item.$2, minHeight: 12)),
            const SizedBox(width: 8),
            Text('${(item.$2 * 100).round()}%'),
          ]),
        )),
      ]),
    ),
  );
}
