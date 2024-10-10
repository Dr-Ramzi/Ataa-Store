enum ModelTypeStatusX {
  donation('project'),
  gift('gift'),
  quickDonation('donation_category'),
  deduction('recurring_donation_subscription');

  final String name;
  const ModelTypeStatusX(this.name);
}