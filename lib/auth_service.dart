import 'package:firebase/sign_in_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

    static Future<SignInSignUpResult> createUser({String email, String password}) async {
   
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: (e.message));
    }
    // UserCredential result = await auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    // final User user = result.user;

    // assert(user != null);
    // assert(await user.getIdToken() != null);

    // return user;
  }

  static Future<SignInSignUpResult> signInWithEmail(
      {String email, String password}) async {
    
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: (e.message));
    }
      }
    // UserCredential result =
    //     await auth.signInWithEmailAndPassword(email: email, password: password);
    // final User user = result.user;

    // assert(user != null);
    // assert(await user.getIdToken() != null);

    // final User currentUser = await auth.currentUser;
    // assert(user.uid == currentUser.uid);

    // print('signInEmail succeeded: $user');

    // return user;
  

  void signOut() {
    _auth.signOut();
  }
}
