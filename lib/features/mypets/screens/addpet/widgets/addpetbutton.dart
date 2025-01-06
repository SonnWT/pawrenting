
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petGender.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petTypeButtonCont.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';
import 'package:pawrentingreborn/features/mypets/controllers/petController.dart';

class AddPetButton extends StatelessWidget {
  const AddPetButton({
    super.key,
    required this.pcontroller,
    required this.confirmation,
    required this.formGlobalKey1,
    required this.formGlobalKey2,
  });

  final addpetPageController pcontroller;
  final confirmation;
  final formGlobalKey1;
  final formGlobalKey2;

  @override
  Widget build(BuildContext context) {
    final typeController = Get.put(PetTypeButtonController());
    final genderController = Get.put(PetGenderButtonController());
    PetController petController = Get.find();
    return Positioned(
      bottom: 100,
      left: TDeviceUtil.getViewWidth(context)/2 - 150,
      child: Container(
       // color: Colors.red.withAlpha(100),
       height: 40,
       width: 300,
       child: confirmation
       ?Row(
         children: [
           Expanded(
             child: ElevatedButton(
               style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)
                   )
                 )
               ),
               onPressed: () {
                pcontroller.prevPage();
               }, 
               child: Text('Back', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black),), 
               )
           ),
           SizedBox(width: 15,),
           Expanded(
             child: ElevatedButton(
               style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)
                   )
                 )
               ),
               onPressed: () {
                pcontroller.nextPage();
               }, 
               child: Text('Add Pet', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black),), 
               )
           ),
         ],
       )
       :Row(
         children: [
           Expanded(
             child: ElevatedButton(
               style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)
                   )
                 )
               ),
               onPressed: () {
                pcontroller.prevPage();
               }, 
               child: Text('Back', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black),), 
               )
           ),
           SizedBox(width: 15,),
           Expanded(
             child: ElevatedButton(
               style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)
                   )
                 )
               ),
               onPressed: () {
                switch(pcontroller.curIndex){
                  case 0:{
                    if(formGlobalKey1.currentState!.validate()){
                      pcontroller.nextPage();
                    }
                  }
                  case 1:{
                    if(typeController.dog){
                      petController.updatePet(type: 'Dog');
                      pcontroller.nextPage();
                    }
                    else if(typeController.cat){
                      petController.updatePet(type: 'Cat');
                      pcontroller.nextPage();
                    }
                  }
                  case 2:{
                    if(genderController.male){
                      petController.updatePet(gender: 'Male');
                      pcontroller.nextPage();
                    }
                    else if(genderController.female){
                      petController.updatePet(gender: 'Female');
                      pcontroller.nextPage();
                    }
                  }
                  case 3:{
                    if(formGlobalKey2.currentState!.validate()){
                      pcontroller.nextPage();
                    }
                  }
                  case 4:{
                    pcontroller.nextPage();
                    
                  }
                }
               }, 
               child: Text('Next', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black),), 
               )
           ),
         ],
       )
     )
      );
  }
}