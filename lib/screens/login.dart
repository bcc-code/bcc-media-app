import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final String? loginError;
  final void Function(bool)? onResult;

  const LoginScreen({super.key, this.loginError, this.onResult});

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
    if (widget.onResult != null) {
      widget.onResult!(true);
    }

    context.router.popUntil((route) => false);
    context.router.pushNamed('/');
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

    final error = await AuthService.instance.login();
    if (error == null) {
      handleSuccess();
    } else {
      handleError(error.toString());
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
