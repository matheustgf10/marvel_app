import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_app/app/utils/constants.dart';

class LoadingComicsWidget extends StatefulWidget {
  @override
  _StateLoadingComicsWidget createState() => _StateLoadingComicsWidget();
}

class _StateLoadingComicsWidget extends State<LoadingComicsWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'lib/app/shared/assets/lottie/loader.json',
        repeat: true,
        height: 50,
      ),
    );
  }
}
