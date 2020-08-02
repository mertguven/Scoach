import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/services/database_base.dart';

class FirestoreDBService implements DBBase {

  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
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
  Future<bool> saveSwimmer(Swimmer swimmer, User user) async{
    await _firestore.collection("sporcu").document(user.userId).collection("swimmer").document(swimmer.swimmerId.toString()).setData(swimmer.toMap());
    return true;
  }

  Future<List<Swimmer>> getAllSwimmer(User user) async{
    QuerySnapshot querySnapshot = await _firestore.collection("sporcu").document(user.userId).collection("swimmer").getDocuments();
    List<Swimmer> allSwimmer = [];
    for(DocumentSnapshot tekSwimmer in querySnapshot.documents){
      Swimmer _tekSwimmer = Swimmer.fromMap(tekSwimmer.data);
      allSwimmer.add(_tekSwimmer);
    }
    return allSwimmer;
  }

  Future<bool> setSwimmerStyle(String style,Swimmer swimmer,User user,int queue,int distance) async{
    await _firestore.collection("sporcu").document(user.userId).collection("swimmer").document(swimmer.swimmerId.toString()).collection(style).document(distance.toString()).collection(queue.toString()).document().setData(swimmer.styleSave());
    return true;
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

}