
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class InsideNavBar extends StatelessWidget {
  const InsideNavBar({
    super.key,
    required this.controller,
    required this.navcontroller,
  });

  final NavBarController controller;
  final NavigationController navcontroller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        NavigationBar(
          selectedIndex: controller.curIndex,
          // onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          onDestinationSelected: (index) => {
            navcontroller.selectedIndex.value = index,
            Get.to(()=>NavigationMenu())
          },
          height: 80,
          destinations: [
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.homeIcon), color: TColors.accent, size: 28,), label: 'Home' ),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.myPetIcon), color: TColors.accent, size: 28), label: 'My Pets'),
            SizedBox(width: 100,),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.communityIcon), color: TColors.accent, size: 28), label: 'Community'),
            NavigationDestination(icon: ImageIcon(AssetImage(TImages.profileIcon), color: TColors.accent, size: 28), label: 'Profile'),
          ]
        ),
        Positioned(
          left: TDeviceUtil.getViewWidth(context)/2 - 50,
          bottom: TDeviceUtil.getAppBarHeight()/2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: TColors.accent
              ),
              child: Image(image: AssetImage(TImages.translateIcon), color: TColors.secondary,),
            ),
          )
        )
      ]
    );
  }
}