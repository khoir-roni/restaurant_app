import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/service/restaurant_service.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import 'package:restaurant_app/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  Widget _buildCard(BuildContext context, RestaurantElement restaurantElement) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurantElement);
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        restaurantElement.pictureId,
        width: 100.0,
      ),
      title: Text(restaurantElement.name),
      subtitle: Text(restaurantElement.city),
    );
  }

  _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  Widget _buildList(BuildContext context, RestaurantElement restaurantElement) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurantElement);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0,
                        child: Text(
                          restaurantElement.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    restaurantElement.city,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  _buildRatingStars(restaurantElement.rating),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          restaurantElement.rating.toString(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 15.0,
            bottom: 15.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                width: 110.0,
                image: NetworkImage(
                  restaurantElement.pictureId,
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
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
              // return _buildCard(context, restaurantElement[index]);
              return _buildList(context, restaurantElement[index]);
              ;
            },
          );
        },
      ),
    );
  }
}
