import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/constants/strings.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      MyAppBar(title: 'О приложении'),
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(aboutUs),
            ),
          ),
        ),
      ),
    ]);
  }
}
