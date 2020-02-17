        // final passwordField = 

import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      style: TextStyle(
        fontFamily: 'Montserrat', 
        fontSize: 20.0
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          border: null,
      ),
    );
  }
}
