import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/password_validator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _validationError = '';

  late final TextEditingController _con;
  final PasswordValidator _passwordValidator = PasswordValidator();

  @override
  void initState() {
    _con = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _con.dispose();
    super.dispose();
  }

  void _validate(String password) {
    final res = _passwordValidator.validate(password);

    if (res) {
      _validationError = 'Correct';
    } else {
      _validationError = 'Incorrect';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _con,
                onChanged: (_) {
                  _validationError = '';
                  setState(() {});
                },
              ),
              Text(
                _validationError,
                key: const Key('validation_text'),
              ),
              ElevatedButton(
                onPressed: () {
                  _validate(_con.text);
                },
                child: const Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
