import 'package:biometric_auth/authentication/auth.dart';
import 'package:biometric_auth/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async {
          bool isAuthenticated = await Authentication.authenticateWithBiometrics();

          if(isAuthenticated){
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }else{
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You can't go further without authentication")));
          }
        }, child: const Text("Authenticate")),
      ),
    );
  }
}