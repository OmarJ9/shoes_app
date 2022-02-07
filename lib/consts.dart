import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop_ui/models/cart_model.dart';
import 'package:shoes_shop_ui/models/shoes_model.dart';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color bleu = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);

List<ShoesModel> sportshoeslist = [
  ShoesModel(
      name: 'Nike Shoes',
      img: 'assets/images/sportshoes.png',
      company: 'Nike',
      price: 123,
      isselected: false,
      color: red),
  ShoesModel(
      name: 'Sport Shoes',
      img: 'assets/images/nikeshoes.png',
      company: 'Nike',
      price: 103,
      isselected: false,
      color: Colors.amber.shade700),
  ShoesModel(
      name: 'Sneakers',
      img: 'assets/images/nikesport.png',
      company: 'Nike',
      price: 100,
      isselected: false,
      color: bleu),
];

List<ShoesModel> menshoeslist = [
  ShoesModel(
      name: 'Mowdy Shoes',
      img: 'assets/images/blackshoes.png',
      company: 'Mowdy',
      price: 223,
      isselected: false,
      color: Colors.teal),
  ShoesModel(
      name: 'Rido Shoes',
      img: 'assets/images/menshoes.png',
      company: 'Rido',
      price: 199,
      isselected: false,
      color: Colors.amber.shade700),
  ShoesModel(
      name: 'Sunny Shoes',
      img: 'assets/images/redshoes.png',
      company: 'Sunny',
      price: 109,
      isselected: false,
      color: bleu),
];

List<ShoesModel> womenshoeslist = [
  ShoesModel(
      name: 'Caty Shoes',
      img: 'assets/images/femaleshoes.png',
      company: 'Caty',
      price: 499,
      isselected: false,
      color: Colors.amber.shade700),
  ShoesModel(
      name: 'Heelmy Shoes',
      img: 'assets/images/heelshoes.png',
      company: 'Heelmy',
      price: 567,
      isselected: false,
      color: bleu),
  ShoesModel(
      name: 'Pinky Shoes',
      img: 'assets/images/pinkshoes.png',
      company: 'Pinky',
      price: 533,
      isselected: false,
      color: red),
];

List<ShoesModel> allshoes = sportshoeslist + menshoeslist + womenshoeslist;

List sizes = [40, 41, 42, 43, 44];

List<CartModel> boughtitems = [];
List<ShoesModel> favouriteitems = [];

double total = 0.00;
