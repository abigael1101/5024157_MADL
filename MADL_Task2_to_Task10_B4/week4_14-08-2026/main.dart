import 'package:flutter/material.dart';

void main() => runApp(const FormDemoApp());

class FormDemoApp extends StatelessWidget {
  const FormDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const RegistrationForm(),
  );
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Task 5: Registration Form')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Full name', border: OutlineInputBorder()),
            validator: (value) => value == null || value.trim().isEmpty ? 'Enter your name' : null,
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Welcome, ${_nameController.text}!')),
                );
              }
            },
            child: const Text('Register'),
          ),
        ]),
      ),
    ),
  );
}
