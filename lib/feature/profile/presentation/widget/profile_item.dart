import 'package:flutter/material.dart' show BuildContext, Color, Column, Divider, ListTile, StatelessWidget, Text, Theme, VoidCallback, Widget;
import 'package:flutter/src/widgets/basic.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback? onPress;
  final bool showDivider;

  const ProfileItem({super.key, required this.title, this.titleColor, this.onPress, this.showDivider = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: titleColor)),
            onTap: onPress,
          ),
          if (showDivider) const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(height: 2),
          ),
        ],
      ),
    );
  }
}
