import 'package:flutter/material.dart';
import 'package:hookah_nation_client_app/src/common/widgets/buttons/LoginButton.dart';
import 'package:hookah_nation_client_app/src/common/widgets/buttons/SignupButton.dart';
import 'package:hookah_nation_client_app/src/common/widgets/textfields/EmailTextField.dart';
import 'package:hookah_nation_client_app/src/common/widgets/textfields/PasswordTextField.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.asset(
                //     "assets/logo.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(height: 45.0),
                EmailTextField(),
                SizedBox(height: 25.0),
                PasswordTextField(),
                SizedBox(
                  height: 35.0,
                ),
                
                LoginButton(),
                SizedBox(
                  height: 15.0,
                ),
                SignupButton(),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

