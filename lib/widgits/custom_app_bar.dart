// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon, this.onPresed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onPresed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
        CustomSearchIcon(
          onPresed: onPresed,
          icon: icon,
        ),
      ],
    );
  }
}
