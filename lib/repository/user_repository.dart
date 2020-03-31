import 'package:scoach/locator.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/sevices/auth_base.dart';
import 'package:scoach/sevices/firebase_auth_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  @override
  Future<User> currentUser() async {
    return await _firebaseAuthService.currentUser();
  }

  @override
  Future<User> signInWithGoogle() async {
    return await _firebaseAuthService.signInWithGoogle();
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {
    return await _firebaseAuthService.createUserWithEmailandPassword(
        email, sifre);
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async {
    return await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
  }
}
