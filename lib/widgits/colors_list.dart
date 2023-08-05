import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notpad/cubits/cubit/add_note_cubit.dart';

import 'constans.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActiv, required this.color});
  final bool isActiv;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActiv
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currindx = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currindx = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    kcolors[index];
                setState(() {});
              },
              child: ColorItem(
                color: kcolors[index],
                isActiv: currindx == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
