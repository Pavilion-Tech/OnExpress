import 'package:flutter/material.dart';
import '../../../../shared/components/constants.dart';

class HomeItemWidget extends StatelessWidget {


  HomeItemWidget({
    required this.title,
    required this.count,
});

  String title;
  String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        border: Border.all(color: Colors.grey.shade500),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 10,),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.w500,fontSize:20),
          ),
        ],
      ),
    );
  }
}
