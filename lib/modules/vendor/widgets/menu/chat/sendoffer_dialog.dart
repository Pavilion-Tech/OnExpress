import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/components/constants.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/default_form.dart';

class SendOfferDialog extends StatelessWidget {
  SendOfferDialog(this.id);
  String id;

  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding:const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)
      ),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultForm(
                controller: controller,
                hint: tr('price'),
                validator: (str){
                  if(str.isEmpty)return tr('price_empty');
                },
              ),
              const SizedBox(height: 10,),
              DefaultButton(
                  width: size!.width*.4,
                  text: tr('send_offer'),
                  onTap: (){
                    if(formKey.currentState!.validate()){
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
