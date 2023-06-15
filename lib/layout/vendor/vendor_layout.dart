import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_states.dart';
import '../../shared/images/images.dart';
import '../../shared/styles/colors.dart';

class VendorLayout extends StatelessWidget {
  const VendorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorCubit, VendorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VendorCubit.get(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            buttonBackgroundColor: defaultColor,
            index: cubit.currentIndex,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              cubit.currentIndex == 0
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Images.home,width: 25,),
              ) : Image.asset(Images.home,width: 20,color: Colors.grey,),
              cubit.currentIndex == 1
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Images.notificationYes,width: 25,color: Colors.white,),
              ) : Image.asset(Images.notificationNo,width: 20,color: Colors.grey,),
              cubit.currentIndex == 2
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Images.addYes,width: 25),
              ) : Image.asset(Images.addNo,width: 20,color: Colors.grey,),
              cubit.currentIndex == 3
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Images.orderHistory,width: 25,color: Colors.white,),
              ) : Image.asset(Images.orderHistory,width: 20,color: Colors.grey,),
              cubit.currentIndex == 4
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Images.person,width: 25,color: Colors.white,),
              ) : Image.asset(Images.person,width: 20,color: Colors.grey,),
            ],
          ),
        );
      },
    );
  }
}
