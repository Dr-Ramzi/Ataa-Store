import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Core/core.dart';
import '../../../../Data/data.dart';

class PayByBankTransferController extends GetxController {
  //============================================================================
  // Variables

  Rx<BankX?> bankSelected = Rx<BankX?>(null);
  Rx<BankAccountX?> bankAccountSelected = Rx<BankAccountX?>(null);
  List<BankX> banks = [];
  RxBool isValidate = false.obs;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  Rx<XFile?> image = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();
  TextEditingController iban = TextEditingController();
  TextEditingController imageName = TextEditingController(text: 'No file uploaded yet'.tr);

  //============================================================================
  // Functions

  Future<void> getData() async {
    if(banks.isEmpty){
      banks = await DatabaseX.getAllBanks();
    }
  }
  onChangeBank(BankX data){
    bankSelected.value=data;
    bankAccountSelected.value=null;
    iban.text='';
    isValidate.value=false;
  }
  onChangeBankAccount(BankAccountX data){
    bankAccountSelected.value=data;
    iban.text=data.iban;
    isValidate.value=checkIsValidate();
  }

  /// Erase all data and return it to its default state
  clearData() {
    bankSelected.value=null;
    bankAccountSelected.value=null;
    banks=[];
    iban.text='';
    isValidate.value=false;
    autoValidate = AutovalidateMode.disabled;
  }

  onCopyIban(){
    if(iban.text.isNotEmpty) {
      ClipboardX.copy(iban.text);
    }
  }

  changeImage() async {
    /// Open the user's photo gallery to select a photo
    var x = await picker.pickImage(source: ImageSource.gallery);

    /// If an image is selected, the data is updated
    if (x != null) {
      image.value = x;
      imageName.text=image.value!.name;
      isValidate.value=checkIsValidate();
    }
  }

  bool validate() {
    if(bankSelected.value==null){
      throw 'Payment method details must be specified.';
    }else if(bankAccountSelected.value==null){
      throw 'There is an error in the card data entered.';
    }else if(image.value==null){
      throw 'There is an error in the card data entered.';
    }else{
      return true;
    }
  }
  bool checkIsValidate() {
    if(bankSelected.value==null || bankAccountSelected.value==null || image.value == null){
      return false;
    }else{
      return true;
    }
  }
}