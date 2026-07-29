class LoginEntity {
  final String? message;
  final String? token;
  final UserEntity? user;

  LoginEntity({this.message, this.token, this.user});

}

class UserEntity {
  final String? name;
  final String? phone;
  final String? email;
  final String? role;
  final String? image;

  UserEntity({this.name, this.phone, this.email, this.role, this.image});

}