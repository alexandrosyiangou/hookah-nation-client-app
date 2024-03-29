import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthBloc.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthEvent.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthState.dart';
import 'package:hookah_nation_client_app/src/screens/HomeScreen.dart';

enum AuthMode { LOGIN, SINGUP, FORGOTPASSWORD }

class AuthorizationScreen extends StatefulWidget {
  @override
  AuthorizationScreenState createState() => AuthorizationScreenState();
}

class AuthorizationScreenState extends State<AuthorizationScreen> {
    // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  double screenHeight;
  // Set intial mode to login
  AuthMode _authMode = AuthMode.LOGIN;

  TextEditingController _signupNameController;
  TextEditingController _signupEmailController;
  TextEditingController _signupPasswordController;

  TextEditingController _loginEmailController;
  TextEditingController _loginPasswordController;

  @override
  void initState() {
    super.initState();
    _signupNameController = TextEditingController();
    _signupEmailController = TextEditingController();
    _signupPasswordController = TextEditingController();

    _loginEmailController = TextEditingController();
    _loginPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();

    _loginEmailController.dispose();
    _loginPasswordController.dispose();
  }

  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.home, 
            size: 48,
            color: Colors.white,
          ),
          Text(
            "LOGO",
            style: TextStyle(
              fontSize: 34, 
              color: Colors.white, 
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
  
  Widget loginCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 4),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _loginEmailController,
                    decoration: InputDecoration(
                      labelText: "Your Email",
                      hasFloatingPlaceholder: true
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _loginPasswordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hasFloatingPlaceholder: true
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _authMode = AuthMode.FORGOTPASSWORD;
                          });
                        },
                        child: Text("Forgot Password ?"),
                      ),     
                      FlatButton(
                        child: Text("Login"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)..add(Login(username: _loginEmailController.text, password: _loginPasswordController.text));
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                        }
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Don't have an account ?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.SINGUP;
                });
              },
              textColor: Colors.black87,
              child: Text("Create Account"),
            )
          ],
        )
      ],
    );
  }

  Widget singUpCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 5),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _signupNameController,
                    decoration: InputDecoration(
                        labelText: "Your Name", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _signupEmailController,
                    decoration: InputDecoration(
                        labelText: "Your Email", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _signupPasswordController,
                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)..add(Signup(username: _signupEmailController.text, password: _signupPasswordController.text));
                          setState(() {
                            _authMode = AuthMode.LOGIN;
                          });
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.LOGIN;
                });
              },
              textColor: Colors.black87,
              child: Text("Login"),
            ),
          ],
        ),
      ],
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is UnAuthenticatedLoaded) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  lowerHalf(context),
                
                  _authMode == AuthMode.LOGIN
                      ? loginCard(context)
                      : singUpCard(context), // <--- The card that sings :)
                  pageTitle(),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
