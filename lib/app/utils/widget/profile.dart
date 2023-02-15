import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 120,
                      foregroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sylena Teresia",
                        style: GoogleFonts.poppins(
                            fontSize: 24, color: AppColor.primaryText),
                      ),
                      Text(
                        "sylenateresia@gmail.com",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: AppColor.primaryText),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 120,
                      foregroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Sylena Teresia",
                    style: GoogleFonts.poppins(
                        fontSize: 24, color: AppColor.primaryText),
                  ),
                  Text(
                    "sylenateresia@gmail.com",
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: AppColor.primaryText),
                  ),
                ],
              ),
            ),
    );
  }
}
