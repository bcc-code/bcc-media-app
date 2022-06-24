
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function() loginAction;
  final String? loginError;

  const LoginPage({super.key, required this.loginAction, this.loginError});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: loginAction,
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}