import 'package:flutter/material.dart';

import 'login/view.dart';

void main() {
  runApp(MyApp());
}

/// Shows the login page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
