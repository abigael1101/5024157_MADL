import 'package:flutter/material.dart';

void main() => runApp(const NavigationDemoApp());

class NavigationDemoApp extends StatelessWidget {
  const NavigationDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/details': (context) => const DetailsPage(),
    },
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Task 8: Home')),
    body: Center(
      child: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card tapped!'))),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.touch_app, size: 42),
              const Text('Tap this card, or open details'),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/details'),
                child: const Text('Go to Details'),
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Details Page')),
    body: Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Back'),
      ),
    ),
  );
}
