part of '../../widget.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});
  final NotificationX notification;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          ContainerX(
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.notifications_rounded,
                color: ColorX.primary,
                size: 26.0,
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  notification.body,
                  style: TextStyleX.supTitleLarge,
                ),
                const SizedBox(
                  height: 5.0,
                ),
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
