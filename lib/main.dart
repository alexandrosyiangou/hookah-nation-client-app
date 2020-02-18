import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hookah_nation_client_app/src/App.dart';
import 'package:hookah_nation_client_app/src/SimpleBlocDelegate.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthBloc.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthEvent.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (BuildContext context) => AuthBloc()..add(AnonymousAuth()),
      child: App()
    )
  );
}
