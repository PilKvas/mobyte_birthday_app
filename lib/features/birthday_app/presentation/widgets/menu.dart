import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';
import 'package:mobyte_birthday_app/features/birthday_app/models/menu_item.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _isExpanded = true;
  final List<MenuItem> _items = [
    MenuItem(
      name: "Канапе",
      dishUrl: AppImages.menuItem1,
    ),
    MenuItem(
      name: "Сырная тарелка",
      dishUrl: AppImages.menuItem2,
    ),
    MenuItem(
      name: "Шашлык на мангале",
      dishUrl: AppImages.menuItem3,
    ),
    MenuItem(
      name: "Морепродукты",
      dishUrl: AppImages.menuItem4,
    ),
    MenuItem(
      name: "Свежие фрукты",
      dishUrl: AppImages.menuItem5,
    ),
    MenuItem(
      name: "Авторские лимонады",
      dishUrl: AppImages.menuItem6,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Меню',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedCrossFade(
          firstChild: CollapsedGridView(
            items: _items,
          ),
          secondChild: ExpandedGridView(
            items: _items,
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              _isExpanded ? 'Свернуть ▲' : 'Развернуть ▼',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class CollapsedGridView extends StatelessWidget {
  final List<MenuItem> items;
  const CollapsedGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AspectRatioCalculator.calculateAspectRatio(
          context,
          aspectRatios: {
            300: 2.1,
            600: 1.2,
            700: 1,
            1000: 1.3,
          },
        ),
      ),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return GridViewItem(
          index: index,
          items: items,
        );
      },
    );
  }
}

class ExpandedGridView extends StatelessWidget {
  final List<MenuItem> items;
  const ExpandedGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:
            AspectRatioCalculator.calculateAspectRatio(context, aspectRatios: {
          300: 1, // значение aspectRatio для экранов меньше 300
          600: 1.15, // значение aspectRatio для экранов от 300 до 600
          700: 1, // значение aspectRatio для экранов от 600 до 1000
          1000: 1.3 // значение aspectRatio для экранов больше 1000
        }),
      ),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GridViewItem(
            index: index,
            items: items,
          ),
        );
      },
    );
  }
}

class GridViewItem extends StatelessWidget {
  final List<MenuItem> items;
  final int index;
  const GridViewItem({super.key, required this.index, required this.items});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: index % 2 == 0
                    ? const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                child: Image.asset(
                  items[index].dishUrl,
                  width: SizeCalculator.calculateSize(
                    context,
                    sizeOfImage: {
                      300: 150.w,
                      600: 160.w,
                      700: 300.w,
                      900: 350.w,
                      1000: 380.w,
                      1300: 450.w,
                    },
                  ),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              items[index].name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class AspectRatioCalculator {
  static double calculateAspectRatio(BuildContext context,
      {required Map<double, double> aspectRatios}) {
    double screenWidth = ScreenUtil().screenWidth;
    double aspectRatio;

    if (screenWidth <= 320) {
      aspectRatio = aspectRatios[300]!;
    } else if (screenWidth >= 320 && screenWidth < 600) {
      aspectRatio = aspectRatios[600]!;
    } else if (screenWidth >= 600 && screenWidth < 1000) {
      aspectRatio = aspectRatios[700]!;
    } else {
      aspectRatio = aspectRatios[1000]!;
    }

    return aspectRatio;
  }
}

class SizeCalculator {
  static double calculateSize(BuildContext context,
      {required Map<double, double> sizeOfImage}) {
    double screenWidth = ScreenUtil().screenWidth;
    double size;

    if (screenWidth <= 320) {
      size = sizeOfImage[300]!;
    } else if (screenWidth >= 320 && screenWidth < 600) {
      size = sizeOfImage[600]!;
    } else if (screenWidth >= 600 && screenWidth < 900) {
      size = sizeOfImage[700]!;
    } else if (screenWidth >= 900 && screenWidth <= 1000) {
      size = sizeOfImage[900]!;
    } else if (screenWidth >= 1000 && screenWidth <= 1300) {
      size = sizeOfImage[1000]!;
    } else {
      size = sizeOfImage[1300]!;
    }

    return size;
  }
}
