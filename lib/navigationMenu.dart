import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/screens/community.dart';
import 'package:pawrentingreborn/features/home/screens/home.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/petlist.dart';
import 'package:pawrentingreborn/features/profile/screens/profile.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: TColors.accent,
        onPressed: (){},
        shape: CircleBorder(),
        child: ImageIcon(
          AssetImage(TImages.translateIcon),
          color: TColors.secondary,
          size: 72,
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () =>  NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          height: 80,
          destinations: [
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.homeIcon), color: TColors.accent, size: 28,), label: 'Home' ),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.myPetIcon), color: TColors.accent, size: 28), label: 'My Pets'),
            SizedBox(width: 100,),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.communityIcon), color: TColors.accent, size: 28), label: 'Community'),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.profileIcon), color: TColors.accent, size: 28), label: 'Profile'),
          ]
          
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value],
      )
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Home(),
    PetList(),
    Container(color: Colors.yellow,),
    Community(),
    Profile(),
  ];
}