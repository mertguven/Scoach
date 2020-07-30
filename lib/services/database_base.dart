import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';

abstract class DBBase {

  Future<bool> saveUser(User user);
  Future<bool> saveSwimmer(Swimmer swimmer, User user);
  Future<User> readUser(User user);
  Future<void> updateUserInformation(String userId, String degisecekVeri, String yerineGelecekVeri);
}