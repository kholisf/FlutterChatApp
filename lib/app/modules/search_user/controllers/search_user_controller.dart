import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:chat_aplikasi/app/data/models/chats_model.dart';
import 'package:chat_aplikasi/app/data/models/users_model.dart';
import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUserController extends GetxController {
  //TODO: Implement SearchUserController
  late TextEditingController searchC;
  final authC = Get.find<AuthController>();
  final count = 0.obs;
  // final autC =Get.find<AuthController>();
  var tempSearch = [].obs;
  var queryAwal = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void searchFriend(String data, String email) async {
    print("SEARCH : $data");

    if (data.isEmpty) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capitalized = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(capitalized);

      if (queryAwal.isEmpty && data.length == 1) {
        // fungsi yang akan dijalankan pada 1 huruf ketikan pertama
        CollectionReference users = firestore.collection("users");
        final keyNameResult =
            await users
                .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
                .where("email", isNotEqualTo: email)
                .get();

        print("TOTAL DATA : ${keyNameResult.docs.length}");
        if (keyNameResult.docs.isNotEmpty) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
          print("QUERY RESULT : ");
          print(queryAwal);
        } else {
          print("TIDAK ADA DATA");
        }
      }

      if (queryAwal.isNotEmpty) {
        tempSearch.value = [];
        for (var element in queryAwal) {
          if (element["name"].startsWith(capitalized)) {
            tempSearch.add(element);
          }
        }
      }
    }

    queryAwal.refresh();
    tempSearch.refresh();
  }


  Future<void> searchUser(String query) async {
    print("Search Data :$query");
    print("Email :${authC.user.value.email?? ""}");
    if (query.isEmpty) {
      queryAwal.value = [];
      tempSearch.value = [];
      return;
    }

    var toUpper = query.substring(0, 1).toUpperCase() + query.substring(1);
    print(toUpper);

    if (queryAwal.isEmpty && query.length == 1) {
      CollectionReference users = firestore.collection('users');

      final keyName =
          await users
              .where("keyName", isEqualTo: toUpper)
              .where("email", isNotEqualTo: authC.user.value.email?? "")
              .get();
      // for (var element in value.docs) {
      //   tempSearch.add(element.data());
      // }
      print("Total Data : ${keyName.docs.length}");

      if (keyName.docs.isNotEmpty) {
        for (var action in keyName.docs) {
          print(action.data());

          queryAwal.add(action.data() as Map<String, dynamic>);
        }

        // for (var i = 0; i < keyName.docs.length; i++) {

        //   queryAwal.add(keyName.docs[i].data() as Map<String,dynamic>);

        // }
        // print("Query result");
        // print(queryAwal);
      } else {
        print("Data Tidak ada");
      }
    }

    print("Tidak Empty ? : ${queryAwal.isNotEmpty}");
    print("Tidak Empty ? : ${queryAwal.value.length}");

    if (queryAwal.isNotEmpty) {
      tempSearch.value = [];

      for (var dataa in queryAwal) {
        if ((dataa["name"].toString().substring(0, 1).toUpperCase() +
                dataa["name"].toString().substring(1))
            .startsWith(toUpper)) {
          tempSearch.add(dataa);
        }
      }
      print("Tidak Empty  tempsearch? : ${tempSearch.isNotEmpty}");
      print("jumlah  tempsearch? : ${tempSearch.value.length}");
    }
    queryAwal.refresh();
    tempSearch.refresh();
  }


  @override
  void onInit() {
    super.onInit();
    searchC = TextEditingController();
  }

  @override
  void onClose() {
    searchC.dispose();
  }

  void increment() => count.value++;


  void addNewConnection (String emailPenerima,Map<String,dynamic> isidata)async{
String date = DateTime.now().toIso8601String();


CollectionReference chats = firestore.collection("chats");
CollectionReference users = firestore.collection("users");




await chats.doc(authC.user.value.email).set({"connections":[
authC.user.value.email,
emailPenerima

], "chat":[]});
await users.doc(authC.user.value.email).update({"chats":[

  {"connection":emailPenerima,
  "chat_id": chats.id,
  "lastTime":date,
  "total_unread":0
  
  }
]});

authC.user.update((uM){

  authC.user.value.chats =[

    ChatsUser(
      chatId: chats.id,
      connection: emailPenerima,
      lastTime: date,
      totalUnread: 0

    )
  ];

});

authC.user.refresh();

 Get.offNamed(Routes.CHAT_ROOM ,arguments: isidata);    
  }
}
