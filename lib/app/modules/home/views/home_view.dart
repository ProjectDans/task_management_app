import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SideBar(),
            ),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Task Management",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Manage Task Easier With Friends",
                                style: GoogleFonts.poppins(fontSize: 10),
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
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
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
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign Out",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Ionicons.log_out_outline,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
