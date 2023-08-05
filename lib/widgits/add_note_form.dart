import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notpad/cubits/cubit/add_note_cubit.dart';
import 'package:notpad/models/note_model.dart';
import 'colors_list.dart';
import 'custem_textfield.dart';
import 'custom_botton.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({
    super.key,
  });

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState> formk = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formk,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Content',
            maxline: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ColorList(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formk.currentState!.validate()) {
                    formk.currentState!.save();
                    var currDate = DateTime.now();
                    var formatcurrDate =
                        DateFormat('dd-mm-yyyy').format(currDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatcurrDate,
                        color: Colors.amber.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
