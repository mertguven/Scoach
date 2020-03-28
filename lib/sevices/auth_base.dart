import 'package:scoach/model/user_model.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> emailAndPassSignIn();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
}
