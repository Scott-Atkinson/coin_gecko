import 'package:coin_gecko/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kcPrimaryColor,
      highlightColor: kcShimmerColor,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: MediaQuery.of(context).size.height ~/ 80,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 100,
                height: 10,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
