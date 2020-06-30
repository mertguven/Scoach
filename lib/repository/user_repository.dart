import 'package:scoach/locator.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/auth_base.dart';
import 'package:scoach/services/firebase_auth_service.dart';
import 'package:scoach/services/firestore_db_service.dart';

class UserRepository implements AuthBase{

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

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
    bool _sonuc = await _firestoreDBService.saveUser(_user.userMail.substring(0,_user.userMail.indexOf('@')),_user);
    if(_sonuc){
      return await _firestoreDBService.readUser(_user);
    }else{
      return null;
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre) async{
    User _user = await _firebaseAuthService.createUserWithEmailandPassword(kullaniciAdi,email, sifre);
    bool _sonuc = await _firestoreDBService.saveUser(kullaniciAdi,_user);
    if(_sonuc){
      return await _firestoreDBService.readUser(_user);
    }else{
      return null;
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    User _user = await _firebaseAuthService.signInWithGoogle();
    bool _sonuc = await _firestoreDBService.saveUser(_user.userMail.substring(0,_user.userMail.indexOf('@')),_user);
    if(_sonuc){
      return await _firestoreDBService.readUser(_user);
    }else{
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
  Future<void> changeEmail(String email) async{
    await _firebaseAuthService.changeEmail(email);
  }
}