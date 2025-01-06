
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petGender.dart';
import 'package:pawrentingreborn/features/mypets/screens/addpet/widgets/petGenderButton.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class addPet3 extends StatelessWidget {
  const addPet3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetGenderButtonController controller = Get.find();
    return Padding(
       padding: EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 125),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             // color: Colors.red.withAlpha(100),
             height: 250,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   // color: Colors.red.withAlpha(100),
                   width: 250,
                   child: Text(
                     'What is your pet\'s gender?',
                     style: Theme.of(context).textTheme.headlineLarge,
                     textAlign: TextAlign.center,
                     ),
                 ),
                 Form(
                   child: PetGenderButton(),
                 ),
                 SizedBox(height: 10,)
               ],
             ),
           ),
         ],
       ),
     );
  }
}