import 'dart:io';
import 'package:scoach/model/user.dart';

abstract class StorageBase {

  Future<void> deleteUserPhoto(User user);
  Future<String> updatePhoto(String userId, String dosyaAdi, File yuklenecekFoto);
}