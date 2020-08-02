import 'package:cloud_firestore/cloud_firestore.dart';

class Swimmer{

  final int swimmerId;
  String swimmerNameSurname;
  String swimmerTeam;
  int swimmerAge;
  int styleTime;
  DateTime created;

  Swimmer({this.swimmerId, this.created, this.swimmerTeam, this.swimmerNameSurname, this.swimmerAge, this.styleTime});
  Map<String, dynamic> toMap(){
    return{
      'swimmerId' : swimmerId,
      'swimmerNameSurname' : swimmerNameSurname,
      'swimmerTeam' : swimmerTeam,
      'swimmerAge' : swimmerAge,
    };
  }
  Swimmer.fromMap(Map<String, dynamic> map):
        swimmerId = map['swimmerId'],
        swimmerNameSurname = map['swimmerNameSurname'],
        swimmerTeam = map['swimmerTeam'],
        swimmerAge = map['swimmerAge'];

  Map<String, dynamic> styleSave(){
    return{
      'styleTime' : styleTime,
      'created' : FieldValue.serverTimestamp(),
    };
  }

}