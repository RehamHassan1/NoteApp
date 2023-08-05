import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notpad/models/note_model.dart';
import 'package:notpad/widgits/constans.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  bool isLoading = false;
  Color color=    Color(0xfff9B6A6C);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(knotebox);

      await noteBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure('${e}', erorrMassage: e.toString()));
    }
  }
}
