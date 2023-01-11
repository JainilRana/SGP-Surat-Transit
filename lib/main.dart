import 'package:flutter/material.dart';
import 'package:surat_transit/Screens/RouteScreen.dart';
import 'package:surat_transit/Screens/searchRoutes.dart';

import 'package:surat_transit/Screens/splashScreen.dart';

import 'Screens/HomeScreenWidget/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'poppins', fontSize: 14),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
