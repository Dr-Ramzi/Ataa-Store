import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/SelectedOptions/donationSelectionController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../ScreenSheet/Other/ConfirmCampaignCreation/confirmCampaignCreationSheet.dart';

class CreateCampaignController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonationSelectionControllerX donationOpportunityController =
      Get.put(DonationSelectionControllerX());

  //============================================================================
  // Variables

  Rx<OrganizationX?> orgSelected = Rx<OrganizationX?>(null);
  List<OrganizationX> organizations = [];
  Rx<DonationX?> donationSelected = Rx<DonationX?>(null);

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController targetAmount = TextEditingController();
  TextEditingController shareValue = TextEditingController();

  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  RxBool isOpenDonation = true.obs;
  RxInt numShares = 1.obs;
  RxBool isAgreed = true.obs;

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch organizations
      await Future.delayed(const Duration(seconds: 1)); // delete this
      // organizations = TestDataX.organizations;
      // organizations = await DatabaseX.getAllOrganizations();
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------

  String valuesShowOrg(org) => org.name ?? "";
  void onChangeOrg(org) => orgSelected.value = org;
  void onChangeDonationMethod(bool? val) => isOpenDonation.value = val ?? true;
  void onChangeAgreed(bool val) => isAgreed.value = val;
  void onChangeNumShares(num val) => numShares.value = val.toInt();
  void onChangeDate(DateTime? date) => endDate.value = date;

  //----------------------------------------------------------------------------

  entryVerification() {
    if (orgSelected.value == null) {
      return throw "You must select a project";
    } else if (donationOpportunityController.donationSelected.value == null) {
      return throw "You must select one of the donation projects";
    } else if (!formKey.currentState!.validate()) {
      autoValidate = AutovalidateMode.always;
      return throw "Check the input fields";
    } else if (!isAgreed.value) {
      return throw "The condition of responsibility for handling donations must be agreed upon";
    }
    return true;
  }

  /// Erase all data and return it to its default state
  clearData() {
    donationOpportunityController.clearData();
    orgSelected.value = null;
    donationSelected.value = null;
    title.text = "";
    date.text = "";
    targetAmount.text = "";
    shareValue.text = "";
    endDate.value = null;
    numShares.value = 1;
    autoValidate = AutovalidateMode.disabled;
  }

  onCreate() async {
    if (isLoading.isFalse) {
      try {
        if (entryVerification()) {
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;

          CampaignX campaign = CampaignX(
            id: "",
            title: title.text,
            stockValue:
                !isOpenDonation.value ? int.parse(shareValue.text) : null,
            maxNumStock: !isOpenDonation.value ? numShares.value : null,
            targetAmount:
                isOpenDonation.value ? int.parse(targetAmount.text) : null,
            countDonations: 0,
            currentDonations: 0,
            totalDonations: 0,
            endDate: endDate.value!,
            orgID: orgSelected.value!.id,
            donationID:
                donationOpportunityController.donationSelected.value!.id,
            isZakat:
                donationOpportunityController.donationSelected.value!.isZakat,
            shareURL:
                donationOpportunityController.donationSelected.value!.shareURL,
            imageURL:
                donationOpportunityController.donationSelected.value!.imageURL,
          );

          var isConfirmCreate = await confirmCampaignCreationSheetX(
            campaign: campaign,
            orgName: orgSelected.value!.name,
            projectName:
                donationOpportunityController.donationSelected.value!.name,
          );

          if (isConfirmCreate == true) {
            // TODO: Database >>> Create new campaign
            await Future.delayed(const Duration(seconds: 2)); // delete this

            /// The time delay here is aesthetically beneficial
            buttonState.value = ButtonStateEX.success;
            await Future.delayed(
              const Duration(seconds: StyleX.successButtonSecond),
            );

            /// this controller form bottom sheet
            await bottomSheetSuccessX(
              icon: Icons.check_rounded,
              title: "The campaign has been created successfully",
              message:
                  "The campaign you created will be reviewed by the administrator and you will be notified of its status",
              okText: "View campaign details",

              /// TODO: Algorithm >>> Send the new campaign ID
              onOk: ()async => await Get.toNamed(RouteNameX.campaignDetails, arguments: "1"),
            );

            /// clear date on controller
            clearData();
          } else {
            buttonState.value = ButtonStateEX.normal;
          }
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        buttonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          buttonState.value = ButtonStateEX.normal;
        },
      );
    }
  }
}
