import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const FileDemoApp());

class FileDemoApp extends StatelessWidget {
  const FileDemoApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FilePage(),
  );
}

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final _controller = TextEditingController();
  String _status = 'Enter text, then save or read it.';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/practical_note.txt');
  }

  Future<void> _save() async {
    try {
      final file = await _getFile();
      await file.writeAsString(_controller.text);
      setState(() => _status = 'Saved to: ${file.path}');
    } catch (e) {
      setState(() => _status = 'Save failed: $e');
    }
  }

  Future<void> _read() async {
    try {
      final file = await _getFile();
      final content = await file.readAsString();
      setState(() {
        _controller.text = content;
        _status = 'File read successfully.';
      });
    } catch (e) {
      setState(() => _status = 'Read failed: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Task 9: File Handling')),
    body: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(children: [
        TextField(controller: _controller, maxLines: 4, decoration: const InputDecoration(labelText: 'Text to save', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: ElevatedButton(onPressed: _save, child: const Text('Save'))),
          const SizedBox(width: 10),
          Expanded(child: OutlinedButton(onPressed: _read, child: const Text('Read'))),
        ]),
        const SizedBox(height: 12),
        SelectableText(_status),
      ]),
    ),
  );
}
