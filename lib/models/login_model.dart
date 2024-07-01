class LoginModel {
  String? refresh;
  String? access;

  LoginModel({this.refresh, this.access});

  LoginModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }
}
