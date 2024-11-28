import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/api_provider.dart';

import 'myapp.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ApiProvider(),
    ),
  ], builder: (context, child) => MyApp()));
}
