import 'package:flutter/cupertino.dart';

class User{

  final String userId;
  String userMail;
  String userName;
  String profileUrl;
  int seviye;

  User({@required this.userId, @required this.userMail, this.userName});
  Map<String, dynamic> toMap(){
    return{
      'userId' : userId,
      'userMail' : userMail,
      'userName' : userName ?? '',
      'profileUrl' : profileUrl ?? 'assets/images/coach.png',
      'seviye' : seviye ?? 1,
    };
  }
  User.fromMap(Map<String, dynamic> map):
      userId = map['userId'],
        userMail = map['userMail'],
        userName = map['userName'],
        profileUrl = map['profileUrl'],
        seviye = map['seviye'];
}