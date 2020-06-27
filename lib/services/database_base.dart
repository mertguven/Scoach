import 'package:scoach/model/user_model.dart';

abstract class DBBase {

  Future<bool> saveUser(String kullaniciAdi,User user);
}