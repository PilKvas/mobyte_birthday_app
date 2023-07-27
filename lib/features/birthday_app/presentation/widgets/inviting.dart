import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitingWidget extends StatelessWidget {
  const InvitingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          Text(
            style: Theme.of(context).textTheme.headlineMedium,
            "Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!",
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text(
                    'Список людей',
                  ),
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Expanded(
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text(
                    'Вишлист',
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
