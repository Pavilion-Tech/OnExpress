import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:on_express/shared/images/images.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,height: 184,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(25),
            color: Colors.black
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(Images.product2,fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0,bottom: 5),
          child: Text(
            'Name Of Provider',
            style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: 5,
              itemSize: 15,
              direction: Axis.horizontal,
              itemCount: 5,
              allowHalfRating: true,
              unratedColor: Colors.grey,
              ignoreGestures: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, index) {
                if (5 > index) {
                  return Image.asset(Images.star);
                } else {
                  return Image.asset(Images.star,color: Colors.grey,);
                }
              },
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(width: 7,),
            Text(
              '5.00',
              style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
