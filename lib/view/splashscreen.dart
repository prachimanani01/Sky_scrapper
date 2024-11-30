import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/routes/routes.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, Routes.home_page);
    });
    return Scaffold(
      backgroundColor: Color(0xffF3F7FB),
      body: Center(
          child: Image(
        image: NetworkImage(
            "https://i.pinimg.com/originals/79/35/fd/7935fdf1fe2c5dd8205de03a214befb0.gif"),
      )),
    );
  }
}
