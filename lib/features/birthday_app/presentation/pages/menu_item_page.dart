import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class MyWidget extends StatelessWidget {
  final String urlImage;
  final int index;
  final String name;
  final String heroTag;
  const MyWidget({
    super.key,
    required this.index,
    required this.name,
    required this.urlImage,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: ScreenUtil().screenWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: ScreenUtil().screenWidth < 600 ?  MediaQuery.of(context).size.width * (0.4) : MediaQuery.of(context).size.width * (0.56),
            top:ScreenUtil().screenWidth < 600 ?  MediaQuery.of(context).size.width * (0.2) : MediaQuery.of(context).size.width * (0.2),
            child: Hero(
                tag: heroTag,
                child: Container(
                  width: ScreenUtil().screenWidth < 600 ? 357.w : 357.w * 2,
                  height: ScreenUtil().screenWidth < 600 ? 264.h : 264.h * 2,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(urlImage),
                      fit: BoxFit.fill,
                    ),
                    shape: const OvalBorder(),
                  ), 
                )),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: const Text('Hello world'),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    ));
  }
}
