import 'package:chance_app/src/screens/detail_screen.dart';
import 'package:chance_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chance App',
      initialRoute: 'home',
      routes: {
        'home': ( BuildContext context ) => HomeScreen(),
        'detail': ( BuildContext context ) => CardDetail()
      },
    );
  }
}