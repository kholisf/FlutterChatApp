class UsersModel {
  String? uid;
  String? name;
  String? keyName;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? photoUrl;
  String? status;
  String? updatedTime;
  List<ChatsUser>? chats;

  UsersModel({
    this.uid,
    this.name,
    this.keyName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.status,
    this.updatedTime,
    this.chats,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    keyName = json['keyName'];
    email = json['email'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    updatedTime = json['updatedTime'];
    if (json['chats'] != null) {
      chats = <ChatsUser>[];
      json['chats'].forEach((v) {
        chats?.add(ChatsUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['keyName'] = keyName;
    data['email'] = email;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['photoUrl'] = photoUrl;
    data['status'] = status;
    data['updatedTime'] = updatedTime;
    if (chats != null) {
      data['chats'] = chats?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatsUser {
  String? connection;
  String? chatId;
  String? lastTime;
  num? totalUnread;

  ChatsUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.totalUnread,
  });

  ChatsUser.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    chatId = json['chat_id'];
    lastTime = json['lastTime'];
    totalUnread = json['total_unread'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['connection'] = connection;
    data['chat_id'] = chatId;
    data['lastTime'] = lastTime;
    data['total_unread'] = totalUnread;
    return data;
  }
}


// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     String uid;
//     String name;
//     String keyName;
//     String email;
//     DateTime creationTime;
//     DateTime lastSignInTime;
//     String photoUrl;
//     String status;
//     DateTime updatedTime;
//     List<Chat> chats;

//     Welcome({
//         required this.uid,
//         required this.name,
//         required this.keyName,
//         required this.email,
//         required this.creationTime,
//         required this.lastSignInTime,
//         required this.photoUrl,
//         required this.status,
//         required this.updatedTime,
//         required this.chats,
//     });

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         uid: json["uid"],
//         name: json["name"],
//         keyName: json["keyName"],
//         email: json["email"],
//         creationTime: DateTime.parse(json["creationTime"]),
//         lastSignInTime: DateTime.parse(json["lastSignInTime"]),
//         photoUrl: json["photoUrl"],
//         status: json["status"],
//         updatedTime: DateTime.parse(json["updatedTime"]),
//         chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "name": name,
//         "keyName": keyName,
//         "email": email,
//         "creationTime": creationTime.toIso8601String(),
//         "lastSignInTime": lastSignInTime.toIso8601String(),
//         "photoUrl": photoUrl,
//         "status": status,
//         "updatedTime": updatedTime.toIso8601String(),
//         "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
//     };
// }

// class Chat {
//     String connection;
//     String chatId;
//     DateTime lastTime;
//     int totalUnread;

//     Chat({
//         required this.connection,
//         required this.chatId,
//         required this.lastTime,
//         required this.totalUnread,
//     });

//     factory Chat.fromJson(Map<String, dynamic> json) => Chat(
//         connection: json["connection"],
//         chatId: json["chat_id"],
//         lastTime: DateTime.parse(json["lastTime"]),
//         totalUnread: json["total_unread"],
//     );

//     Map<String, dynamic> toJson() => {
//         "connection": connection,
//         "chat_id": chatId,
//         "lastTime": lastTime.toIso8601String(),
//         "total_unread": totalUnread,
//     };
// }
