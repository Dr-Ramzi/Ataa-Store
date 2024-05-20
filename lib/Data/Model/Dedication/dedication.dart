part of '../../data.dart';

class DedicationX{
  DedicationX({
    required this.id,
    required this.typeID,
    this.cardID,
    required this.orgID,
    required this.donationAmount,
    required this.isShowAmount,
    required this.isSendToMe,
    required this.isSendLater,
    this.sendLaterDate,
    required this.mahdiName,
    required this.name,
    required this.gender,
    required this.phone,
    required this.countryCode,

    required this.typeName,
    required this.dedicationData,
    required this.paymentMethod,
    required this.dedicationURL,
  });
  DedicationX.empty(){
    id="";
    typeID="";
    cardID="";
    orgID="";
    donationAmount=0;
    isShowAmount=false;
    isSendToMe=false;
    isSendLater=false;
    sendLaterDate=null;

    mahdiName="";
    name="";
    gender="";
    phone="";
    countryCode=966;

    typeName="";
    dedicationData="";
    paymentMethod="";
    dedicationURL="";
  }

  late String id;
  late String typeID;
  String? cardID;
  late String orgID;
  late int donationAmount;
  late bool isShowAmount;
  late bool isSendToMe;
  late bool isSendLater;
  late DateTime? sendLaterDate;

  late String mahdiName;
  late String name;
  late String gender;
  late String phone;
  late int countryCode;

  late String typeName;
  late String dedicationData;
  late String paymentMethod;
  late String dedicationURL;
}