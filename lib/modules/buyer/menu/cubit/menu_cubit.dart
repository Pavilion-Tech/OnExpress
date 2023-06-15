import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/buyer/menu/cubit/menu_states.dart';

class MenuCubit extends Cubit<MenuStates>{

  MenuCubit ():super(MenuInitState());

  static MenuCubit get(context)=>BlocProvider.of(context);

  XFile? profileImage;

  ImagePicker picker = ImagePicker();

  Future<XFile?> pick(ImageSource source)async{
    try{
      return await picker.pickImage(source: source);
    } catch(e){
      print(e.toString());
      emit(ImageWrong());
    }
  }

  void emitState()=>emit(EmitState());
}