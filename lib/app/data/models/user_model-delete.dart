class UserModelDeleteee {
  String? uid;
  String? name;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? photoUrl;
  String? status;
  String? updatedTime;
  String? keyName;

  UserModelDeleteee({
    this.uid,
    this.name,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.status,
    this.updatedTime,
    this.keyName,
  });

  UserModelDeleteee.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    updatedTime = json['updatedTime'];
    keyName = json['keyName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['photoUrl'] = photoUrl;
    data['status'] = status;
    data['updatedTime'] = updatedTime;
    data['keyName'] = keyName;
    return data;
  }
}
