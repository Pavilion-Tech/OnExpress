import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

class ChoosePhotoTypeDialog extends StatelessWidget {
  ChoosePhotoTypeDialog({
    required this.cameraTap,
    required this.browseTap,
});
  VoidCallback cameraTap;
  VoidCallback browseTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemBuilder(
              onTap: cameraTap,
              title: tr('use_camera'),
              image: Images.camera,
            ),
            const SizedBox(height: 30,),
            itemBuilder(
              onTap: browseTap,
              title: tr('choose_library'),
              image: Images.image,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder({
    required VoidCallback onTap,
    required String title,
    required String image,
  }){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image,width: 23,color: defaultColor,),
          const SizedBox(width: 5,),
          Text(
            title,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
