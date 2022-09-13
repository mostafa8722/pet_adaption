
import 'package:flutter/material.dart';
import 'package:pet_adaption/models/owner.dart';

class Cat {


  Color color;
  String name,location,sex,image,description;
  double age , weight;
  int distance;
  bool fav;
  Owner owner;
  Cat({
    required this.color,
    required this.name,
    required this.location,
    required this.sex,
    required this.image,
    required this.description,
    required this.age,
    required this.weight,
    required this.distance,
    required this.fav,
    required this.owner,

});

}