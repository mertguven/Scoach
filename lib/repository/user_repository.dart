import 'dart:io';
import 'package:scoach/locator.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/auth_base.dart';
import 'package:scoach/services/firebase_auth_service.dart';
import 'package:scoach/services/firebase_storage_service.dart';
import 'package:scoach/services/firestore_db_service.dart';

class UserRepository implements AuthBase{

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  FirebaseStorageService _firebaseStorageService = locator<FirebaseStorageService>();

  @override
  Future<User> currentUser() async{
    User _user = await _firebaseAuthService.currentUser();
    return await _firestoreDBService.readUser(_user);
  }

  @override
  Future<bool> signOut() async{
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async{
    User _user = await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
    return await _firestoreDBService.readUser(_user);
  }

  @override
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre) async{
    User _user = await _firebaseAuthService.createUserWithEmailandPassword(kullaniciAdi,email, sifre);
    bool _sonuc = await _firestoreDBService.saveUser(_user);
    await _firestoreDBService.updateUserInformation(_user.userId, "userName", kullaniciAdi);
    if(_sonuc){
      return await _firestoreDBService.readUser(_user);
    }else{
      return null;
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    User _user = await _firebaseAuthService.signInWithGoogle();
    bool _sonuc = await _firestoreDBService.saveUser(_user);
    await _firestoreDBService.updateUserInformation(_user.userId, "userName", _user.userMail.substring(0,_user.userMail.indexOf("@")));
    if(_sonuc){
      return await _firestoreDBService.readUser(_user);
    }else{
      await _firebaseAuthService.signOut();
      return null;
    }
  }

  @override
  Future<void> forgotPassword(String email) async{
    await _firebaseAuthService.forgotPassword(email);
  }

  @override
  Future<void> changePassword(String sifre) async{
    await _firebaseAuthService.changePassword(sifre);
  }

  @override
  Future<void> changeEmail(String userId, String degisecekVeri,String email) async{
    await _firebaseAuthService.changeEmail(userId, degisecekVeri, email);
    await _firestoreDBService.updateUserInformation(userId, degisecekVeri, email);
  }

  Future<String> updateFoto(String userId, String dosyaAdi, File profilFoto) async{
    var profilFotoUrl = await _firebaseStorageService.updatePhoto(userId, dosyaAdi, profilFoto);
    await _firestoreDBService.updateUserInformation(userId, "profileUrl", profilFotoUrl);
    return profilFotoUrl;
  }

  @override
  Future<bool> saveSwimmer(Swimmer swimmer, User user) async{
    bool sonuc = await _firestoreDBService.saveSwimmer(swimmer, user);
    return sonuc;
  }

  @override
  Future<List<Swimmer>> getAllSwimmer(User user) async{
    List<Swimmer> allSwimmer = await _firestoreDBService.getAllSwimmer(user);
    return allSwimmer;
  }

  @override
  Future<bool> setSwimmerStyle(String style, Swimmer swimmer, User user, int queue, int distance) async{
    bool sonuc = await _firestoreDBService.setSwimmerStyle(style, swimmer, user, queue, distance);
    return sonuc;
  }

  @override
  Future<bool> setSwimmerDistance(String style, Swimmer swimmer, User user, int distance) async{
    bool sonuc = await _firestoreDBService.setSwimmerDistance(style, swimmer, user, distance);
    return sonuc;
  }

  @override
  Future<List<Swimmer>> getSelectedStyle(User user, Swimmer swimmer, String style) async{
    List<Swimmer> allDistance = await _firestoreDBService.getSelectedStyle(user, swimmer, style);
    return allDistance;
  }
}