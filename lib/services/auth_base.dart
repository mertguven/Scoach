import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';

abstract class AuthBase {

  Future<User> currentUser();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre);
  Future<bool> saveSwimmer(Swimmer swimmer, User user);
  Future<List<Swimmer>> getAllSwimmer(User user);
  Future<bool> setSwimmerDistance(String style,Swimmer swimmer,User user,int distance);
  Future<List<Swimmer>> getSelectedStyle(User user, Swimmer swimmer, String style);
  Future<bool> setSwimmerStyle(String style,Swimmer swimmer,User user,int queue,int distance);
  Future<void> changePassword(String sifre);
  Future<void> changeEmail(String userId, String degisecekVeri,String email);
  Future<User> signInWithGoogle();
  Future<bool> signOut();
  Future<void> forgotPassword(String email);
}