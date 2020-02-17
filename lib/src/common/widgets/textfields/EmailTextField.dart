

import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      style: TextStyle(
        fontFamily: 'Montserrat', 
        fontSize: 20.0
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Email',
          border: null,
      ),
    );
  }
}
