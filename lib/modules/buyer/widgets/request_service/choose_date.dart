import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../shared/styles/colors.dart';

class ChooseDate extends StatefulWidget {
  ChooseDate({Key? key}) : super(key: key);

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {

  int currentMonth = DateTime.now().month;
  int finalCurrentMonth = DateTime.now().month;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<int> days = [
    DateTime(DateTime.now().year,2).toUtc().day,
    DateTime(DateTime.now().year,3).toUtc().day,
    DateTime(DateTime.now().year,4).toUtc().day,
    DateTime(DateTime.now().year,5).toUtc().day,
    DateTime(DateTime.now().year,6).toUtc().day,
    DateTime(DateTime.now().year,7).toUtc().day,
    DateTime(DateTime.now().year,8).toUtc().day,
    DateTime(DateTime.now().year,9).toUtc().day,
    DateTime(DateTime.now().year,10).toUtc().day,
    DateTime(DateTime.now().year,11).toUtc().day,
    DateTime(DateTime.now().year,12).toUtc().day,
    DateTime(DateTime.now().year,13).toUtc().day,
  ];

  String? monthVal;
  int currentDay = DateTime.now().day;
  int finalCurrentDay = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                tr('date_time'),
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.grey.shade700),
              ),
            ),
            DropdownButton(
                items: months.map((e) {
                  return DropdownMenuItem(
                    child: Text(
                        e,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    value: e,
                  );
                }).toList(),
                value: monthVal,
                alignment: AlignmentDirectional.center,
                icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                dropdownColor:  Colors.white,
                hint: Text(
                  months[DateTime.now().month-1],
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                onChanged: (val){
                  setState(() {
                    monthVal = val;
                    currentMonth = months.indexOf(monthVal??'') +1;
                    if(currentMonth == finalCurrentMonth){
                      currentDay = finalCurrentDay;
                    }else{
                      if(currentMonth < finalCurrentMonth){
                        currentDay = 0;
                      }else{
                        currentDay = 1;
                      }
                      print(currentDay);
                    }
                  });
                }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 79,
                child: ConditionalBuilder(
                  condition: currentMonth >= finalCurrentMonth,
                  fallback: (context)=>Center(child: Text(tr('date_not_available'))),
                  builder: (context)=> ListView.separated(
                      itemBuilder: (c,i)=>dayItem(i+1),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (c,i)=>const SizedBox(width: 15,),
                      itemCount: days[currentMonth]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dayItem(int day){
    String dayName = DateFormat('EEE').format(DateTime(DateTime.now().year,currentMonth,day));
    return InkWell(
      onTap:dayName !='Sat'&&dayName!='Sun'? (){
        if(currentMonth == finalCurrentMonth){
          if(day >= finalCurrentDay){
            setState(() {
              currentDay = day;
            });
          }
        }else{
          setState(() {
            currentDay = day;
          });
        }

      }:null,
      child: Container(
        height: 79,width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color:dayName !='Sat'&&dayName!='Sun'?currentDay == day?defaultColor:currentMonth == finalCurrentMonth &&day < finalCurrentDay?Colors.grey: defaultColor.withOpacity(.3):HexColor('#D04A3F')
        ),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$day',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color:currentDay == day?Colors.white:dayName !='Sat'&&dayName!='Sun'?Colors.black:Colors.white
              ),
            ),
            Text(
              dayName,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color:currentDay == day?Colors.white:dayName !='Sat'&&dayName!='Sun'?Colors.black:Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
