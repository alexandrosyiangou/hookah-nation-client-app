import 'package:bloc/bloc.dart';

import 'package:hookah_nation_client_app/src/blocs/AuthEvent.dart';
import 'package:hookah_nation_client_app/src/blocs/AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => UnAuthenticatedLoading();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is UnAuthenticated) {
      print('Anonymous Authorization');
      yield UnAuthenticatedLoaded();
    } else if (event is Login) {
      print('Login with username ${event.username} and password ${event.password}');
    } else if (event is Signup) {
      print('Signup with username ${event.username} and password ${event.password}');
    } else {
      print('Unknown event');
    }
  }
}
