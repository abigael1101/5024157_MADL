import 'package:flutter/material.dart';

void main() => runApp(const LayoutDemoApp());

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Task 6: Layout Practice')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 600;
          final cards = [
            _InfoCard(title: 'Learn', icon: Icons.menu_book, color: Colors.blue),
            _InfoCard(title: 'Practice', icon: Icons.code, color: Colors.orange),
            _InfoCard(title: 'Build', icon: Icons.build, color: Colors.green),
          ];
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('My Learning Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (wide) Row(children: cards.map((c) => Expanded(child: Padding(padding: const EdgeInsets.all(6), child: c))).toList())
              else Column(children: cards.map((c) => Padding(padding: const EdgeInsets.only(bottom: 12), child: c)).toList()),
            ]),
          );
        },
      ),
    ),
  );
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _InfoCard({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Icon(icon, color: color, size: 34),
        const SizedBox(width: 14),
        Text(title, style: const TextStyle(fontSize: 18)),
      ]),
    ),
  );
}
