import 'dart:ffi';

class AlarmInfo {

final String alarmName;
final int alarmId;
final int hour;
final int minute;
final int isAm;
final String selectedays;
final int isActive;
final double soundVolume;
final String soundName;
final int vibrate;

  AlarmInfo({this.soundVolume, this.soundName, this.vibrate, this.alarmName, this.alarmId, this.hour, this.minute, this.isAm, this.selectedays, this.isActive});

factory AlarmInfo.fromMap(Map<String,dynamic> map){

return AlarmInfo(
  alarmId: map["alarmId"],
  alarmName: map["alarmName"],
  hour: map["hour"],
  isActive: map["active"],
  isAm: map["am"],
  minute: map["minute"],
  selectedays: map["days"],
  soundName: map["soundName"],
  soundVolume: map["soundVolume"],
  vibrate: map["vibrate"]
);

}


Map<String,dynamic> toMap(AlarmInfo alarmInfo){

final Map<String,dynamic> map = Map<String,dynamic>();


map["alarmId"]=alarmInfo.alarmId;
map["alarmName"]=alarmInfo.alarmName;
 map["hour"]=alarmInfo.hour;
 map["active"]=alarmInfo.isActive;
 map["am"]=alarmInfo.isAm;
 map["minute"]=alarmInfo.minute;
 map["days"]=alarmInfo.selectedays;
 map["soundName"]=alarmInfo.soundName;
 map["soundVolume"]=alarmInfo.soundVolume;
 map["vibrate"]=alarmInfo.vibrate;

return map;

}



}