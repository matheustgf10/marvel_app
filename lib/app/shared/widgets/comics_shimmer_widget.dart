import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComicsShimmerWidget extends StatelessWidget {
  final Color shimmerBaseColor = Color.fromRGBO(105, 105, 105, 1);
  final Color shimmerHighlightColor = Color.fromRGBO(168, 168, 168, 1);
  final Color backgroundItemColor = Color.fromRGBO(32, 32, 32, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Shimmer.fromColors(
            child: Container(
              height: 160,
              width: 100,
              decoration: BoxDecoration(
                color: this.backgroundItemColor,
              ),
            ),
            baseColor: this.shimmerBaseColor,
            highlightColor: this.shimmerHighlightColor,
            enabled: true,
          ),
          SizedBox(height: 5),
          Shimmer.fromColors(
            child: Container(
              height: 20,
              width: 150,
              decoration: BoxDecoration(
                color: this.backgroundItemColor,
              ),
            ),
            baseColor: this.shimmerBaseColor,
            highlightColor: this.shimmerHighlightColor,
            enabled: true,
          ),
        ],
      ),
    );
  }
}
