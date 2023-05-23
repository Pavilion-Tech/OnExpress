import 'package:flutter/material.dart';

import '../../../../../shared/components/constants.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/default_form.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

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
          'Select Address',
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  DefaultForm(hint: '182256, Tillman, North Glena.....'),
                  const Spacer(),
                  DefaultButton(
                    text: 'Confirm',
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
