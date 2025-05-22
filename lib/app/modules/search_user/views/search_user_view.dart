import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_user_controller.dart';

class SearchUserView extends GetView<SearchUserController> {
   SearchUserView({super.key});
final List<Widget> friends =
      List.generate(
        20,
        (index) => ListTile(
          
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
          trailing: GestureDetector(onTap: ()=>Get.offNamed(Routes.CHAT_ROOM),child: Chip(label: Text("Message"), backgroundColor: Colors.blue)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Search User'),
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
            child: Align(
              
              alignment: Alignment.bottomCenter,
              
              child: TextField(
                controller: controller.searchC,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 30),
                  hintText: 'Search',
                  suffixIcon:  InkWell(borderRadius: BorderRadius.circular(20), onTap: (){},child: Icon(Icons.search,color: Colors.red[900],)),

                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                      ),
            ),
          ),
      ),
      ),
      body:  ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, index) => friends[index],
      ),
    );
  }
}
