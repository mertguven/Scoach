import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/services/database_base.dart';

class FirestoreDBService implements DBBase {

  final Firestore _firestore = Firestore.instance;
  User okunanUserBilgiler;

  @override
  Future<bool> saveUser(String kullaniciAdi,User user) async{
    Map _eklenecekUser;
    _eklenecekUser['userName'] = kullaniciAdi;
    _eklenecekUser = user.toMap();

    await _firestore
        .collection("users")
        .document(user.userId)
        .setData(_eklenecekUser);

    DocumentSnapshot _okunanUser = await Firestore.instance.document("users/${user.userId}").get();
    Map _okunanUserMap = _okunanUser.data;
    okunanUserBilgiler = User.fromMap(_okunanUserMap);

    return true;
  }

}