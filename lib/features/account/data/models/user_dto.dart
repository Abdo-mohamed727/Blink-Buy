import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';

class UserDto {
  Message? message;

  UserDto({this.message});

  UserDto.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
  UserEntity toEntity(){
    return UserEntity(
      message: message?.toEntity() ?? MessageEntity(
        sId: "",
        name: "",
        phone: "",
        email: "",
        address: "",
        image: "",
      ),
    );
  }
}

class Message {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  Message(
      {this.sId, this.name, this.phone, this.email, this.address, this.image});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
  MessageEntity toEntity(){
    return MessageEntity(
      sId: sId ?? "",
      name: name ?? "",
      phone: phone ?? "",
      email: email ?? "",
      address: address ?? "",
      image: image ?? "",
    );
  }
}
