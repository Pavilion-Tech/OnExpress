import 'package:flutter/material.dart';
import '../../../../../shared/images/images.dart';
import '../../../../../shared/styles/colors.dart';

class ListOrderItems extends StatelessWidget {
  const ListOrderItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          itemBuilder: (c,i)=>OrderItem(),
          separatorBuilder: (c,i)=>const SizedBox(height: 30,),
          itemCount: 5
      ),
    );
  }
}


class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 124,height: 122,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusDirectional.circular(15)
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.product,fit: BoxFit.cover,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name Of Provider',
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    'Trash Collecting',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '20\$/h',
                    maxLines: 1,
                    style: TextStyle(color:defaultColor,fontSize: 12,fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Image.asset(Images.star,width: 12,),
                      Expanded(
                        child: Text(
                          '5.0',
                          style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Text(
                          'Track',
                          style: TextStyle(color: defaultColor,fontSize: 15,fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

