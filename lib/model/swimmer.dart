class Swimmer{

  final int swimmerId;
  String swimmerNameSurname;
  String swimmerTeam;
  int swimmerAge;
  double styleTime;
  String created;
  int mesafe;
  int distance;
  String style;

  Swimmer({this.distance,this.style, this.swimmerId, this.created, this.swimmerTeam, this.swimmerNameSurname, this.swimmerAge, this.styleTime, this.mesafe});
  Map<String, dynamic> toMap(){
    return{
      'swimmerId' : swimmerId,
      'swimmerNameSurname' : swimmerNameSurname,
      'swimmerTeam' : swimmerTeam,
      'swimmerAge' : swimmerAge,
    };
  }

  Swimmer.fromMap(Map<String, dynamic> map):
        created = map['created'],
        styleTime = map['styleTime'],
        mesafe = map['mesafe'],
        distance = map['distance'],
        style = map['style'],
        swimmerId = map['swimmerId'],
        swimmerNameSurname = map['swimmerNameSurname'],
        swimmerTeam = map['swimmerTeam'],
        swimmerAge = map['swimmerAge'];


  Map<String, dynamic> styleSave(){
    return{
      'style' : style,
      'distance' : distance,
      'styleTime' : styleTime,
      'created' : created,
    };
  }

  Map<String, dynamic> distanceSave(){
    return{
      'mesafe' : mesafe,
    };
  }

}