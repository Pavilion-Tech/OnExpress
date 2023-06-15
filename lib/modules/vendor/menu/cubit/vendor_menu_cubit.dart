import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/vendor/menu/cubit/vendor_menu_states.dart';

class VendorMenuCubit extends Cubit<VendorMenuStates>{

  VendorMenuCubit (): super(VendorMenuInitState());

  static VendorMenuCubit get(context)=>BlocProvider.of(context);

  ImagePicker picker = ImagePicker();
  XFile? chatImage;
  XFile? profileImage;

  void emitState ()=>emit(EmitState());

  Future<XFile?> pick(ImageSource source)async{
    try{
      return await picker.pickImage(source: source);
    } catch(e){
      print(e.toString());
      emit(ImageWrong());
    }
  }



}