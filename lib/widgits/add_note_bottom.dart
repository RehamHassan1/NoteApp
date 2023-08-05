import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notpad/cubits/cubit/add_note_cubit.dart';
import 'package:notpad/cubits/cubit/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottom extends StatelessWidget {
  const AddNoteBottom({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
           // print('Failed ${state.erorrMassage}');
         
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16.0,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: addNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
