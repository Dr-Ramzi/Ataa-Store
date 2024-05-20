part of "../../widget.dart";

class OrganizationCardX extends StatelessWidget {
  const OrganizationCardX({super.key, required this.org, required this.onTap});
  final OrganizationX org;
  final Function(OrganizationX org) onTap;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      height: StyleX.organizationCardHeight,
      width: StyleX.organizationCardWidth,
      margin: const EdgeInsetsDirectional.only(end: 14),
      padding: const EdgeInsets.all(18),
      child: GestureDetector(
        onTap: () => onTap(org),
        child: Column(
          children: [
            ImageNetworkX(
              imageUrl: org.imageURL,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 14),
            TextX(
              org.name,
              maxLines: 2,
              style: TextStyleX.titleSmall,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
