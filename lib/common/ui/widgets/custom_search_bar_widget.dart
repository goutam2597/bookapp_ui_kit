import 'package:book_app/app/assets_path.dart';
import 'package:book_app/customer/features/services/ui/widgets/custom_alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A customizable search bar widget with optional filter icon.
class CustomSearchBarWidget extends StatelessWidget {
  final bool showFilter;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final BorderRadius borderRadius;
  final String hintText;

  const CustomSearchBarWidget({
    super.key,
    this.showFilter = true,
    this.onChanged,
    this.onFilterTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(32)),
    this.hintText = 'Search Services',
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.3,
      borderRadius: borderRadius,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(AssetsPath.searchIconSvg, width: 20),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (showFilter) ...[
              const SizedBox(width: 8),
              IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(AssetsPath.filterSvg, width: 20),
                onPressed:
                    onFilterTap ??
                    () => showDialog(
                      context: context,
                      builder: (context) => const CustomAlertDialog(),
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
