import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_colors.dart';

class InvitingWidget extends StatefulWidget {
  const InvitingWidget({
    super.key,
  });

  @override
  State<InvitingWidget> createState() => _InvitingWidgetState();
}

class _InvitingWidgetState extends State<InvitingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation;
  late CurvedAnimation _curve;

  double width = 300;

  double height = 300;
  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _curve = CurvedAnimation(parent: _controller1, curve: Curves.easeIn);

    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_curve);
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!",
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyWidget(),
              SizedBox(
                width: 40.w,
              ),
              Expanded(
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text(
                    'Opacity Text',
                  ),
                  onPressed: () => setState(
                    () {
                      _controller1.animateTo(3.0).then<TickerFuture>(
                          (value) => _controller1.animateBack(0.0));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<BorderRadius?> _borderRadius;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
        animation: _borderRadius,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 17.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.homePageButton,
              borderRadius: _borderRadius.value,
            ),
            child: Text(
              "Бесконечный твин",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: (ScreenUtil().screenWidth < 600) ? 14.sp : 30.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
