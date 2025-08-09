import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/vendor/features/buy_plan/data/models/buy_plans_model.dart';
import 'package:book_app/vendor/features/buy_plan/ui/widgets/buy_plan_card_widget.dart';
import 'package:flutter/material.dart';

class BuyPlan extends StatelessWidget {
  const BuyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const CustomAppBar(title: 'Buy Plan'),
              const SizedBox(height: 16),
              // Current plan header section.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? screenWidth * 0.15 : 24,
                ),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display the current package name.
                      CustomHeaderTextWidget(
                        textAlign: TextAlign.center,
                        text: 'Current Package: ${plans.last.planType}',
                      ),
                      const SizedBox(width: 8),
                      // Display the validity type in a styled container.
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.themeColor,
                        ),
                        child: Text(
                          plans.last.validityType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Display the plan expiration date.
              CustomHeaderTextWidget(
                textAlign: TextAlign.center,
                text: '(Expire Date: ${plans.last.validityType})',
              ),
              // List of available plans.
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? screenWidth * 0.1 : 16,
                    vertical: 16,
                  ),
                  itemCount: plans.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    // Use the BuyPlanCard widget to display each plan.
                    child: BuyPlanCard(plan: plans[index]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Custom clipper for the header background shape in the plan cards.
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double leftDrop = 0;
    const double rightDrop = 120;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - leftDrop);
    path.lineTo(size.width, size.height - rightDrop);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}