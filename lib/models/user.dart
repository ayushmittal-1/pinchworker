class UserModel {
  String? uid;
  String? email;
  String? name;
  String? pushToken;
  List<dynamic>? cars = [];

  UserModel({this.uid, this.email, this.name, this.pushToken, this.cars});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    pushToken = json['pushToken'];
    cars = json['cars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['pushToken'] = pushToken;
    data['cars'] = cars;
    return data;
  }
}
