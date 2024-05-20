part of '../../widget.dart';

class PhoneFieldX extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hint;
  final int countryCode;
  final Function(String countryCode) onChange;
  const PhoneFieldX({
    required this.controller,
    required this.onChange,
    this.label,
    this.hint = "512345678",
    this.countryCode = 966,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) LabelInputX(label!),
        Directionality(
          textDirection: TextDirection.ltr,
          child: ContainerX(
            margin: const EdgeInsets.symmetric(vertical: 5),
            isBorder: true,
            padding: EdgeInsets.zero,
            color: Theme.of(context).cardTheme.color,
            child:  InternationalPhoneNumberInput(
              height: StyleX.inputHeight,
              controller: controller,
              initCountry: countryCode,
              betweenPadding: 5,
              onInputChanged: (phone) {
                onChange(phone.dial_code);
              },
              dialogConfig: DialogConfig(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                searchBoxBackgroundColor: Theme.of(context).cardTheme.color!,
                countryItemHeight: 50,
                topBarColor: ColorX.grey.shade800,
                selectedItemColor: Theme.of(context).cardTheme.color!,
                textStyle: TextStyleX.titleSmall.copyWith(color: Theme.of(context).primaryColor),
                searchBoxTextStyle: TextStyleX.titleSmall,
                titleStyle: TextStyleX.titleLarge,
                title: "Country Codes".tr,
                flatFlag: true,
                searchBoxIconColor: Theme.of(context).colorScheme.secondary,
                searchBoxRadius: StyleX.radius,
                searchHintText: "Search by name...".tr,
                searchBoxHintStyle:
                TextStyleX.titleSmall,
              ),
              countryConfig: CountryConfig(
                decoration: BoxDecoration(
                  color: context.isDarkMode?ColorX.grey.shade800.withOpacity(0.6):ColorX.grey.shade100,
                  border: Border.all(width: 0, color: Colors.transparent),
                ),
                noFlag: false,
                flatFlag: true,
                flagSize: 26,
                textStyle: TextStyleX.titleMedium
                    .copyWith(color: Theme.of(context).iconTheme.color),
              ),
              validate: ValidateX.phone,
              phoneConfig: PhoneConfig(
                focusedColor: Colors.transparent,
                enabledColor: Colors.transparent,
                labelStyle: null,
                labelText: null,
                floatingLabelStyle: null,
                focusNode: null,
                radius: 0,
                borderWidth: 0,
                hintText: hint,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                autoFocus: false,
                showCursor: false,
                errorStyle: TextStyleX.supTitleMedium.copyWith(color: ColorX.danger.shade500),
                textInputAction: TextInputAction.done,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textStyle: TextStyleX.titleSmall,
                hintStyle:
                TextStyleX.titleSmall,
              ),
            ),
          ),
        )
      ],
    );
  }
}
