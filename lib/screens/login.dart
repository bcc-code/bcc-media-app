
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final String? loginError;

  const LoginScreen({super.key, this.loginError});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isProgressing = false;
  bool isLoggedIn = false;
  String errorMessage = '';

  handleSuccess() {
    setState(() {
      isProgressing = false;
      isLoggedIn = true;
    });

    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  handleError(String message) {
      setState(() {
        isProgressing = false;
        errorMessage = message;
      });
  }
  
  Future<void> loginAction() async {
    setState(() {
      isProgressing = true;
      errorMessage = '';
    });

    final message = await AuthService.instance.login();
    if (message == 'Success') {
      handleSuccess();
    } else {
      handleError(message);
    }
  }

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
          Text(errorMessage)
        ],
      ),
    );
  }
}