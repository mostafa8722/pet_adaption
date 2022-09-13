

import 'package:get/get.dart';
import 'package:pet_adaption/models/on_board.dart';

class OnBoardController extends GetxController{


  var currentPage = 0.obs;
  var onBoardData = <OnBoard>[].obs;


  changePage (value){
    currentPage.value = value;
  }
  fetchBoard (){

    onBoardData.value = [
      OnBoard(
          text: 'Join us and discover the best\npet in your location',
          image: "assets/images/girls/girl-onboard1.png"),
      OnBoard(
          text: "We help people connect with pet \naround your Location",
          image: "assets/images/girls/girl-onboard2.png"),
      OnBoard(
          text: "We show the easy way to adopt pet. \nJust stay at home with us.",
          image: "assets/images/girls/girl-onboard3.png"),
    ];
  }
}