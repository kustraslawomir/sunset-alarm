import 'package:geolocator/geolocator.dart';

import '../../../../../../domain/usecase/datetime/date_time_formatter.dart';
import 'alarm_time.dart';
import 'day.dart';

class AlarmConfigurationState {
  final AlarmTime alarmTime;
  final bool repeatDaily;
  final List<DayOfWeek> schedule;
  final bool isLoading;
  final DateTime? sunriseDateTime;
  final Position? position;
  final String? address;

  AlarmConfigurationState(
      {required this.alarmTime,
      required this.repeatDaily,
      required this.schedule,
      required this.isLoading,
      required this.sunriseDateTime,
      required this.position,
      required this.address});

  static defaultState() => AlarmConfigurationState(
      alarmTime: AlarmTime.atSunrise,
      repeatDaily: true,
      schedule: DayOfWeek.values,
      isLoading: false,
      sunriseDateTime: null,
      position: null,
      address: null);

  AlarmConfigurationState copyWith({
    AlarmTime? alarmTime,
    bool? repeatDaily,
    List<DayOfWeek>? schedule,
    bool? isLoading,
    DateTime? sunriseDateTime,
    Position? position,
    String? address,
  }) {
    return AlarmConfigurationState(
      alarmTime: alarmTime ?? this.alarmTime,
      repeatDaily: repeatDaily ?? this.repeatDaily,
      schedule: schedule ?? this.schedule,
      isLoading: isLoading ?? this.isLoading,
      sunriseDateTime: sunriseDateTime ?? this.sunriseDateTime,
      position: position ?? this.position,
      address: address ?? this.address,
    );
  }

  String localSunriseDateHHmm() {
    final date = sunriseDateTime;
    if (date == null) {
      throw Exception('local sunrise date is null');
    }
    return DateTimeFormatter.toHHmm(date);
  }
}
