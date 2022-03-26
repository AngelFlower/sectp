import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Future submit() async {
    Provider.of<Auth>(context, listen: false)
        .login(credentials: {'email': _email, 'password': _password});

    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: 'allan61@example.com',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'you@somewhere.com',
                      ),
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    TextFormField(
                      initialValue: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: '********',
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          submit();
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
