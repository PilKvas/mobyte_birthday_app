import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final controller = PageController();

  int _currentPage = 0;

  final pages = [
    const SliderCard(
      imageUrl: AppImages.sliderImage1,
      day: '25',
      month: 'августа',
      year: '2023',
    ),
    const SliderCard(
      imageUrl: AppImages.sliderImage1,
      day: '235',
      month: 'августа',
      year: '2023',
    ),
    const SliderCard(
      imageUrl: AppImages.sliderImage1,
      day: '25',
      month: 'августа',
      year: '2023',
    ),
    const SliderCard(
      imageUrl: AppImages.sliderImage1,
      day: '25',
      month: 'августа',
      year: '2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (ScreenUtil().screenWidth < 600) ? 240 : 450,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pages.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease,
                        height: 5,
                        width: _currentPage == index ? 40.w : 5.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  final String imageUrl;
  final String day;
  final String month;
  final String year;
  const SliderCard({
    super.key,
    required this.imageUrl,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 450.h,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$day $month',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                year,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
