import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/images/images.dart';
import '../../shared/styles/colors.dart';
import 'buyer_cubit/buyer_cubit.dart';
import 'buyer_cubit/buyer_states.dart';

class BuyerLayout extends StatelessWidget {
  const BuyerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyerCubit, BuyerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BuyerCubit.get(context);
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
                  )
                  : Image.asset(Images.home,width: 20,color: Colors.grey,),
              cubit.currentIndex == 1
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Images.search,width: 25,color: Colors.white,),
                  )
                  : Image.asset(Images.search,width: 20,color: Colors.grey,),
              cubit.currentIndex == 2
                  ?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Images.orderHistory,width: 25,color: Colors.white,),
                  )
                  : Image.asset(Images.orderHistory,width: 20,color: Colors.grey,),
              cubit.currentIndex == 3
                  ?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Images.person,width: 25,color: Colors.white,),
                  )
                  : Image.asset(Images.person,width: 20,color: Colors.grey,),
            ],
          ),
        );
      },
    );
  }
}
