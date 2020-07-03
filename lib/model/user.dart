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
      'profileUrl' : profileUrl ?? 'https://firebasestorage.googleapis.com/v0/b/scoach-bc78f.appspot.com/o/coach.png?alt=media&token=93c0bc30-3c52-4e61-a71e-6582b815cb01',
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