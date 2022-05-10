
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TCGCardLoadingWidget extends StatelessWidget {
  const TCGCardLoadingWidget( {Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
        Shimmer.fromColors(
            baseColor: Colors.grey[900]!,
            highlightColor: Colors.grey[800]!,
            enabled: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                color: Colors.black,
              ),
            )
        )
    );
  }
}