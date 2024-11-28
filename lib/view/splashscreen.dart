import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/routes/routes.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.home_page);
    });
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
          child: Image(
        image: NetworkImage(
            "https://icon-library.com/images/weather-icon-gif/weather-icon-gif-26.jpg"),
      )),
    );
  }
}
