import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/images/images.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.maintenance,width: 210,height: 240,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  tr('maintenance_title'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600,fontSize: 22.5,fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                tr('maintenance_desc'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade500,fontSize: 11,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
