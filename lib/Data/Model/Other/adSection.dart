import 'package:ataa/Core/Extension/convert/convert.dart';
import 'package:ataa/Core/Helper/model/model.dart';
import 'package:ataa/Data/data.dart';

class AdsSectionX {
  final String? id;
  final String? code;

  AdsSectionX({
    this.id,
    this.code,
  });

  factory AdsSectionX.fromJson(Map<String, dynamic> json) {
    return ModelUtilX.checkFromJson(
      json,
      (json) => AdsSectionX(
        id: json[NameX.id].toStrNullableX,
        code: json[NameX.code].toStrNullableX,
      ),
    );
  }
}
