import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
  });

  void _launchUrl() async {
    if (!await launchUrl(
      Uri.parse(
          'https://glamping-russia.ru/russia/rostovskaja_oblast/neklinovskij-rajon/prosto-les/'),
    )) throw 'Could not launch';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Место",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 15,
        ),
        Image.asset(
          AppImages.place,
          width: 343.w,
          height: 246.w,
          fit: BoxFit.cover,
        ),
        Text(
          "Центральная ул., 84, хутор Седых",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            _launchUrl();
          },
          child: Text(
            "Перейти на сайт места",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
