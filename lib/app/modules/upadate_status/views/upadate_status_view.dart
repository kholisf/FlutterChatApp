import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upadate_status_controller.dart';

class UpadateStatusView extends GetView<UpadateStatusController> {
  const UpadateStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upadate Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.statusC,
              decoration: InputDecoration(
                labelText: 'Status',
                hintText: 'Enter your status here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red[900]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red[900]!),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
