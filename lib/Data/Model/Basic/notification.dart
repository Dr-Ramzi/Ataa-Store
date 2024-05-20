part of '../../data.dart';

class NotificationX {
  NotificationX({
    required this.id,
    required this.body,
    required this.dateTime,
  });

  final int id;
  final String body;
  final String dateTime;

  factory NotificationX.fromJson(Map<dynamic, dynamic> json) {
    return NotificationX(
      id: json[NameX.id],
      body: json[NameX.body],
      dateTime: json[NameX.dateTime],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.body: body,
      NameX.dateTime: dateTime,
    };
  }
}
