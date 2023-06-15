import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/vendor/auth/vendor_auth_cubit/vendot_auth_states.dart';

class VendorAuthCubit extends Cubit<VendorAuthStates>{
  VendorAuthCubit (): super(VendorAuthInitState());

  static VendorAuthCubit get(context)=>BlocProvider.of(context);

  XFile? signUpImage;

  ImagePicker picker = ImagePicker();


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