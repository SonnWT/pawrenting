
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petGender.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class PetGenderButton extends StatelessWidget {
  const PetGenderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PetGenderButtonController controller = Get.find();
    return Container(
     child: GetBuilder<PetGenderButtonController>(
       builder: (context) {
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Container(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                        side: controller.male
                         ? BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       )
                     )
                   ),
                   onPressed: (){
                    controller.selectmale();
                   }, 
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.maleIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Male',
                           style: TextStyle(
                             fontFamily: 'Alata',
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                           )
                           )
                       ],
                     ),
                   ),
                 ),
               ),
             Container(
               height: 100,
               width: 100,
                 child: ElevatedButton(
                   style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                        side: controller.female
                         ? BorderSide(
                          color: TColors.accent,
                         )
                         : BorderSide.none
                       )
                     )
                   ),
                   onPressed: (){
                    controller.selectfemale();
                   }, 
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage(TImages.femaleIcon),
                           color: TColors.accent,
                           fit: BoxFit.fill,
                           height: 55,
                         ),
                         Text(
                           'Female',
                           style: TextStyle(
                             fontFamily: 'Alata',
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                           )
                           )
                       ],
                     ),
                   ),
                 ),
               )
         
           ],
         );
       }
     ),
    );
  }
}