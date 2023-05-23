import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black),onPressed: ()=>Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50),
                  topEnd: Radius.circular(50),
                )
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Container(color: defaultColor),
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#FDFDFD'),
                      borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(250)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 40),
                    child: Column(
                      children: [
                        Text(
                          '3.2 KM',
                          style: TextStyle(
                            color: HexColor('#4F5175'),fontSize: 41,fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          '10 Min',
                          style: TextStyle(
                            color: HexColor('#4F5175'),fontSize: 18
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 68,width: 65,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(Images.product2,fit: BoxFit.cover,),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Mahomoud Ali',
                                maxLines: 1,
                                style: TextStyle(
                                    color: HexColor('#4F5175'),fontSize: 18
                                ),
                              ),
                            ),
                            Container(
                              height: 68,width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: HexColor('#4F5175'),width: 6)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(Images.car,width: 20,),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 68,width: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: defaultColor,width: 3)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(Images.phone,width: 20,),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Container(
                              height: 68,width: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: defaultColor,width: 3)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(Images.whats,width: 20,),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
