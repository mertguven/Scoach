import 'package:time_formatter/time_formatter.dart';


class Swimmer{

  final int swimmerId;
  String swimmerNameSurname;
  String swimmerTeam;
  int swimmerAge;
  int styleTime;
  String created;
  int mesafe;

  Swimmer({this.swimmerId, this.created, this.swimmerTeam, this.swimmerNameSurname, this.swimmerAge, this.styleTime, this.mesafe});
  Map<String, dynamic> toMap(){
    return{
      'swimmerId' : swimmerId,
      'swimmerNameSurname' : swimmerNameSurname,
      'swimmerTeam' : swimmerTeam,
      'swimmerAge' : swimmerAge,
    };
  }

  static String convertTimeStamp(timeStamp){
    String formatted = formatTime(timeStamp).toString();
    return formatted;
  }

  Swimmer.fromMap(Map<String, dynamic> map):
        created = map['created'],
        styleTime = map['styleTime'],
        mesafe = map['mesafe'],
        swimmerId = map['swimmerId'],
        swimmerNameSurname = map['swimmerNameSurname'],
        swimmerTeam = map['swimmerTeam'],
        swimmerAge = map['swimmerAge'];


  Map<String, dynamic> styleSave(){
    return{
      'styleTime' : styleTime,
      'created' : "${DateTime.now().day}" + " ${DateTime.now().month}" + " ${DateTime.now().year}",
    };
  }

  Map<String, dynamic> distanceSave(){
    return{
      'mesafe' : mesafe,
    };
  }

}