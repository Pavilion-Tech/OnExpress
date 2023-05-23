import 'package:flutter/material.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../shared/images/images.dart';

class ChooseAddress extends StatefulWidget {
  const ChooseAddress({Key? key}) : super(key: key);

  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 20),
          child: Text(
            'Address',
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.grey.shade700),
          ),
        ),
        ListView.separated(
            itemBuilder: (c,i)=>itemBuilder(i),
            separatorBuilder: (c,i)=>const SizedBox(height: 15,),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2
        ),
        const SizedBox(height: 15,),
        Center(
          child:DefaultButton(
              text: 'Add New Address',
              width: 159,
              height: 33,
              radius: 9,
              textSize: 11,
              onTap: (){}
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(int index){
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 104,width: double.infinity,
        decoration: BoxDecoration(
          color: defaultGrey,
          borderRadius: BorderRadiusDirectional.circular(20)
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(Images.location,width: 12,),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                          '26985 Brighton Lane, Lake Forest, CA 92630.',
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child:currentIndex == index ? CircleAvatar(
                radius: 8,
                backgroundColor: defaultColor,
              ):null,
            )
          ],
        ),
      ),
    );
  }
}
