part of 'alarmview_cubit.dart';

@immutable
abstract class AlarmviewState {}

class AlarmviewInitial extends AlarmviewState {}
class AlarmviewEmpty extends AlarmviewState {}
class AlarmviewNotEmpty extends AlarmviewState {}
