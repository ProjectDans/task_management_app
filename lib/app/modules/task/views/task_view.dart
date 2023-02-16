import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: SizedBox(width: 150, child: const SideBar()),
        backgroundColor: AppColor.primaryBg,
        body: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const Header()
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: Icon(Icons.menu),
                                color: AppColor.primaryText,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Task Management",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryText),
                                  ),
                                  Text(
                                    "Manage Task Easier With Friends",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: AppColor.primaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Ionicons.notifications,
                                color: AppColor.primaryText,
                              ),
                              const SizedBox(width: 15),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Photos.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(25)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.only(
                              top: 30, left: 16, right: 16, bottom: 16)
                          : const EdgeInsets.only(
                              top: 30, left: 0, right: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Task",
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: AppColor.primaryText),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: AppColor.primaryCard,
                                  ),
                                  margin: EdgeInsets.all(16),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  Colors.amberAccent,
                                              radius: 25,
                                              foregroundImage: NetworkImage(
                                                  'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  Colors.amberAccent,
                                              radius: 25,
                                              foregroundImage: NetworkImage(
                                                  'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            color: AppColor.primaryBg,
                                            child: Center(
                                              child: Text(
                                                "100%",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color:
                                                        AppColor.primaryText),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        color: AppColor.primaryBg,
                                        child: Center(
                                          child: Text(
                                            "10 / 10 Task",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: AppColor.primaryText),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Flutter Class",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: AppColor.primaryText),
                                      ),
                                      Text(
                                        "Deadline 2 Jam Lagi",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: AppColor.primaryText),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              clipBehavior: Clip.antiAlias,
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.bottomSheet(
              Container(
                margin: context.isPhone
                    ? EdgeInsets.zero
                    : EdgeInsets.only(right: 150, left: 150),
                height: Get.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
              ),
            );
          },
          label: Text(
            "Add Task",
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Ionicons.add),
        ),
      ),
    );
  }
}
