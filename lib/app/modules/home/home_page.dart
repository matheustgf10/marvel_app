import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/modules/home/widgets/grid_comics_widget.dart';
import 'package:marvel_app/app/modules/home/widgets/loading_comics_widget.dart';
import 'package:marvel_app/app/modules/home/widgets/orderby_dropdown_widget.dart';
import 'package:marvel_app/app/shared/widgets/comics_grid_loading_widget.dart';
import 'package:marvel_app/app/shared/widgets/comics_shimmer_widget.dart';
import 'package:marvel_app/app/shared/widgets/network_error_widget.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    controller.getComics(orderBy: 'title');

    return Scaffold(
      body: Container(
        color: BACKGROUND_DARK_COLOR,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Observer(builder: (context) {
                  return (controller.isLoaderComics)
                      ? Image.asset(
                          MARVEL_LOGO,
                          alignment: Alignment.center,
                          height: 80,
                        )
                      : SizedBox();
                }),
              ),
            ),
            Observer(builder: (context) {
              return (controller.isLoaderComics)
                  ? Container(
                      child: OrderByDropdownWidget(),
                    )
                  : SizedBox();
            }),
            Expanded(
              flex: 7,
              child: SafeArea(
                child: Observer(builder: (context) {
                  if (controller.isPressedDropdownOrderBy) {
                    if (controller.isReloadedComics) {
                      return Container(
                        child: GridComicsWidget(
                          comicsList: controller.comics,
                        ),
                      );
                    } else {
                      return ComicsGridLoadingWidget();
                    }
                  }

                  if (controller.isLoaderComics) {
                    // Check if isLoaderComics in controller is true
                    // case true load GridComicsWidget with contoller.comics [List of Comics]
                    return Container(
                      child: GridComicsWidget(comicsList: controller.comics),
                    );
                  } else {
                    // ? case false check if isNetworkError is true
                    if (controller.isNetworkError) {
                      // case isNetworkError is true
                      // load widget NetworkErrorWidget
                      return NetworkErrorWidget();
                    } else {
                      // case isNetworkError is false
                      // the comics it will be loaded
                      // while that show LoadingComicsWidget
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(children: [
                              Image.asset(
                                MARVEL_LOGO,
                                height: 200,
                              ),
                              LoadingComicsWidget(),
                            ]),
                          ),
                        ),
                      );
                    }
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
