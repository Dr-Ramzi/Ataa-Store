part of '../../widget.dart';

class ContactCardX extends StatelessWidget {
  const ContactCardX({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      isBorder: true,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ContainerX(
            height: 35,
            width: 35,
            padding: EdgeInsets.zero,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextX(text),
          ),
          const Spacer(),
          InkResponse(
            onTap: () => ClipboardX.copy(text),
            child: Icon(
              Icons.copy,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
