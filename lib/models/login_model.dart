class LoginModel {
  String? refresh;
  String? access;
  User? user;

  LoginModel({this.refresh, this.access, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  User({this.username, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
}
