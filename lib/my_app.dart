

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/views/splash_screen.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
    );

  }
}