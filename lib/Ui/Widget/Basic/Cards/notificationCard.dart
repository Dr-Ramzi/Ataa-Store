part of '../../widget.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});
  final NotificationX notification;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(20.0),
      radius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerX(
              padding: const EdgeInsets.all(14.0),
              color: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.notifications_rounded,
                color: ColorX.primary,
                size: 28.0,
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  notification.title,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 4.0),
                TextX(
                  notification.body,
                  style: TextStyleX.supTitleLarge,
                  size: 14,
                ),
                const SizedBox(height: 5.0),
                TextX(
                  notification.dateTime,
                  style: TextStyleX.supTitleLarge,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
