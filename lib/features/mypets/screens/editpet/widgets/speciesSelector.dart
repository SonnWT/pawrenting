import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/editPet/editPetController.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/size.dart';

class SpeciesSelector extends StatelessWidget {
  const SpeciesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    EditPetController editPetController = Get.find();
    return Obx(() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              editPetController.updateSpecies('Cat');
            },
            child: Container(
              height: 35,
              width: 110,
              decoration: editPetController.species.value == 'Cat'
                  ? BoxDecoration(
                      color: TColors.accent.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: TColors.accent),
                    )
                  : BoxDecoration(
                      color: TColors.gray2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
              child: Center(
                child: Text(
                  'Cat',
                  style: editPetController.species.value == 'Cat'
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w700)
                      : TextStyle(
                          color: TColors.grayFont,
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            width: TSize.horizontalSpacing,
          ),
          GestureDetector(
            onTap: () {
              editPetController.updateSpecies('Dog');
            },
            child: Container(
              height: 35,
              width: 110,
              decoration: editPetController.species.value == 'Dog'
                  ? BoxDecoration(
                      color: TColors.accent.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: TColors.accent),
                    )
                  : BoxDecoration(
                      color: TColors.gray2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
              child: Center(
                child: Text(
                  'Dog',
                  style: editPetController.species.value == 'Dog'
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w700)
                      : TextStyle(
                          color: TColors.grayFont,
                          fontSize: 14,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}