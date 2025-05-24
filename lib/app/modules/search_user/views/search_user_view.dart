import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_user_controller.dart';

class SearchUserView extends GetView<SearchUserController> {
  const SearchUserView({super.key});
  // final List<Widget> friends = List.generate(
  //   20,
  //   (index) => listTampilan(),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Search User'),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
            child: Align(
              alignment: Alignment.bottomCenter,

              child: TextField(
                controller: controller.searchC,
                onChanged: (value) => controller.searchUser(value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  hintText: 'Search',
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Icon(Icons.search, color: Colors.red[900]),
                  ),

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
      body:Obx(()=>
          controller.tempSearch.isEmpty
              ? Center(
                child: SizedBox(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: LottieBuilder.asset("assets/lottie/empty.json"),
                ),
              )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.tempSearch.length,
                  itemBuilder: (context, index) {
                    print(index);
                    print(controller.tempSearch[index]);

                    return listTampilan(index: index, isidata: controller.tempSearch[index] as Map<String,dynamic>,controller: controller,);
                  
                  },

              ),),



    );
  }
}

class listTampilan extends StatelessWidget {
  const listTampilan({
    super.key,
    required this.index,required this.isidata, required this.controller

  });

final SearchUserController controller ;
final int index;
final  Map<String,dynamic> isidata;
  @override
  Widget build(BuildContext context) {
    print(isidata);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            
                 NetworkImage(isidata["photoUrl"]),
                
        radius: 30,
      ),
      title: Text(
        isidata["name"],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        isidata["email"],
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      trailing: GestureDetector(
        onTap: ()=> controller.addNewConnection(isidata["email"], isidata),
        child: Chip(label: Text("Message"), backgroundColor: Colors.blue),
      ),
    );
  }

  
}
