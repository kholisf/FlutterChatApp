import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.mediaQueryPadding.top + 10), 
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          color:   Colors.red[900],
          child: AppBar(
            title: Text(
              'Change Profile',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor:Colors.transparent,
            centerTitle: true,
            actions: [IconButton(onPressed: ()=> controller.authC.changeProfile(controller.nameC.text, controller.statusC.text), icon: Icon(Icons.save, size: 20, color: Colors.white))],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: Get.width,
              // height: Get.width * 0.5,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   color: Colors.red[900],
              // ),
              child: Center(
                child: Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width / 2),

                    color: Colors.red[900],
                  ),
                  child: Icon(Icons.person, size: 100, color: Colors.white),
                ),
              ),
            ),
            TextField(
              controller: controller.emailC,
              readOnly: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email here',
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
            SizedBox(height: 15),
            TextField(
              controller: controller.nameC,
              textInputAction: TextInputAction.next,  
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name here',
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
            SizedBox(height: 15),
            TextField(
              controller: controller.statusC,
              textInputAction: TextInputAction.done,  
              onEditingComplete: (){
                
                controller.authC.changeProfile(controller.nameC.text, controller.statusC.text);
              },
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "imageini.png",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text("Choose", style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Choose",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 20),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () => controller.authC.changeProfile(
                   controller.nameC.text,
                   controller.statusC.text,
                ),

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
