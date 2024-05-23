import 'package:flutter/cupertino.dart';
import 'package:rus_bal_dict/core/widgets/word_loading_list_item.dart';

class ShimmerList extends StatelessWidget {
  final int itemsCount;

  const ShimmerList({super.key, this.itemsCount = 20});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => const ShimmingWord(), itemCount: itemsCount);
  }

}