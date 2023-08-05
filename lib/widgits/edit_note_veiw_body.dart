// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notpad/cubits/cubit/notes_cubit.dart';
import 'package:notpad/models/note_model.dart';
import 'package:notpad/widgits/custem_textfield.dart';
import 'package:notpad/widgits/custom_app_bar.dart';

import 'edit_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomAppBar(
              onPresed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                subtitle = value;
              },
              maxline: 5,
              hint: widget.note.subtitle,
            ),
            SizedBox(
              height: 16,
            ),
            EditColorList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
