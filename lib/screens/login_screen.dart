import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:healty_life/screens/home_screen.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Sign up Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return Future.value('User not exists');
      }
      return Future.value('');
    });
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
          //accentColor: Colors.yellow,
          errorColor: Colors.deepOrange,
          titleStyle: const TextStyle(
            color: Color.fromRGBO(105, 240, 174, 1),
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ));
  }
}
