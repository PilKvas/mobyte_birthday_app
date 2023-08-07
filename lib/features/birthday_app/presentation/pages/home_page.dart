import 'package:flutter/material.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/home_page_widget/entertaiment.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/home_page_widget/inviting.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/home_page_widget/menu.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/home_page_widget/place.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/home_page_widget/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SliderWidget(),
              InvitingWidget(),
              MenuWidget(),
              EntertaimentWidget(),
              PlaceWidget()
            ],
          ),
        ),
      ),
    );
  }
}
