import 'package:scoach/locator.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/sevices/auth_base.dart';
import 'package:scoach/sevices/firebase_auth_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  @override
  Future<User> currentUser() async {
    return _firebaseAuthService.currentUser();
  }

  @override
  Future<User> emailAndPassSignIn() {
    // TODO: implement emailAndPassSignIn
    return null;
  }

  @override
  Future<User> signInWithGoogle() async {
    return _firebaseAuthService.signInWithGoogle();
  }

  @override
  Future<bool> signOut() async {
    return _firebaseAuthService.signOut();
  }
}
