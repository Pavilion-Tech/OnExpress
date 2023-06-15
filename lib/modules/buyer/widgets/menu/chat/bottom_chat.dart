import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_form.dart';

import '../../../../../layout/buyer/buyer_cubit/buyer_cubit.dart';
import '../../../../../shared/images/images.dart';
import '../../../../../shared/styles/colors.dart';
import 'choose_chat_image.dart';

class BottomChat extends StatelessWidget {
  BottomChat({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20,bottom: 40),
      child: Row(
        children: [
          Expanded(
              child: DefaultForm(
                hint: tr('type_message'),
                suffix: InkWell(
                  onTap: (){
                    BuyerCubit.get(context).chatImage=null;
                    BuyerCubit.get(context).emitState();
                    showModalBottomSheet(
                        enableDrag: true,
                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart:  Radius.circular(20),
                                topEnd: Radius.circular(20)
                            )
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (context) => ChooseChatImage()
                    );
                  },
                    child: Icon(Icons.camera_alt)),
              )
          ),
          const SizedBox(width: 10,),
          //state is! SendMessageLoadingState ?
          InkWell(
            onTap: () {
              // if (cubit.controller.text.isNotEmpty) {
              //   cubit.sendMessageWithOutFile();
              // }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                border: Border.all(color:Colors.grey)
              ),
              alignment: AlignmentDirectional.center,
              child: Icon(Icons.send, color: defaultColor,size: 30,),
            ),
          )//:const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
