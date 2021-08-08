part of 'digitalclock_cubit.dart';

@immutable
class DigitalclockState {

final String min;
final String hour;

  DigitalclockState({this.min, this.hour});

}

class DigitalclockInitial extends DigitalclockState {


final String min;
final String hour;

DigitalclockInitial({this.hour,this.min});


}
