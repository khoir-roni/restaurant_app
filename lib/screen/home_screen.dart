import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            //in case if error found
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            //once data is ready this else block will execute
            // items will hold all the data of DataModel
            //items[index].name can be used to fetch name of product as done below
            var items = data.data as List<ListRestaurant>;
               return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: NetworkImage(items[1].restaurants[index].pictureId.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[1].restaurants[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(items[1].restaurants[index].city.toString()),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            // show circular progress while data is getting fetched from json file
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ListRestaurant>> ReadJsonData() async {
    //read json file
    final jsondata =
        await rootBundle.rootBundle.loadString('local_restaurant.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => ListRestaurant.fromJson(e)).toList();
  }
}
