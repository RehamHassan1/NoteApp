import 'package:flutter/material.dart';

import '../widgits/add_note_bottom.dart';
import '../widgits/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              context: context,
              builder: (context) {
                return AddNoteBottom();
              });
        },
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}
