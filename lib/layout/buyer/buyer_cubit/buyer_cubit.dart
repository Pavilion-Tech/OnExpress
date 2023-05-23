import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_express/modules/buyer/home/home_screen.dart';
import 'package:on_express/modules/buyer/menu/menu_screen.dart';
import 'package:on_express/modules/buyer/order/order_screen.dart';
import 'package:on_express/modules/buyer/search/search_screen.dart';

import 'buyer_states.dart';

class BuyerCubit extends Cubit<BuyerStates> {
  BuyerCubit () : super(InitBuyerState());

  static BuyerCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    OrderHistoryScreen(),
    MenuScreen(),
  ];

  void changeIndex(int index){
    currentIndex  = index;
    emit(ChangeIndexState());
  }
}