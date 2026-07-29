class UserEntity {
  MessageEntity message;

  UserEntity({required this.message});
}

class MessageEntity {
  String sId = "";
  String name = "";
  String phone = "";
  String email = "";
  String address = "";
  String image = "";

  MessageEntity({
    required this.sId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });
  
}
