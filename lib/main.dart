import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobyte_birthday_app/config/theme/app_theme.dart';

import 'features/birthday_app/domain/repositories/guest_repository_impl.dart';
import 'features/birthday_app/models/guest_adapter.dart';
import 'features/birthday_app/presentation/bloc/guest_bloc.dart';
import 'features/birthday_app/presentation/pages/home_page.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(GuestAdapter());
  final iterface =GuestRepositoryImpl(); 
  runApp(
    BlocProvider(create: (context) => GuestBloc(iterface), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mobyte Birthday App',
          home: child,
          theme: birthdayTheme(),
        );
      },
      child:  const HomePage(),
    );
  }
}
