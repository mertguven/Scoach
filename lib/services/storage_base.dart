import 'dart:io';

abstract class StorageBase {

  Future<String> updatePhoto(String userId, String dosyaAdi, File yuklenecekFoto);
}