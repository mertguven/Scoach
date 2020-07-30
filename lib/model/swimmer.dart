import 'package:flutter/cupertino.dart';

class Swimmer{

  final int swimmerId;
  String swimmerNameSurname;
  String swimmerTeam;
  int swimmerAge;

  Swimmer({@required this.swimmerId, @required this.swimmerTeam, this.swimmerNameSurname, @required this.swimmerAge});
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
}