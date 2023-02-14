import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Task Management",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryText),
                ),
                Text(
                  "Manage Task Easier With Friends",
                  style: GoogleFonts.poppins(
                      fontSize: 10, color: AppColor.primaryText),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 20, right: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.primaryText,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Ionicons.notifications,
              color: AppColor.primaryText,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
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
              child: Row(
                children: [
                  Text(
                    "Sign Out",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryText),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Ionicons.log_out_outline,
                    color: AppColor.primaryText,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
