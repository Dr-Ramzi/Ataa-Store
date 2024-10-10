import 'package:ataa/Core/Extension/convert/convert.dart';
import '../../../../Core/Helper/model/model.dart';
import '../../../data.dart';
import 'giftMessageVariable.dart';

class GiftMessageX {
  String id;
  String name;
  String title;
  String content;
  bool isActiveSms;
  bool isActiveWhatsapp;
  String nameLocalized;
  List<GiftMessageVariableX> variables;

  GiftMessageX({
    required this.id,
    required this.name,
    required this.title,
    required this.content,
    required this.isActiveSms,
    required this.isActiveWhatsapp,
    required this.nameLocalized,
    required this.variables,
  });

  factory GiftMessageX.fromJson(Map<String, dynamic> json) {
    return ModelUtilX.checkFromJson(
      json,
      (json) => GiftMessageX(
        id: json[NameX.id].toStrX,
        name: json[NameX.name].toStrX,
        title: json[NameX.title].toStrX,
        content: json[NameX.content].toStrX,
        isActiveSms: json[NameX.isActiveSms].toBoolDefaultX(false),
        isActiveWhatsapp: json[NameX.isActiveWhatsapp].toBoolDefaultX(false),
        nameLocalized: json[NameX.nameLocalized].toStrX,
        variables: ModelUtilX.generateItems(json[NameX.variables] as List, GiftMessageVariableX.fromJson),
      ),
      requiredDataKeys: [
        NameX.id,
        NameX.name,
        NameX.title,
        NameX.content,
        NameX.isActiveSms,
        NameX.isActiveWhatsapp,
        NameX.variables,
        NameX.nameLocalized,
      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.title: title,
      NameX.content: content,
      NameX.isActiveSms: isActiveSms,
      NameX.isActiveWhatsapp: isActiveWhatsapp,
      NameX.nameLocalized: nameLocalized,
      NameX.variables: variables.map((v) => v.toJson()).toList(),
    };
  }
}
