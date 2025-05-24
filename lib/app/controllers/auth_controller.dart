import 'package:chat_aplikasi/app/data/models/chats_model.dart';
import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:chat_aplikasi/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/models/users_model.dart';

class AuthController extends GetxController {
  var isSkipInto = false.obs;
  var isAuth = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserCredential? userCredential;
    GoogleSignInAccount? _currentUser;
  late final FirebaseAuth authApp;
  //  GoogleSignInAccount? _currentUser;

  FirebaseApp? appFirebase;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  var user = UsersModel().obs;  
  var chatModel = ChatsModel().obs;  

   
  Future<void> firshInitialized() async {
    
    await skipIntro().then((onValue) {

      if (onValue){
      isSkipInto.value = true;}


      print("Hasil Skip intro : $onValue");
    }
    
    );
    await autoLogin().then((onValue) {
      isAuth.value = onValue;
    }).onError( (error, stackTrace) {
      print("Error auto login");
      print(error);
    });

print("jalan di bawah");

print(isAuth.value);

Future.delayed(Duration(seconds: 3));
    // authApp = await  FirebaseAuth.instance;
    // if (kDebugMode) {
    //   try {
    //     //  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    //     //   await authApp.useAuthEmulator('localhost', 9099);
    //   } catch (e) {
    //     // ignore: avoid_print
    //     print(e);
    //   }
    // }

    // print("CHEK isis -===============");
    // print(isSkipInto.value);
    // print(isAuth.value);

    //   try {

    // _googleSignIn.isSignedIn().then((value) {
    //   if (value){
    //     isAuth.value =value;
    //   isSkipInto. value=value;
    //   }
    //   else{
    //     isAuth.value = false;

    //   }});
    //    } catch (e) {

    //      print(e);
    //    }
  }

  Future<bool> skipIntro() async {
    GetStorage box = GetStorage();
    if (box.read("skipIntro") != null || box.read("skipIntro") == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> autoLogin() async {
//     try {
//       final bool isLogin = await _googleSignIn.isSignedIn();

  



// if (isLogin){

//   await _googleSignIn
//             .signInSilently()
//             .then((value) => _currentUser = value);

    
//         final googleAuth = await _currentUser!.authentication;

//         final credential = GoogleAuthProvider.credential(
//           idToken: googleAuth.idToken,
//           accessToken: googleAuth.accessToken,
//         ); 
//          await FirebaseAuth.instance
//             .signInWithCredential(credential)
//             .then((value) => userCredential = value);

//         print("USER CREDENTIAL");
//         print(userCredential);

//         // masukan data ke firebase...
//         CollectionReference users = firestore.collection('users');

//         await users.doc(_currentUser!.email).update({
//           "lastSignInTime":
//               userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
//         });

//         final currUser = await users.doc(_currentUser!.email).get();
//         final currUserData = currUser.data() as Map<String, dynamic>;

//         user(UsersModel.fromJson(currUserData));

//         user.refresh();

//         // final listChats =
//         //     await users.doc(_currentUser!.email).collection("chats").get();

// //  if (listChats.docs.length != 0) {
// //           List<ChatUser> dataListChats = [];
// //           listChats.docs.forEach((element) {
// //             var dataDocChat = element.data();
// //             var dataDocChatId = element.id;
// //             dataListChats.add(ChatUser(
// //               chatId: dataDocChatId,
// //               connection: dataDocChat["connection"],
// //               lastTime: dataDocChat["lastTime"],
// //               total_unread: dataDocChat["total_unread"],
// //             ));
// //           });

// //           user.update((user) {
// //             user!.chats = dataListChats;
// //           });
// //         } else {
// //           user.update((user) {
// //             user!.chats = [];
// //           });
// //         }

//         user.refresh();
//         return true;

// }



//       return false;



      
//     } catch (e) {
//       print(e);
//       return false;
//     }

  // kita akan mengubah isAuth => true => autoLogin
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // masukan data ke firebase...
        CollectionReference users = firestore.collection('users');

        await users.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        // final listChats =
        //     await users.doc(_currentUser!.email).collection("chats").get();

        // if (listChats.docs.length != 0) {
        //   List<ChatUser> dataListChats = [];
        //   listChats.docs.forEach((element) {
        //     var dataDocChat = element.data();
        //     var dataDocChatId = element.id;
        //     dataListChats.add(ChatUser(
        //       chatId: dataDocChatId,
        //       connection: dataDocChat["connection"],
        //       lastTime: dataDocChat["lastTime"],
        //       total_unread: dataDocChat["total_unread"],
        //     ));
        //   });

        //   user.update((user) {
        //     user!.chats = dataListChats;
        //   });
        // } else {
        //   user.update((user) {
        //     user!.chats = [];
        //   });
        // }

        user.refresh();

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> login() async {
 try {
      // Ini untuk handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      // Ini digunakan untuk mendapatkan google account
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      // ini untuk mengecek status login user
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // kondisi login berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // simpan status user bahwa sudah pernah login & tidak akan menampilkan introduction kembali
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        // masukan data ke firebase...
        CollectionReference users = firestore.collection('users');

        final checkuser = await users.doc(_currentUser!.email).get();

        if (checkuser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl ?? "noimage",
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
            "chats":[],
          });

          users.doc(_currentUser!.email).collection("chats");
        } else {
          await users.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        // final listChats =
        //     await users.doc(_currentUser!.email).collection("chats").get();

        // if (listChats.docs.length != 0) {
        //   List<ChatUser> dataListChats = [];
        //   listChats.docs.forEach((element) {
        //     var dataDocChat = element.data();
        //     var dataDocChatId = element.id;
        //     dataListChats.add(ChatUser(
        //       chatId: dataDocChatId,
        //       connection: dataDocChat["connection"],
        //       lastTime: dataDocChat["lastTime"],
        //       total_unread: dataDocChat["total_unread"],
        //     ));
        //   });

        //   user.update((user) {
        //     user!.chats = dataListChats;
        //   });
        // } else {
        //   user.update((user) {
        //     user!.chats = [];
        //   });
        // }

        // user.refresh();

        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }



//     try {
//       await _googleSignIn.signIn().then((onValue) => _currentUser = onValue);


//      await _googleSignIn.signOut();
//       print("After signIn");
//       print(_currentUser);

//       await _googleSignIn.isSignedIn().then((value) async {
//         if (value) {
//           final googleAuth = await _currentUser!.authentication;

//           final creadential = GoogleAuthProvider.credential(
//             accessToken: googleAuth.accessToken,
//             idToken: googleAuth.idToken,
//           );

//           await authApp
//               .signInWithCredential(creadential)
//               .then((onValue) => userCredential = onValue);
//           print("User credential =====");
//           print(userCredential);

//           GetStorage box = GetStorage();
//           box.write("skipIntro", true);
//           box.write("dataUser", {
//             "photoURL": userCredential!.user!.photoURL,
//             "displayName": userCredential!.user!.displayName,
//             "email":userCredential!.user!.email,
//             "uid":userCredential!.user!.uid,
            
//           });



// // print("==========================================++SAMPE SININ++==================================");
// // print(userCredential!.user!.displayName!);
// // FirebaseFirestore.instance.collection(_currentUser!.email).add({
// //             "photoUrl": userCredential!.user!.photoURL,
// //             "displayName": userCredential!.user!.displayName,
// //             "email":userCredential!.user!.email,
// //             "uid":userCredential!.user!.uid,
// //             "creationTime":userCredential!.user!.metadata.creationTime,
// //             "lastSignInTime":userCredential!.user!.metadata.lastSignInTime,
// //             "updateTime":DateTime.now().toIso8601String(),
// //           });
//           isAuth.value = value;

//           Get.offAllNamed(Routes.HOME, arguments: {});
//         } else {
//           isAuth.value = false;
//         }
//       });
//     } catch (error) {
//       print("erorororor ");
//       print(error);
//     }

//     // isAuth.value = true;
  }

  Future<void> logout() async {

    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    isAuth.value = false;
    Get.offAllNamed(Routes.LOGIN);
  }


void changeProfile(String name, String status) async {
String datee =  DateTime.now().toIso8601String();
  
  try {
    CollectionReference users = firestore.collection('users');
    await users.doc(user.value.email).update({
      "name": name,
      "status": status,
      "updatedTime": datee,
      "keyName": name.substring(0, 1).toUpperCase(),
      
    });

    user.update((user) {
      user!.name = name;
      user.status = status;
      user.updatedTime =datee;
      user.keyName = name.substring(0, 1).toUpperCase();
    });

    user.refresh();

    await Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil mengubah profile",
      // onConfirm: () => Get.back(),
      // textConfirm: "OK",
    );
  } catch (e) {
    print(e);
  }


}

void updateStatus( String status) async {
  String datee =  DateTime.now().toIso8601String();
  try {
    CollectionReference users = firestore.collection('users');
    await users.doc(user.value.email).update({
      
      "status": status,
      "updatedTime": DateTime.now().toIso8601String(),
      
    });

    user.update((user) {
      
      user!.status = status;
      user.updatedTime =datee;
    });

    user.refresh();

    await Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil update status",
      // onConfirm: () => Get.back(),
      // textConfirm: "OK",
    );
  } catch (e) {
    print(e);
  }


}

}
