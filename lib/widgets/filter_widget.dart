import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/styles/colors.dart';
import 'default_button.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({this.text,required this.doneTap,this.isProvider = false});

  String? text;
  VoidCallback doneTap;
  bool isProvider;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  int currentRate  = -1;
  int currentLocation  = -1;
  int currentPrice  = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: defaultColor,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(200)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50,left: 30,right: 30,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              filter(
                  title: tr('rating'),
                  currentInd: currentRate,
                  titleRadio1: tr('high_to_low'),
                  titleRadio2:tr('low_to_high'),
                  group: null
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: filter(
                    title: tr('location'),
                    currentInd: currentLocation,
                    titleRadio1: tr('nearest'),
                    titleRadio2: tr('farthest'),
                    group: 'Location'
                ),
              ),
              filter(
                  title: tr('price'),
                  currentInd: currentPrice,
                  titleRadio1: tr('high_to_low'),
                  titleRadio2:tr('low_to_high'),
                  group: 'Price'
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: DefaultButton(
                          text: tr('done'),
                          onTap: widget.doneTap
                          )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: DefaultButton(
                          text: tr('discard'),
                          color: Colors.white,
                          textColor: defaultColor,
                          onTap: (){
                            Navigator.pop(context);
                          }
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemBuilder ({
    required bool isSelected,
    required int index,
    required String title,
    String? group,
  }){
    return InkWell(
      onTap: (){
        setState(() {
          if(group==null)currentRate = index;
           if(group=='Location')currentLocation = index;
           if(group=='Price')currentPrice = index;
        });
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: defaultColorFour,fontSize: 17),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey.shade300,
            child:isSelected ? CircleAvatar(
              radius: 7,
              backgroundColor:defaultColor,
            ):null,
          )
        ],
      ),
    );
  }


  Widget filter ({
  required String title,
  required String titleRadio1,
  required String titleRadio2,
    String? group,
  required int currentInd,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: defaultColorFour,fontSize: 19,fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5,),
        itemBuilder(
            title: titleRadio1,
            isSelected: currentInd == -1,
            index: -1,
            group:group
        ),
        const SizedBox(height: 12,),
        itemBuilder(
            title: titleRadio2,
            isSelected: currentInd == 1,
            index: 1,
            group:group
        ),
      ],
    );
  }
}


