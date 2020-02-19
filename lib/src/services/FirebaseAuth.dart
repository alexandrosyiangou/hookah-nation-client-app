import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, AuthResult;

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> signupEmailPassword({String email, String password}) {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<AuthResult> loginEmailPassword({String email, String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<AuthResult> loginAnonymously() {
    return _firebaseAuth.signInAnonymously();
  }
}
