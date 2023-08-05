// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    Key? key,
    required this.icon, this.onPresed,
  }) : super(key: key);
  final IconData icon;
 final void Function()? onPresed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 47,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
          child: IconButton(
        onPressed: onPresed,
        icon: Icon(icon),
      )),
    );
  }
}
