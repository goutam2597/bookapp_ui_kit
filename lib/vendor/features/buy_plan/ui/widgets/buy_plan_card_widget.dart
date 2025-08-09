import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/vendor/features/buy_plan/data/models/buy_plans_model.dart';
import 'package:book_app/vendor/features/buy_plan/ui/screens/buy_plan.dart';
import 'package:book_app/vendor/features/buy_plan/ui/screens/plan_payment_screen.dart';
import 'package:book_app/vendor/features/buy_plan/ui/widgets/hexagon_painter.dart';
import 'package:flutter/material.dart';

/// A widget that displays a single plan card for the 'Buy Plan' screen.
/// It shows plan details, features, and a 'Buy Now' button.
class BuyPlanCard extends StatelessWidget {
  /// The data model containing all the information for the plan.
  final PlanModel plan;
  const BuyPlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 580,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // A stack is used to overlay the header and various positioned elements.
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // The custom-shaped header container.
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              // Positioned hexagon shape with plan price and validity.
              Positioned(
                top: 60,
                child: CustomPaint(
                  painter: HexagonPainter(),
                  child: SizedBox(
                    width: 172,
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Display the plan price.
                        FittedBox(
                          child: Text(
                            "\$${plan.priceCount}",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: AppColors.themeColor,
                            ),
                          ),
                        ),
                        // Display the plan validity type (e.g., /Month, /Year).
                        Text(
                          "/${plan.validityType}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.themeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned plan type text.
              Positioned(
                left: 16,
                top: 16,
                child: Text(
                  plan.planType,
                  style: AppTextStyles.headingLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              // Conditionally display a 'Recommended' badge.
              if (plan.recommendedPlan != null)
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Text(
                      plan.recommendedPlan ?? '',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ),
              // Conditionally display a 'Current Plan' badge.
              if (plan.currentPlan != null)
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Text(
                      plan.currentPlan ?? '',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // List of plan features.
          featureItem('Total Services (${plan.serviceCount})', true),
          featureItem('Images/Service (${plan.imageCount})', true),
          featureItem('Appointments (${plan.appointmentCount})', true),
          featureItem('Staffs (${plan.staffCount})', true),
          featureItem('Support Tickets', true),
          featureItem('Zoom Meeting', plan.zoomEnabled),
          const SizedBox(height: 8),
          // 'Buy Now' button that navigates to the payment screen.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButtonWidget(
                text: 'Buy Now',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlanPaymentScreen(selectedPlan: plan),
                    ),
                  );
                },
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// A helper method to build a single feature item row.
  /// It displays an icon (check/cancel) and the feature title.
  Widget featureItem(String title, bool enabled) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Icon(
            // Use a check icon for enabled features, and a cancel icon for disabled ones.
            enabled ? Icons.check_circle : Icons.cancel,
            color: enabled ? Colors.green : Colors.red,
            size: 26,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              // Add a line-through decoration for disabled features.
              decoration: enabled ? null : TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
