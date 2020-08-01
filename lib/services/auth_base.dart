import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';

abstract class AuthBase {

  Future<User> currentUser();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre);
  Future<bool> saveSwimmer(Swimmer swimmer, User user);
  Future<List<Swimmer>> getAllSwimmer(User user);
  Future<void> changePassword(String sifre);
  Future<void> changeEmail(String userId, String degisecekVeri,String email);
  Future<User> signInWithGoogle();
  Future<bool> signOut();
  Future<void> forgotPassword(String email);
}