import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';

class LoginDto {
  String? message;
  String? token;
  User? user;

  LoginDto({this.message, this.token, this.user});

  LoginDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
  LoginEntity toEntity() {
  return LoginEntity(
    message: message,
    token: token,
    user: user?.toEntity(),
  );
}
}



class User {
  String? name;
  String? phone;
  String? email;
  String? role;
  String? image;

  User({
    this.name,
    this.phone,
    this.email,
    this.role,
    this.image,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'image': image,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      phone: phone,
      email: email,
      role: role,
      image: image,
    );
  }
}