import 'package:bloc/bloc.dart';

import 'package:hookah_nation_client_app/src/blocs/AuthEvent.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthLoading();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AnonymousAuth) {
      print('Anonymous Authorization');
      yield AuthLoaded();
    }
  }
}
