

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/views/home_screen.dart';
import 'package:pet_adaption/views/on_board_screen.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1000),(){
      //Get.off(OnBoardScreen());
      Get.off(HomeScreen());
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pet Adaption",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}