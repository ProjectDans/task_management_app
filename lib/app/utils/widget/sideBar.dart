import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        height: Get.height,
        color: AppColor.primaryBg,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/icon.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/home'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              )
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/home'
                              ? Ionicons.desktop
                              : Ionicons.desktop_outline,
                          color: AppColor.primaryText,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: AppColor.primaryText),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.HOME),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/task'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              )
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/task'
                              ? Ionicons.cube
                              : Ionicons.cube_outline,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Task",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.TASK),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/friends'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              )
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/friends'
                              ? Ionicons.heart
                              : Ionicons.heart_outline,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Friends",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.FRIENDS),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/profile'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              )
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/profile'
                              ? Ionicons.person
                              : Ionicons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.PROFILE),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        child: const Icon(
                          Ionicons.log_out,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Sign Out",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.defaultDialog(
                        title: "Sign Out",
                        content: const Text("Are You Sure Want To Sign Out?"),
                        cancel: ElevatedButton(
                          onPressed: () => Get.back(),
                          child: const Text("Cancel"),
                        ),
                        confirm: ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN),
                            child: const Text("Sign Out")));
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
