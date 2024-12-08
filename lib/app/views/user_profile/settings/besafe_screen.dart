import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class BeSafeReminderScreen extends StatefulWidget {
  const BeSafeReminderScreen({super.key});

  @override
  State<BeSafeReminderScreen> createState() => _BeSafeReminderScreenState();
}

class _BeSafeReminderScreenState extends State<BeSafeReminderScreen> {
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "BeSafe Reminder",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Panic Mode",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController.panicModeToggle.value =
                              !settingsScreenController.panicModeToggle.value;
                        },
                        initialValue:
                            settingsScreenController.panicModeToggle.value,
                      )
                    ],
                  ),
                ),
              ),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Regular Radius Monitoring",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController
                                  .regularRaiudMonitoringToggle.value =
                              !settingsScreenController
                                  .regularRaiudMonitoringToggle.value;
                        },
                        initialValue: settingsScreenController
                            .regularRaiudMonitoringToggle.value,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
