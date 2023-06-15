import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/styles/colors.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';
import '../../../../widgets/default_scaffold.dart';

class VendorContactScreen extends StatelessWidget {
  VendorContactScreen({Key? key}) : super(key: key);

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController subjectC = TextEditingController();
  TextEditingController messageC = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: tr('contact'),
      haveNotification: false,
      child:  Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: (){
                      // String phone = cubit.settingsModel?.data?.projectPhoneNumber ?? '';
                      // final Uri launchUri = Uri(
                      //   scheme: 'tel',
                      //   path: phone,
                      // );
                      // openUrl(launchUri.toString());
                    },
                    child: Container(
                      height: 46,width: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: defaultColor
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        Images.phone2,
                        width: 10,
                      ),
                    )
                ),
                SizedBox(
                  width: size!.width * .04,
                ),
                Expanded(
                  child: DefaultForm(
                    prefix: Image.asset(
                      Images.person,
                      color: Colors.grey.shade300,
                      width: 10,
                      height: 10,
                    ),
                      validator: (str){
                        if(str.isEmpty)return tr('name_empty');
                      },
                    controller: nameC,
                    hint: tr('name'),
                  ),
                )
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0),
              child: itemBuilder(
                  onTap: () {
                    // final Uri params = Uri(
                    //   scheme: 'mailto',
                    //   path: cubit.settingsModel?.data?.projectEmailAddress??'',
                    // );
                    // final url = params.toString();
                    // openUrl(url);
                  },
                  validator: (str){
                    if(str.isEmpty)return tr('email_address_empty');
                    if(!str.contains('.@'))return tr('email_address_invalid');
                  },
                  controller: emailC,
                  image: Images.gmail,
                  imageField: Images.gmail2,
                  titleField: 'gmail',
                  type: TextInputType.emailAddress),
            ),
            itemBuilder(
                onTap: () {
                  // String phone = cubit.settingsModel?.data?.projectWhatsAppNumber ?? '';
                  // String waUrl = 'https://wa.me/$phone';
                  // openUrl(waUrl);
                },
                validator: (str){
                  if(str.isEmpty)return tr('phone_empty');
                },
                controller: phoneC,
                image: Images.whatApp,
                imageField: Images.phone2,
                titleField: 'phone_number',
                type: TextInputType.phone),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0),
              child: itemBuilder(
                  onTap: (){
                    //openUrl(cubit.settingsModel?.data?.projectFacebookLink??'');
                  },
                  validator: (str){
                    if(str.isEmpty)return tr('subject_empty');
                  },
                  controller: subjectC,
                  image: Images.facebook,
                  imageField: Images.edit,
                  titleField: 'subject'),
            ),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                       // openUrl(cubit.settingsModel?.data?.projectTwitterLink??'');
                      },
                      child: Image.asset(
                        Images.twitter,
                        color: Colors.grey,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: (){
                        //openUrl(cubit.settingsModel?.data?.projectInstagramLink??'');
                      },
                      child: Image.asset(
                        Images.instagram,
                        color: Colors.grey,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size!.width * .1,
                ),
                Expanded(
                  child:  TextFormField(
                    maxLines: 6,
                    controller: messageC,
                    validator: (str){
                      if(str!.isEmpty)return tr('message_empty');
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.all(Radius.circular(15))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            Images.message,
                            color: Colors.grey.shade300,
                            width: 10,
                            height: 10,
                          ),
                        ),
                        hintText: tr('message'),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            DefaultButton(
              text: tr('send'),
              onTap: (){},
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder({
    required String image,
    required String imageField,
    required String titleField,
    required VoidCallback onTap,
    required TextEditingController controller,
    required FormFieldValidator validator,
    TextInputType? type,
  }) {
    return Row(
      children: [
        InkWell(
            onTap: onTap,
            child: Image.asset(
              image,
              color: Colors.grey,
              width: 20,
            )),
        SizedBox(
          width: size!.width * .1,
        ),
        Expanded(
          child: DefaultForm(
            prefix: Image.asset(
              imageField,
              color: Colors.grey.shade300,
              width: 10,
              height: 10,
            ),
            validator: validator,
            type: type,
            controller: controller,
            hint: tr(titleField),
          ),
        )
      ],
    );
  }
}
