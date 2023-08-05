import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'colors_list.dart';
import 'constans.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currindx;
  @override
  void initState() {
    currindx = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                //     BlocProvider.of<AddNoteCubit>(context).color = kcolors[index];
                widget.note.color = kcolors[index].value;
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
