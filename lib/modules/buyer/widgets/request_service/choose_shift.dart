import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/styles/colors.dart';


class ChooseShift extends StatefulWidget {
  const ChooseShift({Key? key}) : super(key: key);

  @override
  State<ChooseShift> createState() => _ChooseShiftState();
}

class _ChooseShiftState extends State<ChooseShift> {

  int morningIndex = 1;
  int nightIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            morningShift(1,'09:00 AM'),
            morningShift(2,'10:00 AM'),
            morningShift(3,'11:00 AM'),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            nightShift(1,'1:00 PM'),
            nightShift(2,'2:00 PM'),
            nightShift(3,'3:00 PM'),
          ],
        ),
      ],
    );
  }

  Widget morningShift(int index , String title){
    return InkWell(
      onTap: (){
        setState(() {
          nightIndex = 4;
          morningIndex = index;
        });
      },
      child: Container(
        height: 47,
        width: 107,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            color: morningIndex == index?defaultColor:defaultColor.withOpacity(.3)
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          title,
          style:TextStyle(color:
          morningIndex == index?Colors.white: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
      ),
    );
  }
  Widget nightShift(int index , String title){
    return InkWell(
      onTap: (){
        setState(() {
          morningIndex = 4;
          nightIndex = index;
        });
      },
      child: Container(
        height: 47,
        width: 107,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            color: nightIndex == index?defaultColor:defaultColor.withOpacity(.3)
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          title,
          style:TextStyle(color:
          nightIndex == index?Colors.white: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
