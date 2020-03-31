import 'package:scoach/model/user_model.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String email, String sifre);
}
