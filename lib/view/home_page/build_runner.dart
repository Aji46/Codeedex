import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'lib/assets/carosal.png',
      'lib/assets/carosal.png',
      'lib/assets/carosal.png',
    ];

    return Container(
      height: 200.87,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  // Trigger state change to update dots
                },
              ),
            ),
          ),
          SizedBox(height: 8), // Space between carousel and dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imgList.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 144, 144, 144).withOpacity(
                    0.5, // Dots opacity
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
