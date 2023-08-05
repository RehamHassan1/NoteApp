// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notpad/cubits/cubit/notes_cubit.dart';

import 'package:notpad/views/edit_note_view.dart';

import '../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Text(note.subtitle,
                    style: TextStyle(
                        fontSize: 19, color: Colors.black.withOpacity(.6))),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(note.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6), fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
