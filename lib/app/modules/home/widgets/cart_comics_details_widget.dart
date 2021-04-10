import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';

class CartComicsDetailsWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  HomeStore controller;
  Comics previousComics;
  Comics nextComics;

  CartComicsDetailsWidget({
    this.isFirst,
    this.isLast,
    this.controller,
    this.previousComics,
    this.nextComics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(),
          Spacer(),
          TextButton(
            onPressed: () {
              // controller.toPreviousComics(previousComics);
              MapsLauncher.launchCoordinates(
                  -7.222744506064933, -39.32254216234647, 'Studio Geek Cariri');
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.shopping_cart_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
