import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/storage_base.dart';

class FirebaseStorageService implements StorageBase{
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  StorageReference _storageReference;

  @override
  Future<void> deleteUserPhoto(User user) async{
    _storageReference = _firebaseStorage.ref().child(user.userId).child("profil_foto");
    await _storageReference.delete();
  }

  @override
  Future<String> updatePhoto(String userId, String dosyaAdi, File yuklenecekFoto) async{
    _storageReference = _firebaseStorage.ref().child(userId).child(dosyaAdi);
    var uploadTask = _storageReference.putFile(yuklenecekFoto);
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    return url;
  }
}