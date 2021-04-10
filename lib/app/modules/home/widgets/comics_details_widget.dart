import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/app/modules/home/widgets/cart_comics_details_widget.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';
import 'package:marvel_app/app/utils/constants.dart';

class ComicsDetailsWidget extends StatelessWidget {
  Comics comics;
  Comics comicsPrevious;
  Comics comicsNext;
  bool isFirst;
  bool isLast;

  ComicsDetailsWidget({
    this.comics,
    this.comicsPrevious,
    this.comicsNext,
    this.isFirst,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void modalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "lib/app/shared/assets/background/background.png"),
                        fit: BoxFit.cover),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      child: CartComicsDetailsWidget(
                          isFirst: isFirst,
                          isLast: isLast,
                          previousComics: comicsPrevious,
                          nextComics: comicsNext),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Image.network(
                              comics.thumbnailUrl,
                              height: 250,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              comics.title,
                              style: TITLE_COMICS_DETAILS,
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 2),
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              comics.copyright,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 20, top: 5),
                      alignment: Alignment.bottomLeft,
                      child: AutoSizeText(
                        comics.description,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
