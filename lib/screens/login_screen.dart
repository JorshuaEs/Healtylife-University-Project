import 'package:flutter/material.dart';
import 'package:healty_life/screens/home_screen.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      await firebase_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exists';
      } else if (e.code == 'wrong-password') {
        return 'Password does not match';
      }
      return 'An error occurred';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      await firebase_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );
      return null;
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return 'An error occurred';
    }
  }

  Future<String> _recoverPassword(String name) async {
    try {
      await firebase_auth.FirebaseAuth.instance.sendPasswordResetEmail(
        email: name,
      );
      return 'Password reset email sent successfully!';
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exists';
      }
      return 'An error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'HEALTYLIFE',
      logo: const AssetImage('assets/images/healtylife_img.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Colors.teal,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Color.fromRGBO(105, 240, 174, 1),
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
      ),
    );
  }
}
