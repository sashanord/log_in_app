import 'package:flutter/material.dart';
import 'package:log_in_app/Screens/Profile.dart';

import 'Screens/LogInScreen.dart';
import 'Screens/RegistrationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/' : (context) => LogInScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/profileScreen': (context) => Profile()
      },
    );
  }
}
