enum LinkableTypeStatusX {
  donation('Project'),
  org('DonationCategory'),
  deduction('RecurringDonation'),
  gift('Gift');

  final String name;
  const LinkableTypeStatusX(this.name);
}