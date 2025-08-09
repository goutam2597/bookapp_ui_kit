import 'package:book_app/app/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart'; // This import brings in CarouselSliderController
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imgList;
  final ValueNotifier<int> selectedIndex;
  // Use CarouselSliderController instead of CarouselController
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  ImageCarousel({
    super.key,
    required this.imgList,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // ───── Carousel Images ─────
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 375.0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) => selectedIndex.value = index,
            ),
            items: imgList.map((imgPath) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),

          // ───── Image Thumbnails (above page indicator) ─────
          Positioned(
            bottom: 40,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (_, value, __) => Row(
                children: List.generate(imgList.length, (index) {
                  final isSelected = value == index;
                  return GestureDetector(
                    // Use the animateToPage method on the CarouselSliderController
                    onTap: () => _carouselController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 56,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.themeColor
                              : Colors.transparent,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(imgList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // ───── Dots Page Indicator ─────
          Positioned(
            bottom: 16,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (_, value, __) => Row(
                children: List.generate(imgList.length, (index) {
                  final isSelected = value == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 10,
                    width: isSelected ? 24 : 10,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.themeColor
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
