import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notpad/simple_bloc_observer.dart';
import 'package:notpad/views/notes_view.dart';
import 'package:notpad/widgits/constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cubit/notes_cubit.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotebox);
  Bloc.observer = SimpleBlocObserver();
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: NotesView(),
      ),
    );
  }
}
