import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/config/theme/app_theme.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';
import 'package:mobyte_birthday_app/features/birthday_app/models/entertaiment_item.dart';

class EntertaimentWidget extends StatefulWidget {
  const EntertaimentWidget({super.key});

  @override
  State<EntertaimentWidget> createState() => _EntertaimentWidgetState();
}

class _EntertaimentWidgetState extends State<EntertaimentWidget> {
  bool _isExpanded = false;
  final List<EntertaimentItem> _item = [
    EntertaimentItem(
      imageUrl: AppImages.entertaimentItem1,
      title: 'Настольные игры',
      subtitle: 'Мафия, уно, домино, экивоки и другие',
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    ),
    EntertaimentItem(
      imageUrl: AppImages.entertaimentItem2,
      title: 'Бассейн',
      subtitle: 'Два бассейна с подогревом',
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    ),
    EntertaimentItem(
      imageUrl: AppImages.entertaimentItem1,
      title: 'Тренажерный зал',
      subtitle: 'Душевые, бани, тренажеры на каждую группу мышц',
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    ),
    EntertaimentItem(
      imageUrl: AppImages.entertaimentItem1,
      title: 'Бильярд',
      subtitle: '3 стола и бар',
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Развлечения",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _isExpanded ? _item.length : 2,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(
                _item[index].imageUrl,
                width: 48.r,
                height: 48.r,
                fit: BoxFit.fill,
              ),
              title: Text(
                _item[index].title,
                style: ListTileCustomTheme.listTileStyle(context),
              ),
              subtitle: Text(
                _item[index].subtitle,
                style: ListTileCustomTheme.caption(context),
              ),
              trailing: _item[index].trailing,
            );
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0.w,
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
