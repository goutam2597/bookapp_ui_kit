import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/common/ui/widgets/dropdown_alert_dialog.dart';
import 'package:book_app/customer/features/nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// A reusable custom-styled app bar with optional back button, title, logo,
/// language selection, and theme toggle buttons.
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// The title text to display in the app bar.
  final String title;

  /// Optional callback for the back button. If null, it defaults to `Navigator.pop(context)`.
  final VoidCallback? onTap;

  /// Whether to show the back button. Defaults to true.
  final bool showBackButton;

  /// Path to the back button SVG icon. Defaults to `AssetsPath.backIconSvg`.
  final String icon;

  /// Path to the language button SVG icon. Defaults to `AssetsPath.languageSvg`.
  final String languageIcon;

  /// Path to the light theme button SVG icon. Defaults to `AssetsPath.lightSvg`.
  final String lightThemeIcon;

  /// Path to the dark theme button SVG icon. Defaults to `AssetsPath.darkSvg`.
  final String darkThemeIcon;

  /// Path to the app logo SVG icon. Defaults to `AssetsPath.appLogoSvg`.
  final String? appLogo;

  /// Whether to show the title text. Defaults to true.
  final bool showTitle;

  /// Whether to show the app logo. Defaults to false.
  final bool showLogo;

  /// Whether to show the language selection button. Defaults to false.
  final bool showLanguageBtn;

  /// Whether to show the theme toggle button. Defaults to false.
  final bool showThemeBtn;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onTap,
    this.showBackButton = true,
    this.icon = AssetsPath.backIconSvg,
    this.languageIcon = AssetsPath.languageSvg,
    this.lightThemeIcon = AssetsPath.lightSvg,
    this.darkThemeIcon = AssetsPath.darkSvg,
    this.appLogo = AssetsPath.appLogoSvg,
    this.showTitle = true,
    this.showLogo = false,
    this.showLanguageBtn = false,
    this.showThemeBtn = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  bool _isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The container provides a custom background and shadow for the app bar.
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurStyle: BlurStyle.solid,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: AppBar(
        // `automaticallyImplyLeading: false` is used to prevent the default back button
        // so a custom one can be implemented.
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        // `forceMaterialTransparency` and `foregroundColor` are used to make the AppBar
        // itself transparent, so the `Container`'s decoration is visible.
        forceMaterialTransparency: true,
        foregroundColor: Colors.transparent,
        title: Stack(
          alignment: Alignment.center,
          children: [
            // Conditionally show the title text.
            if (widget.showTitle)
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleColor,
                ),
              ),
            // Conditionally show the app logo, wrapped in a `GestureDetector` to navigate home.
            if (widget.showLogo)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                  );
                },
                child: SvgPicture.asset(widget.appLogo ?? ''),
              ),
            // Conditionally show the back button on the left.
            if (widget.showBackButton)
              Align(
                alignment: Alignment.centerLeft,
                child: CustomIconButtonWidget(
                  assetPath: widget.icon,
                  // Use the provided `onTap` or default to `Navigator.pop`.
                  onTap: widget.onTap ?? () => Navigator.pop(context),
                ),
              ),
            // Conditionally show the language button on the right.
            if (widget.showLanguageBtn)
              Align(
                alignment: Alignment.centerRight,
                child: CustomIconButtonWidget(
                  assetPath: widget.languageIcon,
                  onTap: () => _showLanguageDialog(context),
                ),
              ),
            // Conditionally show the theme toggle button on the right.
            if (widget.showThemeBtn)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  // Adjust padding if the language button is also present to prevent overlap.
                  padding: widget.showLanguageBtn
                      ? const EdgeInsets.only(right: 48.0)
                      : EdgeInsets.zero,
                  child: CustomIconButtonWidget(
                    // Dynamically switch the icon based on the current theme state.
                    assetPath: _isLightTheme
                        ? widget.lightThemeIcon
                        : widget.darkThemeIcon,
                    onTap: () {
                      setState(() {
                        _isLightTheme = !_isLightTheme;
                        final themeMode = _isLightTheme ? 'Light' : 'Dark';
                        // Show a snack bar to inform the user of the theme change.
                        CustomSnackBar.show(
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.themeColor,
                          context,
                          'Switched to $themeMode Theme',
                        );
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// A helper method to display the language selection dialog.
  void _showLanguageDialog(BuildContext context) {
    final List<String> languages = ['English', 'Arabic', 'Spanish'];
    showDialog(
      context: context,
      builder: (context) => DropdownAlertDialog(
        dialogType: DialogType.dropdown,
        drpDownTitle: 'Select Language',
        btnTitle: 'Save',
        title: 'Select Language',
        items: languages,
        onConfirm: (selectedValue) {
          if (selectedValue != null) {
            CustomSnackBar.show(
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.themeColor,
              context,
              '$selectedValue is Selected Now',
            );
          } else {
            // Handle the case where no language is selected.
            CustomSnackBar.show(
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.themeColorTwo,
              context,
              'English is The Default Language',
            );
          }
        },
      ),
    );
  }
}
