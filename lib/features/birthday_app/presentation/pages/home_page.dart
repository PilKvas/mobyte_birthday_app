import 'package:flutter/material.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/entertaiment.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/inviting.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/menu.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/place.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/slider.dart';

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
