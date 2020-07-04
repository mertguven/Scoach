import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/database_base.dart';

class FirestoreDBService implements DBBase {

  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(String kullaniciAdi, User user) async {
    DocumentSnapshot _okunanUser =
        await Firestore.instance.document("users/${user.userId}").get();
    if(_okunanUser.data == null){
      await _firestore.collection("users").document(user.userId).setData(user.toMap());
      return true;
    }else{
      return true;
    }
  }

  @override
  Future<User> readUser(User user) async{
    DocumentSnapshot _okunanUser = await _firestore.collection("users").document(user.userId).get();
    Map<String, dynamic> _okunanUserMap = _okunanUser.data;
    User _okunanUserBilgiler = User.fromMap(_okunanUserMap);
    return _okunanUserBilgiler;
  }

  @override
  Future<void> updateUserInformation(String userId, String degisecekVeri, String yerineGelecekVeri) async{
    await _firestore.collection('users').document(userId).updateData({ degisecekVeri : yerineGelecekVeri});
  }

  Future<bool> updateProfilFoto(String userId, String profilFotoUrl) async{
    await _firestore
        .collection('users')
        .document(userId)
        .updateData({ 'profileUrl' : profilFotoUrl});
    return true;
  }

}