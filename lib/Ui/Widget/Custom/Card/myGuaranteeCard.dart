part of '../../widget.dart';

class MyGuaranteeCardX extends StatelessWidget {
  const MyGuaranteeCardX({
    super.key,
    required this.guarantee,
  });
  final GuaranteeX guarantee;

  @override
  Widget build(BuildContext context) {
    return AccordionX(
      title: guarantee.muslimNum!=null?"${"Muslim".tr} ${guarantee.muslimNum!}":"Prayers for Islam",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityDataRowX(
            title: "Language",
            data: guarantee.language,
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Gender",
            data: guarantee.gender,
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Country",
            dataWidget: Row(
              children: [
                TextX(
                  guarantee.country,
                  style: TextStyleX.titleSmall,
                ),
                const SizedBox(width: 8),
                CountryFlag.fromCountryCode(
                  guarantee.countryFlagCode.toUpperCase(),
                  width: 25,
                  height: 25,
                  borderRadius: 6,
                )
              ],
            ),
          ).fadeAnimation200,
          if (guarantee.previousReligion != null)
            ActivityDataRowX(
              title: "Previous religion",
              data: guarantee.previousReligion!,
            ).fadeAnimation200,
          if (guarantee.courseName != null)
            ActivityDataRowX(
              title: "Course name",
              data: guarantee.courseName!.toString(),
            ).fadeAnimation300,
          ActivityDataRowX(
            title: "Donation amount",
            data:
            "${FunctionX.formatLargeNumber(guarantee.donationAmount)} ${"SAR".tr}",
          ).fadeAnimation300,
        ],
      ),
    );
  }
}
