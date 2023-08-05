import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notpad/models/note_model.dart';

import '../../widgits/constans.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes()  {
    var noteBox = Hive.box<NoteModel>(knotebox);
    notes = noteBox.values.toList();
     emit(NotesSuccess());
  }
}
