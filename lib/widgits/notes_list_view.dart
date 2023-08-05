import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notpad/cubits/cubit/notes_cubit.dart';
import 'package:notpad/models/note_model.dart';
import 'custom_note_icon.dart';

class Notelistview extends StatelessWidget {
  const Notelistview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes=BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length ,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NoteItem(note: notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}
