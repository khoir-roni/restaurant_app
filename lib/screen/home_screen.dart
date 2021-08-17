import 'package:flutter/material.dart';
import 'package:restaurant_app/service/restaurant_service.dart';


class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant',
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Recomendation restaurant for you!',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListViewRestaurants(),
        )
      ],
    ));
  }
}
