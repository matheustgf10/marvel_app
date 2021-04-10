import 'package:flutter/material.dart';
import 'package:marvel_app/app/shared/widgets/comics_shimmer_widget.dart';

class ComicsGridLoadingWidget extends StatelessWidget {
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
            itemCount: 8,
            itemBuilder: (context, int index) {
              return ComicsShimmerWidget();
            }),
      ),
    );
  }
}
