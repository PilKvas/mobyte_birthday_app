import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';

import '../../models/menu_item.dart';

class MenuItemPage extends StatelessWidget {
  final List<MenuItem> items;
  final MenuItem item;
  final int index;
  const MenuItemPage({
    super.key,
    required this.index,
    required this.item,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.grey,
            )),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          item.name,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontFamily: 'Jost', fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                Positioned(
                  top: -50.h, 
                  right: item.name.length > 6 ? -180.w : -90.w ,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: 200.h,
                          width: item.name.length > 6 ? 200.w : 100.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                item.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 20.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 357.w,
                        height: 264.h,
                        child: ClipOval(
                          child: Image.asset(
                            item.dishUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Ваши остальные виджеты
              ],
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5,
            ),
            shrinkWrap: true,
            itemCount: item.menuIngredients.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppImages.fork),
                  Text(item.menuIngredients[index]),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
