import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:flutter/services.dart';
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

  Future loadPerson() async {
    String jsonString = await loadRestaurantFromAssets();
    final jsonResponse = json.decode(jsonString);
    ListRestaurant listrestaurants = ListRestaurant.fromJson(jsonResponse);
    print('Name: ${listrestaurants.restaurants}');
  }

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
