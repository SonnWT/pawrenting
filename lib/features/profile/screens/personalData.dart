import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/features/profile/widgets/profilePictandUsername.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';
import 'package:pawrentingreborn/navigationMenu.dart';

class PersonalData extends StatelessWidget {
  final GlobalKey<FormState> formGlobalKey;

  const PersonalData({
    super.key,
    required this.formGlobalKey,
  });

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();
    NavigationController navcontroller = Get.find();
    return Scaffold(
      appBar: const TAppBar2(
        title: "Personal Data",
        subtitle: "Your Personal Information",
      ),
      bottomNavigationBar:
          InsideNavBar(controller: controller, navcontroller: navcontroller),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: TColors.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Profilepictandusername(
                      profilePicture: TImages.userProfilePic,
                    ),
                    Positioned(
                      top: 122,
                      left: 85,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: TColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            TImages.editIcon,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField("First Name", "Kim"),
                      buildTextField("Last Name", "Kardashian"),
                      buildTextField("Username", "@kimdash"),
                      buildTextField("Date Of Birth", "20/05/2005",
                          suffixIcon: Icons.calendar_today),
                      buildTextField("Phone Number", "89123456789",
                          prefixText: "+62 "),
                      buildTextField("Email", "kimdashian@gmail.com"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Cancel"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.accent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Save"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hintText,
      {String? prefixText, IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Alata",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: "Alata",
                fontSize: 14,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixText: prefixText,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: Colors.grey)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
