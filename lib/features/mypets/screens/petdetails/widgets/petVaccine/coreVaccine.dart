import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/VaccineController.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/mypets/models/VaccineModel.dart';
import 'package:pawrentingreborn/features/mypets/screens/petdetails/widgets/petVaccine/vaccineList.dart';

class CoreVaccine extends StatelessWidget {
  final PetModel pet;
  const CoreVaccine({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    VaccineController vaccineController = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Core Vaccine',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Alata',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
            ],
          ),
        ),
        SizedBox(height: 10),
        Obx(() => GridView.builder(
              itemCount: vaccineController.coreVaccines.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 10, mainAxisExtent: 90),
              itemBuilder: (_, index) => VaccineList(pet: pet,
                vaccine: vaccineController.coreVaccines[index],
              ),
            ))
      ],
    );
  }
}
