import 'dart:async';

import 'package:flutter/material.dart';
import 'NavigationScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  // ignore: non_constant_identifier_names
  void initState() {
    // TODO: implement initState
    // ReadJson();
    super.initState();
    Timer(Duration(seconds: 7), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const NavigetScreen()),
        ),
      );
    }));
  }

// NavigetScreen()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 33, 139, 253),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 1.56,
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Image.asset("assets/images/logo_flash.gif"),
            const Text(
              'SuratGo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat_Subrayada',
              ),
            )
          ]),
        )),
      ),
    );
  }
}
