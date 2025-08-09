class PlanModel {
  final String planType;
  final String validityType;
  final int serviceCount;
  final int imageCount;
  final int appointmentCount;
  final int staffCount;
  final double priceCount;
  final bool zoomEnabled;
  final String? recommendedPlan;
  final String? currentPlan;

  PlanModel({
    this.currentPlan,
    this.recommendedPlan,
    required this.planType,
    required this.validityType,
    required this.priceCount,
    required this.serviceCount,
    required this.imageCount,
    required this.appointmentCount,
    required this.staffCount,
    required this.zoomEnabled,
  });
}

final List<PlanModel> plans = [
  // Monthly Plans
  PlanModel(
    planType: 'Silver',
    validityType: 'Monthly',
    priceCount: 9,
    serviceCount: 3,
    imageCount: 3,
    appointmentCount: 3,
    staffCount: 3,
    zoomEnabled: false,
  ),
  PlanModel(
    recommendedPlan: 'Recommended',
    planType: 'Gold',
    validityType: 'Monthly',
    priceCount: 19.99,
    serviceCount: 5,
    imageCount: 5,
    appointmentCount: 5,
    staffCount: 5,
    zoomEnabled: false,
  ),
  PlanModel(
    planType: 'Platinum',
    validityType: 'Monthly',
    priceCount: 29.99,
    serviceCount: 10,
    imageCount: 10,
    appointmentCount: 10,
    staffCount: 10,
    zoomEnabled: true,
  ),

  // Yearly Plans
  PlanModel(
    planType: 'Silver',
    validityType: 'Yearly',
    priceCount: 99,
    serviceCount: 3,
    imageCount: 3,
    appointmentCount: 3,
    staffCount: 3,
    zoomEnabled: false,
  ),
  PlanModel(
    recommendedPlan: 'Recommended',
    planType: 'Gold',
    validityType: 'Yearly',
    priceCount: 199,
    serviceCount: 5,
    imageCount: 5,
    appointmentCount: 5,
    staffCount: 5,
    zoomEnabled: true,
  ),
  PlanModel(
    planType: 'Platinum',
    validityType: 'Yearly',
    priceCount: 299,
    serviceCount: 10,
    imageCount: 10,
    appointmentCount: 10,
    staffCount: 10,
    zoomEnabled: true,
  ),

  // Lifetime Plans
  PlanModel(
    planType: 'Silver',
    validityType: 'Lifetime',
    priceCount: 399,
    serviceCount: 3,
    imageCount: 3,
    appointmentCount: 3,
    staffCount: 3,
    zoomEnabled: false,
  ),
  PlanModel(
    recommendedPlan: 'Recommended',
    planType: 'Gold',
    validityType: 'Lifetime',
    priceCount: 699,
    serviceCount: 5,
    imageCount: 5,
    appointmentCount: 5,
    staffCount: 5,
    zoomEnabled: true,
  ),
  PlanModel(
    currentPlan: 'Current',
    planType: 'Platinum',
    validityType: 'Lifetime',
    priceCount: 999,
    serviceCount: 10,
    imageCount: 10,
    appointmentCount: 10,
    staffCount: 10,
    zoomEnabled: true,
  ),
];
