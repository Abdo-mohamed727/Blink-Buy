
import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';

class RegisterRequestDto {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;

  RegisterRequestDto({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name ?? '';
    data['phone'] = phone ?? '';
    data['email'] = email ?? '';
    data['password'] = password ?? '';
    data['confirmPassword'] = confirmPassword ?? '';
    return data;
  }

  RegisterRequestEntity toEntity(RegisterRequestEntity register) {
    return RegisterRequestEntity(
      name: name ?? '',
      email: email ?? '',
      phone: phone ?? '',
      password: password ?? '',
      confirmPassword: '',
    );
  }
}
