import 'user.dart';

class UserBean {
  String token;
  User user;

  UserBean({this.token, this.user});

  UserBean.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }

    return data;
  }

  @override
  String toString() {
    return 'UserBean{token: $token, user: $user}';
  }
}
