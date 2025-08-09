import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services/ui/widgets/services_card_widget_for_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

/// A grid view that shows service suggestion cards with entry animation.
class ServiceSuggestionGridView extends StatelessWidget {
  final double itemWidth;

  const ServiceSuggestionGridView({super.key, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Wrap(
        spacing: 8, // Horizontal spacing between items
        runSpacing: 8, // Vertical spacing between items
        children: List.generate(dummyServiceCardList.length, (index) {
          final item = dummyServiceCardList[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: ScaleAnimation(
              scale: 0.8,
              child: FadeInAnimation(
                child: SizedBox(
                  width: itemWidth,
                  child: ServicesCardWidgetForGrid(item: item),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
