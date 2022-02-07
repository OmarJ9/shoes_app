import 'package:flutter/cupertino.dart';

class ShoesModel {
  final String img;
  final String name;
  final String company;
  final double price;
  bool isselected;
  final Color color;

  ShoesModel(
      {required this.img,
      required this.name,
      required this.company,
      required this.price,
      required this.isselected,
      required this.color});
}
