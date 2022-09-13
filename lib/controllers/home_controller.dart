
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/models/cat.dart';
import 'package:pet_adaption/models/category.dart';
import 'package:pet_adaption/models/owner.dart';
import 'package:pet_adaption/utils/constant.dart';

class HomeController extends GetxController{

  var categories = <Category>[].obs;
  var cats = <Cat>[].obs;
  var icons = <IconData>[].obs;
 var selectedPage = 0.obs ;

  var desc = 'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries.';

  fetchCategories(){
    categories.value =  [
      Category(0, "Cats"),
      Category(1, "Cats"),
      Category(2, "Dogs"),
      Category(3, "Birds"),
      Category(4, "Fishs"),
    ];
  }
  fetchIcons(){
    icons.value  = [
      Icons.home_outlined,
      Icons.favorite_outline_rounded,
      Icons.chat_outlined,
      Icons.person_outline_rounded
    ];
  }
  changePage(value){
    selectedPage.value = value;
  }
  fetchCats(){
    cats.value = [
      Cat(
          fav: true,
          color: orange,
          name: 'Leo',
          description: desc,
          location: 'Dumai, Riau',
          sex: 'Male',
          age: 2.1,
          weight: 4.5,
          image: 'assets/images/cats/cat1.png',
          distance: 7,
          owner: owners[0]),
      Cat(
          fav: false,
          color: green,
          name: 'Lily',
          description: desc,
          location: 'Siak, Riau',
          sex: 'Female',
          age: 1.2,
          image: 'assets/images/cats/cat2.png',
          weight: 2.6,
          distance: 5,
          owner: owners[1]),
      Cat(
          fav: true,
          color: blue,
          name: 'Cleo',
          image: 'assets/images/cats/cat3.png',
          description: desc,
          location: 'Pekanbaru, Riau',
          sex: 'Male',
          age: 1.4,
          weight: 3.4,
          distance: 7,
          owner: owners[2]),
      Cat(
          fav: true,
          color: red,
          image: 'assets/images/cats/cat4.png',
          name: 'Milo',
          description: desc,
          location: 'Kampar, Riau',
          sex: 'Female',
          age: 1.1,
          weight: 3.2,
          distance: 11,
          owner: owners[0]),
    ];
  }
}