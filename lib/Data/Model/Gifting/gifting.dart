part of '../../data.dart';

class GiftingX{
  GiftingX({
    required this.id,
    required this.categoryID,
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
    required this.giftingData,
    required this.paymentMethod,
    required this.giftingURL,
  });
  GiftingX.empty(){
    id="";
    categoryID="";
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
    phone=0;
    countryCode=966;

    typeName="";
    giftingData="";
    paymentMethod="";
    giftingURL="";
  }

  late String id;
  late String categoryID;
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
  late int phone;
  late int countryCode;

  late String typeName;
  late String giftingData;
  late String paymentMethod;
  late String giftingURL;
}