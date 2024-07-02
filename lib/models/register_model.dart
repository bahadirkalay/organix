class RegisterModel {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;

  RegisterModel(
      {this.id, this.username, this.firstName, this.lastName, this.email});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
}
