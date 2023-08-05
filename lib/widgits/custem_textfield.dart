import 'package:flutter/material.dart';

import 'constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxline = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxline;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged:onChanged ,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kprimarycolor,
      maxLines: maxline,
      decoration: InputDecoration(
        border: buildborder(),
        hintText: hint,
        // hintStyle: TextStyle(color: kprimarycolor),
        enabledBorder: buildborder(),
        focusedBorder: buildborder(kprimarycolor),
      ),
    );
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
