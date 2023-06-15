import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/buyer/home/home_screen.dart';
import 'package:on_express/modules/buyer/menu/menu_screen.dart';
import 'package:on_express/modules/buyer/order/order_screen.dart';
import 'package:on_express/modules/buyer/search/search_screen.dart';

import 'buyer_states.dart';

class BuyerCubit extends Cubit<BuyerStates> {
  BuyerCubit () : super(InitBuyerState());

  static BuyerCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  List<XFile?> problemImages = [];
  ImagePicker picker = ImagePicker();
  XFile? chatImage;


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

  void emitState ()=>emit(EmitState());

  Future<XFile?> pick(ImageSource source)async{
    try{
      return await picker.pickImage(source: source);
    } catch(e){
      print(e.toString());
      emit(ImageWrong());
    }
  }

  void pickListImage()async{
    if(problemImages.isNotEmpty){
      await picker.pickMultiImage().then((value) {
        value.forEach((element) {
          problemImages.add(element);
        });
      });
    }else{
      problemImages = await picker.pickMultiImage();
    }
    emit(ImagesPickedState());
  }
}