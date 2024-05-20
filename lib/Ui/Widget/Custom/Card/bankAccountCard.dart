part of '../../widget.dart';

class BankAccountCardX extends StatelessWidget {
  const BankAccountCardX({super.key, required this.bankAccount});
  final BankAccountX bankAccount;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          ImageNetworkX(
            imageUrl: bankAccount.imageURL,
            height: 50,
            backgroundLoading:Colors.transparent,
          ),
          const SizedBox(height: 20),
          TextX(
            bankAccount.name,
            style: TextStyleX.headerMedium,
          ),
          const SizedBox(height: 15),
          TextX(
            "Bank account number (IBAN)",
            style: TextStyleX.titleSmall,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 5),
          InkWell(
            onTap: () async => ClipboardX.copy(bankAccount.iban),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.copy,
                  size: 18,
                ),
                const SizedBox(width: 8),
                TextX(
                  bankAccount.iban,
                  style: TextStyleX.titleSmall,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
