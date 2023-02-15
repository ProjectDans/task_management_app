import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/myFriends.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: const SideBar(),
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
                            "People may you know",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: AppColor.primaryText),
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              clipBehavior: Clip.antiAlias,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: const Image(
                                          image: NetworkImage(
                                              'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Text(
                                          "Sylena Teresia",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                              ),
                                            ),
                                            child: const Icon(
                                                Ionicons.add_circle_outline),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          MyFriends(),
                        ],
                      ),
                    ),
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
