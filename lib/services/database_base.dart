import 'package:scoach/model/user.dart';

abstract class DBBase {

  Future<bool> saveUser(String kullaniciAdi,User user);
  Future<User> readUser(User user);
  Future<void> updateUserInformation(String userId, String degisecekVeri, String yerineGelecekVeri);
}