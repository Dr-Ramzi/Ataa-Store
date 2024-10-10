part of '../../data.dart';

class NotificationX {
  NotificationX({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
  });

  final int id;
  final String title;
  final String body;
  final String dateTime;

  factory NotificationX.fromJson(Map<dynamic, dynamic> json) {
    return NotificationX(
      id: json[NameX.id],
      title: json[NameX.title],
      body: json[NameX.body],
      dateTime: json[NameX.dateTime],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.title: title,
      NameX.body: body,
      NameX.dateTime: dateTime,
    };
  }
}
