import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/home/widgets/card_widget.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';

class GridComicsWidget extends StatelessWidget {
  List<Comics> comicsList = [];
  GridComicsWidget({Key key, this.comicsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: comicsList.length,
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(
                isFirst: (index == 0) ? true : false,
                isLast: (index == comicsList.length - 1) ? true : false,
                comicsPrevious:
                    (index != 0) ? comicsList[index - 1] : comicsList[index],
                comics: comicsList[index],
                comicsNext: (index != comicsList.length - 1)
                    ? comicsList[index + 1]
                    : comicsList[index - 1],
              );
            }),
      ),
    );
  }
}
