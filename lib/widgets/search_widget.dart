import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    required this.onChanged,
    required this.filterTap,
    required this.controller,
});

  ValueChanged<String> onChanged;
  VoidCallback filterTap;
  TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(12),
              color: defaultGrey
            ),
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(Images.searchIcon,width: 23,),
                const SizedBox(width: 20,),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    onChanged:onChanged,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: filterTap,
          child: Container(
            height: 57,width: 53,
            decoration: BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadiusDirectional.circular(12)
            ),
            alignment: AlignmentDirectional.center,
            child: Image.asset(Images.filter,width: 18,),
          ),
        )
      ],
    );
  }
}
