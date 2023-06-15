import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/default_form.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(25.2048,55.2708),zoom: 14
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black),onPressed: ()=>Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text(
          tr('select_address'),
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: initialCameraPosition,
              zoomControlsEnabled: false,
              onTap: (latLng){}
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  DefaultForm(hint: '182256, Tillman, North Glena.....'),
                  const Spacer(),
                  DefaultButton(
                    text: tr('confirm'),
                    onTap: (){},
                    color: Colors.white,
                    textColor: defaultColor,
                    width: size!.width*.75,
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
