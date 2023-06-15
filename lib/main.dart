import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';
import 'package:on_express/modules/buyer/menu/cubit/menu_cubit.dart';
import 'package:on_express/shared/bloc_observer.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/network/local/cache_helper.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/splash_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'layout/buyer/buyer_cubit/buyer_cubit.dart';
import 'modules/vendor/auth/vendor_auth_cubit/vendor_auth_cubit.dart';
import 'modules/vendor/menu/cubit/vendor_menu_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //DioHelper.init1();
  await CacheHelper.init();
  String? loca = CacheHelper.getData(key: 'locale');
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  version = packageInfo.version;
  if(loca !=null){
    myLocale = loca;
  }else{
    Platform.localeName.contains('ar')
        ?myLocale = 'ar'
        :myLocale = 'en';
  }
  BlocOverrides.runZoned(
        () {
      runApp(
        EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          useOnlyLangCode: true,
          path: 'assets/langs',
          fallbackLocale: const Locale('en'),
          startLocale: Locale(myLocale),
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color.fromRGBO(41, 167, 77, 50),
        //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>BuyerCubit()),
        BlocProvider(create: (BuildContext context)=>VendorCubit()),
        BlocProvider(create: (BuildContext context)=>MenuCubit()),
        BlocProvider(create: (BuildContext context)=>VendorMenuCubit()),
        BlocProvider(create: (BuildContext context)=>VendorAuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark
              )
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: defaultColor
          ),
          fontFamily: 'Cairo',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
