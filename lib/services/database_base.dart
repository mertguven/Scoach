import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';

abstract class DBBase {

  Future<bool> saveUser(User user);
  Future<bool> saveSwimmer(Swimmer swimmer, User user);
  Future<bool> setSwimmerStyle(String style,Swimmer swimmer,User user,int queue,int distance);
  Future<List<Swimmer>> getSelectedStyle(User user, Swimmer swimmer, String style);
  Future<User> readUser(User user);
  Future<void> updateUserInformation(String userId, String degisecekVeri, String yerineGelecekVeri);
}