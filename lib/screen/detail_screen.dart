import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/model/stars.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail_page';

  final RestaurantElement restaurantElement;
  const DetailScreen({required this.restaurantElement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantElement.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurantElement.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRatingStars(restaurantElement.rating),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    restaurantElement.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(restaurantElement.city),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Rating: ${restaurantElement.rating}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Deskripsi'),
                  Divider(color: Colors.grey),
                  Text(
                    restaurantElement.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    // ignore: prefer_const_constructors
                    child: Text('Read more'),
                    onPressed: () {
                      // Navigator.pushNamed(context, restaurantElementWebView.routeName,
                      //     arguments: restaurantElement.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
