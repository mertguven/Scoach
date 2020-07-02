import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/database_base.dart';

class FirestoreDBService implements DBBase {

  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(String kullaniciAdi, User user) async {
    Map _eklenecekUser = user.toMap();
    _eklenecekUser['userName'] = kullaniciAdi;

    await _firestore
        .collection("users")
        .document(user.userId)
        .setData(_eklenecekUser);
    return true;
  }

  @override
  Future<User> readUser(User user) async{
    DocumentSnapshot _okunanUser = await _firestore.document("users/${user.userId}").get();
    Map _okunanUserMap = _okunanUser.data;
    User _okunanUserBilgiler = User.fromMap(_okunanUserMap);
    return _okunanUserBilgiler;
  }

  @override
  Future<void> updateUserInformation(String userId, String degisecekVeri, String yerineGelecekVeri) async{
    await _firestore.collection('users').document(userId).updateData({ degisecekVeri : yerineGelecekVeri});
  }

}