import 'package:scoach/model/user_model.dart';

abstract class AuthBase {

  Future<User> currentUser();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String email, String sifre);
  Future<User> signInWithGoogle();
  Future<bool> signOut();
  Future<void> forgotPassword(String email);
}