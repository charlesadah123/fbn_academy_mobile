// ignore_for_file: file_names, must_be_immutable, sized_box_for_whitespace, use_build_context_synchronously

import 'package:fbn_academy_mobile/common/Constants.dart';
import 'package:fbn_academy_mobile/controllers/DashboardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeAttendanceScreen extends StatelessWidget {
  TakeAttendanceScreen({super.key});

  DashboardController dashCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return dashCtrl.dashLoading.value
          ? SizedBox(
              height: Get.height * 0.4,
              child: Center(
                child: CircularProgressIndicator(
                    semanticsLabel: dashCtrl.currentTask.value,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(MyStyles.colorPrimary)),
              ))
          : Container(
              width: double.infinity,
              height: Get.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // close button
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFF003B65),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    // text row
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'What method would you like to use?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF003B65),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // face id button
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF003B65),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF003B65)),
                          borderRadius: BorderRadius.circular(29.50),
                        ),
                      ),
                      padding: const EdgeInsets.only(),
                      child: ElevatedButton(
                        onPressed: () async {
                          await dashCtrl.takeAttendance(AuthType.otp_password);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.5),
                            ),
                            backgroundColor: const Color(0xFF003B65),
                            minimumSize: const Size(10.0, 44.0)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.security, color: Color(0xFFF0BD2D)),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text(
                                'Otp and Password',
                                style: TextStyle(
                                  color: Color(0xFFF0BD2D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // fingerprint button
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x60162D4C)),
                          borderRadius: BorderRadius.circular(29.50),
                        ),
                      ),
                      padding: const EdgeInsets.only(),
                      child: ElevatedButton(
                        onPressed: () async {
                          await dashCtrl.takeAttendance(AuthType.biometric);

                          // Close the bottom sheet
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.5),
                            ),
                            backgroundColor: Colors.white,
                            minimumSize: const Size(10.0, 44.0)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fingerprint, color: Color(0x60162D4C)),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text(
                                'Biometric',
                                style: TextStyle(
                                  color: Color(0x60162D4C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
