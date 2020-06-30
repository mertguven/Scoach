import 'package:scoach/model/user.dart';

abstract class AuthBase {

  Future<User> currentUser();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre);
  Future<void> changePassword(String sifre);
  Future<void> changeEmail(String email);
  Future<User> signInWithGoogle();
  Future<bool> signOut();
  Future<void> forgotPassword(String email);
}