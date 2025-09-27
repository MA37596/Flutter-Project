import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox + 2 Textfields',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _submit() {
    // valideer alleen als de formKey bestaat
    if (_formKey.currentState?.validate() ?? false) {
      final v1 = _controller1.text;
      final v2 = _controller2.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Box1: "$v1", Box2: "$v2", Checked: $_checked')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox met 2 tekstvelden')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CheckboxListTile(
                value: _checked,
                title: const Text('Activeer tekstvelden'),
                onChanged: (val) => setState(() => _checked = val ?? false),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _controller1,
                enabled: _checked,
                decoration: const InputDecoration(
                  labelText: 'Tekstveld 1',
                  border: OutlineInputBorder(),
                  hintText: 'Vul iets in...',
                ),
                validator: (value) {
                  if (_checked && (value == null || value.trim().isEmpty)) {
                    return 'Dit veld is verplicht wanneer checkbox aanstaat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controller2,
                enabled: _checked,
                decoration: const InputDecoration(
                  labelText: 'Tekstveld 2',
                  border: OutlineInputBorder(),
                  hintText: 'Nog iets...',
                ),
                validator: (value) {
                  if (_checked && (value == null || value.trim().isEmpty)) {
                    return 'Dit veld is verplicht wanneer checkbox aanstaat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(onPressed: _submit, child: const Text('Submit')),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _checked = false;
                        _controller1.clear();
                        _controller2.clear();
                        _formKey.currentState?.reset();
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
