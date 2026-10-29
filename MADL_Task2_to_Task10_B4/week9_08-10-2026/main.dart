import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Configure Firebase for your app before running.
  runApp(const FirebaseDemoApp());
}

class FirebaseDemoApp extends StatelessWidget {
  const FirebaseDemoApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseDataPage(),
  );
}

class FirebaseDataPage extends StatefulWidget {
  const FirebaseDataPage({super.key});

  @override
  State<FirebaseDataPage> createState() => _FirebaseDataPageState();
}

class _FirebaseDataPageState extends State<FirebaseDataPage> {
  final _controller = TextEditingController();
  final DatabaseReference _reference = FirebaseDatabase.instance.ref('messages');
  String _message = 'No data loaded yet.';

  Future<void> _writeData() async {
    try {
      await _reference.push().set({
        'text': _controller.text.trim(),
        'createdAt': ServerValue.timestamp,
      });
      setState(() => _message = 'Data written successfully.');
      _controller.clear();
    } catch (e) {
      setState(() => _message = 'Write failed: $e');
    }
  }

  Future<void> _readData() async {
    try {
      final snapshot = await _reference.get();
      setState(() => _message = snapshot.exists ? snapshot.value.toString() : 'No records found.');
    } catch (e) {
      setState(() => _message = 'Read failed: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Task 10: Firebase Database')),
    body: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(children: [
        TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Message', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: ElevatedButton(onPressed: _writeData, child: const Text('Write data'))),
          const SizedBox(width: 10),
          Expanded(child: OutlinedButton(onPressed: _readData, child: const Text('Read data'))),
        ]),
        const SizedBox(height: 18),
        const Align(alignment: Alignment.centerLeft, child: Text('Database output', style: TextStyle(fontWeight: FontWeight.bold))),
        const SizedBox(height: 8),
        SelectableText(_message),
      ]),
    ),
  );
}
