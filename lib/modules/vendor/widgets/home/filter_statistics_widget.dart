import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';

import '../../../../shared/images/images.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../widgets/default_form.dart';

class FilterStatisticsWidget extends StatelessWidget {


  int? checkNum(TextEditingController controller,int index){
    String num = controller.text.split('/')[index];
    return num.length ==2 ? null: 0;
  }

  String changeFormat(TextEditingController controller){
    return'${controller.text.trim().split('/')[2]}-${checkNum(controller,0)??''}${controller.text.trim().split('/')[0]}-${checkNum(controller,1)??''}${controller.text.trim().split('/')[1]}';
  }


  @override
  Widget build(BuildContext context) {
    var cubit  = VendorCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('filter_statistics'),
          style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
                child: DefaultForm(
                  controller: cubit.fromDateController,
                  hint: tr('from'),
                  readOnly: true,
                  onTap: (){
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.parse("2020-11-11"),
                      lastDate: DateTime.parse("2050-11-29"),
                    ).then((value) {
                      cubit.fromDateController.text =
                          DateFormat(null,'en').add_yMd().format(value!)
                              .toString();
                    });
                  },
                )
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: DefaultForm(
                  controller: cubit.toDateController,
                  hint: tr('to'),
                  readOnly: true,
                  onTap: (){
                    if(cubit.fromDateController.text.isNotEmpty){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse("2020-11-11"),
                        lastDate: DateTime.parse("2050-11-29"),
                      ).then((value) {
                        cubit.toDateController.text = DateFormat(null,'en')
                            .add_yMd().format(value!)
                            .toString();
                        String startDate = changeFormat(cubit.fromDateController);
                        String lastDate = changeFormat(cubit.toDateController);
                        print(startDate);
                        print(lastDate);
                        // WafrCubit.get(context).getStatistics(
                        //   from: startDate,to: lastDate
                        // );
                      });
                    }
                    // else{
                    //   showToast(msg: tr('choose_date'),toastState: true);
                    // }
                  },
                )
            ),
            const SizedBox(width: 10,),
            InkWell(
              onTap: (){
                cubit.fromDateController.text = '';
                cubit.toDateController.text = '';
                //cubit.getStatistics();
              },
              child: Container(
                height: 65,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(15)
                ),
                alignment: AlignmentDirectional.center,
                child: Icon(Icons.delete_forever,color: defaultColor,size: 20,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
