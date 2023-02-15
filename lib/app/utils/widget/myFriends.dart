import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "My Friends",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: AppColor.primaryText),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.FRIENDS),
                    child: Text(
                      "More",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: AppColor.primaryText),
                    ),
                  ),
                  const Icon(
                    Ionicons.arrow_forward,
                    color: AppColor.primaryText,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isPhone ? 2 : 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: const CircleAvatar(
                              backgroundColor: Colors.amberAccent,
                              radius: 60,
                              foregroundImage: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                            ),
                          ),
                          Text(
                            "Sylena Teresia",
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
