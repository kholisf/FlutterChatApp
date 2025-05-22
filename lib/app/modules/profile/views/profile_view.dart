import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
   ProfileView({super.key});
final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(context.mediaQueryViewPadding.top + 20),  
        child: Container(
          

          padding: EdgeInsets.only(right: 10),
          child: AppBar(
                 iconTheme: const IconThemeData(
              color: Colors.black,
              
            ),
          backgroundColor: Colors.transparent,
            title:  Text('Profile',style: TextStyle(color: Colors.white),),
            centerTitle: true,
            actions: [IconButton(onPressed:()=> authC.logout() ,icon: Icon(Icons.logout,color: Colors.red[900],),tooltip: "Logout",)],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
          
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AvatarGlow(
                    startDelay: const Duration(milliseconds: 100),
                    glowColor: Colors.black,
                    glowShape: BoxShape.circle,
                    animate: true,
                    curve: Curves.linear,
                    // glowBorderRadius: BorderRadius.circular(100),
                    glowCount: 1,
                    glowRadiusFactor: 0.2,
                    
                    child: Hero(
                      tag: "pp",
                      child: Container(
                        
                                
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width * 0.4 / 2),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(controller.dataArgument["photoURL"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("LoremIpsum@gmail.com", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),

              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.arrow_right),
                    title: Text("Update Status",style: TextStyle(
                        fontSize: 18,)),
                    leading: Icon(Icons.note_add_outlined),
                    onTap: () => Get.toNamed(Routes.UPADATE_STATUS),
                  ),
                  ListTile(
                    onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                    trailing: Icon(Icons.arrow_right),
                    title: Text("Change Profile",style: TextStyle(
                        fontSize: 18,)),
                    leading: Icon(Icons.person),
                  ),
                  ListTile(
                    trailing: Text(
                      "Light",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text("Change Theme",style: TextStyle(
                        fontSize: 18,)),
                    leading: Icon(Icons.lens),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom +10),

            child: Column(
              children: [
                Text("Chat App", style: TextStyle(fontSize: 15)),
                Text("v1.0", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
