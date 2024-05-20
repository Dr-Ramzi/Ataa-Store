part of '../../data.dart';

class SettingsX {
  SettingsX({
    required this.language,
    required this.themeIsDark,
  });
  late String language;
  late bool themeIsDark;

  factory SettingsX.fromJson(Map<dynamic, dynamic> json) {
    return SettingsX(
      language: json[NameX.language]??"en",
      themeIsDark: json[NameX.themeIsDark]??false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.language: language,
      NameX.themeIsDark: themeIsDark,
    };
  }
}
