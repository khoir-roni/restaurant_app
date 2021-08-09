import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:flutter/services.dart' ;
import 'dart:convert';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> loadRestaurantFromAssets() async {
    return await rootBundle.loadString('local_restaurant.json');
  }

  List drinks = [];
  Future loadPerson() async {
    String jsonString = await loadRestaurantFromAssets();
    final jsonResponse = json.decode(jsonString);
    // print('jsonResponse: ${jsonResponse}');
    //print('restaurants: ${jsonResponse['restaurants']['id']}');
    ListRestaurant listrestaurants = ListRestaurant.fromJson(jsonResponse);
    // print('Name: ${listrestaurants.restaurants[1].menus.drinks[1].name}');
    //print(listrestaurants.restaurants.toString());

    setState(() {
      drinks = listrestaurants.restaurants[1].menus.drinks;
    });
    print(drinks);
  }

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
