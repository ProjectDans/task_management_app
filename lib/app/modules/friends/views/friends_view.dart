import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/myFriends.dart';
import 'package:task_management_app/app/utils/widget/peopleYouMayKnow.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authCon = Get.find<AuthController>();

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
                          child: Column(
                            children: [
                              Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              SizedBox(
                                height: 20,
                              ),
                              context.isPhone
                                  ? TextField(
                                      onChanged: (value) =>
                                          authCon.searchFriends(value),
                                      controller:
                                          authCon.searchFriendsController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.only(
                                            left: 20, right: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: AppColor.primaryText,
                                        ),
                                        hintText: "Search",
                                      ),
                                    )
                                  : SizedBox(),
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
                      child: Obx(
                        () => authCon.hasilPencarian.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                      "People may u know",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: AppColor.primaryText),
                                    ),
                                    PeopleYouMayKnow(),
                                    MyFriends(),
                                  ])
                            : ListView.builder(
                                padding: EdgeInsets.all(8),
                                shrinkWrap: true,
                                itemCount: authCon.hasilPencarian.length,
                                itemBuilder: (context, index) => ListTile(
                                      onTap: () => authCon.addFriends(authCon
                                          .hasilPencarian[index]['email']),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(45),
                                        child: Image(
                                          image: NetworkImage(authCon
                                              .hasilPencarian[index]['photo']),
                                        ),
                                      ),
                                      title: Text(
                                        authCon.hasilPencarian[index]['name'],
                                        style: GoogleFonts.poppins(),
                                      ),
                                      subtitle: Text(
                                        authCon.hasilPencarian[index]['email'],
                                        style: GoogleFonts.poppins(),
                                      ),
                                      trailing: Icon(Ionicons.add),
                                    )),
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
