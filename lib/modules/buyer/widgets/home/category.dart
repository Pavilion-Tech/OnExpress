import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        itemBuilder(index: 0,image: Images.trash,title: 'Cleaning'),
        const SizedBox(width: 15,),
        itemBuilder(index: 1,image: Images.cleaning,title: 'Trash'),
      ],
    );
  }

  Widget itemBuilder({
  required int index,
  required String image,
  required String title,
}){
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            currentIndex = index;
          });
        },
        child: Container(
          height: 93,
          decoration: BoxDecoration(
            color: defaultGrey,
            borderRadius: BorderRadiusDirectional.circular(15),
            border:currentIndex == index ? Border.all(color: defaultColor):null
          ),
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image,width: 50,height: 50,),
              const SizedBox(height: 10,),
              Text(
                title,
                style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
          itemBuilder: (c,i)=>itemBuilder(index: i),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (c,i)=>const SizedBox(width: 10,),
          itemCount: 4
      ),
    );
  }

  Widget itemBuilder({
    required int index,
  }){
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 75,width: size!.width*.205,
        decoration: BoxDecoration(
            color: defaultGrey,
            borderRadius: BorderRadiusDirectional.circular(15),
            border:currentIndex == index ? Border.all(color: defaultColor):null
        ),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.cleaning,width: 30,height: 30,),
            const SizedBox(height: 5,),
            Text(
              'Cleaning',
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
