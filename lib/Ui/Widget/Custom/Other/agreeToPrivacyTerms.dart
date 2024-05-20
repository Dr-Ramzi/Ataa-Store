part of '../../widget.dart';

class AgreeToPrivacyTermsX extends StatelessWidget {
  const AgreeToPrivacyTermsX({super.key, required this.agreedTerms, required this.onChangeAgreedTerms});
   final bool agreedTerms;
   final Function(bool? val) onChangeAgreedTerms;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckBoxX(
          value: agreedTerms,
          onChanged: onChangeAgreedTerms,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RichText(
              text: TextSpan(
                text: "${'I agree to'.tr} ",
                style: TextStyleX.titleSmall.copyWith(color: Get.iconColor),
                children: <TextSpan>[
                  TextSpan(
                      text: "${'terms'.tr} ",
                      style: TextStyleX.titleSmall
                          .copyWith(color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RouteNameX.termsConditions);
                        }),
                  TextSpan(
                    text: '& '.tr,
                    style: TextStyleX.titleSmall.copyWith(color: Get.iconColor),
                  ),
                  TextSpan(
                      text: "${'Conditions'.tr} ",
                      style: TextStyleX.titleSmall
                          .copyWith(color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RouteNameX.termsConditions);
                        }),
                  TextSpan(
                      text: '${'and'.tr} ',
                      style:
                          TextStyleX.titleSmall.copyWith(color: Get.iconColor)),
                  TextSpan(
                    text: 'Privacy Policy'.tr,
                    style: TextStyleX.titleSmall
                        .copyWith(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(RouteNameX.privacyPolicy);
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
