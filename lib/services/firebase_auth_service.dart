import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/auth_base.dart';

class FirebaseAuthService implements AuthBase{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async{
    try{
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _firebaseUser(user);
    }catch(e){
      print("CurrentUser hata: "+ e.toString());
      return null;
    }
  }

  User _firebaseUser(FirebaseUser user){
    if(user == null){
      return null;
    }
    return User(userId: user.uid, userMail: user.email);
  }

  @override
  Future<bool> signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      print("SignOut Hata: "+ e.toString());
      return false;
    }
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async{
    try {
      AuthResult sonuc = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: sifre);
      return _firebaseUser(sonuc.user);
    } catch (e) {
      print("Email and sifre giris hata:" + e.toString());
      return null;
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre) async{
    try {
      AuthResult sonuc = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: sifre);
      return _firebaseUser(sonuc.user);
    } catch (e) {
      print("Email and sifre giris hata:" + e.toString());
      return null;
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    if(_googleUser != null){
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if(_googleAuth.idToken != null && _googleAuth.accessToken != null){
        AuthResult sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken
            )
        );
        return _firebaseUser(sonuc.user);
      }
      return null;
    }else{
      print("Email and sifre kayit hata:");
      return null;
    }
  }

  @override
  Future<void> forgotPassword(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> changePassword(String sifre) async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updatePassword(sifre);
  }

  @override
  Future<void> changeEmail(String userId, String degisecekVeri, String email) async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updateEmail(email);
  }

  @override
  Future<bool> saveSwimmer(Swimmer swimmer, User user) async{
    return true;
  }

  @override
  Future<List<Swimmer>> getAllSwimmer(User user) {
    return null;
  }
}