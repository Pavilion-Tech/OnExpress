import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

class VendorDetails extends StatelessWidget {
  const VendorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 219,width: 219,
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Store Name',
            style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.w500
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.location,width: 17,),
            const SizedBox(width: 5,),
            Expanded(
              child: Text(
                'Store Name',
                style: TextStyle(
                    fontSize: 11,color: Colors.grey
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
