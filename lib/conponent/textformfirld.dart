import 'package:flutter/material.dart';

class MyTextForm extends StatefulWidget {
  final String hint;
  final IconData icon;
  MyTextForm({Key? key, required this.hint, required this.icon})
      : super(key: key);

  @override
  _MyTextFormState createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      ///////Validator//////
      onSaved: (newValue) {},
      validator: (value) {
        if (value!.isEmpty) return "Empty";
        if (value.length < 5) return "Wrong Value";
        return null;
      },
      /////////////
      autovalidateMode: AutovalidateMode.onUserInteraction,
      /////
      cursorColor: Colors.amber,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.amber,
          ),
          fillColor: Colors.amber[100],
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 2, color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          )),
    );
  }
}
