import 'dart:async';

import 'package:flutter/material.dart';
import 'package:on_express/intro/intro_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

import 'layout/buyer/buyer_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      navigateAndFinish(context,BuyerLayout());
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultColor,
      body: Center(child: Image.asset(Images.splash,width: 200,height: 194,)),
    );
  }
}
