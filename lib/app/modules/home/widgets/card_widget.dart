import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/modules/home/widgets/comics_details_widget.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';

class CardWidget extends StatelessWidget {
  final Comics comics;
  final Comics comicsPrevious;
  final Comics comicsNext;
  final bool isFirst;
  final bool isLast;
  final HomeStore controller;

  const CardWidget({
    Key key,
    this.comics,
    this.comicsPrevious,
    this.comicsNext,
    this.isFirst,
    this.isLast,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        ComicsDetailsWidget(
          isFirst: isFirst,
          isLast: isLast,
          comics: comics,
          comicsPrevious: comicsPrevious,
          comicsNext: comicsNext,
        ).modalBottomSheet(context);
      },
      child: Container(
        height: 220,
        child: Column(
          children: [
            Container(
              child: Image.network(
                comics.thumbnailUrl,
                width: 100,
                height: 180,
              ),
            ),
            Container(
                height: 30,
                child: AutoSizeText(
                  comics.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
