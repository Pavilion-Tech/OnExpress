import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_states.dart';

import '../../../modules/vendor/add/add_screen.dart';
import '../../../modules/vendor/home/vendor_home_screen.dart';
import '../../../modules/vendor/menu/vendor_menu_screen.dart';
import '../../../modules/vendor/notification/vendor_notification_screen.dart';
import '../../../modules/vendor/order/vendor_order_history_screen.dart';

class VendorCubit extends Cubit<VendorStates>{

  VendorCubit () : super(VendorInitState());

  static VendorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  ImagePicker picker = ImagePicker();
  XFile? highlightImage;
  List<XFile?> serviceImages = [];


  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  List<Widget> screens = [
    VendorHomeScreen(),
    VendorNotificationScreen(),
    AddScreen(),
    VendorOrderHistoryScreen(),
    VendorMenuScreen(),
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
    if(serviceImages.isNotEmpty){
      await picker.pickMultiImage().then((value) {
        value.forEach((element) {
          serviceImages.add(element);
        });
      });
    }else{
      serviceImages = await picker.pickMultiImage();
    }
    emit(ImagesPickedState());
  }
}