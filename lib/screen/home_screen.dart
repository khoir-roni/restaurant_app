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
  Widget _buildCard(BuildContext context, RestaurantElement article) {
    return ListTile(
      onTap: () {
              },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        article.pictureId,
        width: 100.0,
      ),
      title: Text(article.name),
      subtitle: Text(article.city),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('local_restaurant.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
           final restaurant = restaurantFromJson(snapshot.data);

          final restaurantElement = restaurant.restaurants;

          return ListView.builder(
            itemCount: restaurantElement.length,
            itemBuilder: (context, index) {
              return _buildCard(context, restaurantElement[index]);
            },
          );
        },
      ),
    );
  }
}
