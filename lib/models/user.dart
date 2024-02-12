class UserModel {
  String? uid;
  String? email;
  String? name;
  String? pushToken; //if notification will be implemented in further updates

  UserModel({this.uid, this.email, this.name, this.pushToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    pushToken = json['pushToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['pushToken'] = pushToken;
    return data;
  }
}
