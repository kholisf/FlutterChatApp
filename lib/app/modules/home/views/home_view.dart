import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List<Widget> myChats =
      List.generate(
        20,
        (index) => ListTile(
          onTap:
              () => Get.toNamed(
                Routes.CHAT_ROOM,
                arguments:
                    (index + 1 >= 2 && index + 1 <= 13)
                        ? "https://reqres.in/img/faces/$index-image.jpg"
                        : "assets/logo/noimage.png",
              ),
          leading: CircleAvatar(
            backgroundImage:
                (index + 1 >= 2 && index + 1 <= 13)
                    ? NetworkImage(
                      "https://reqres.in/img/faces/$index-image.jpg",
                    )
                    : AssetImage("assets/logo/noimage.png"),
            radius: 30,
          ),
          title: Text(
            "User ${index + 1}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            "Last message from user ${index + 1}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          trailing: Chip(label: Text("2"), backgroundColor: Colors.blue),
        ),
      ).reversed.toList();
  @override
  Widget build(BuildContext context) {
    // GetStorage box = GetStorage();

    // print(box.read("dataUser")["photoURL"]);
    print(controller.dataArgument["photoURL"]);

    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5,

            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chats", style: TextStyle(fontSize: 25)),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    borderRadius: BorderRadius.circular(25),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(5),
                    // child: Icon(
                    //   Icons.person,
                    //   size: 40,
                    //   color: Colors.white,
                    // ),
                    child: Hero(
                      tag: "pp",
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          controller.dataArgument["photoURL"],
                        ),
                        radius: 20,
                      ),
                    ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) => myChats[index],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.SEARCH_USER),
        child: Icon(Icons.search_rounded, color: Colors.red[900]),
      ),
    );
  }
}
