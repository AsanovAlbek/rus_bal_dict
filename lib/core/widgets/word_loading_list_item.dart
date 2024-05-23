import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmingWord extends StatelessWidget {
  const ShimmingWord({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Shimmer.fromColors(
          baseColor: Colors.orange, highlightColor: Colors.red, child: SizedBox(height: 10, width: 10)),
    );
  }
}
