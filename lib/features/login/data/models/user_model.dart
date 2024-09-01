import '../../domain/entity/user_entity.dart';

class UserModel {
  int? id;
  String? name;
  int? balance;
  bool? isVerified;


  UserModel(
      {
        this.id,
        this.name,
        this.balance,
        this.isVerified,

 });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['balance'] = balance;
    data['is_verified'] = isVerified;
    return data;
  }
}

extension UserDataModelExtension on UserModel {
  UserEntity get toUser => UserEntity(
      id:id,
      name:name,
      balance:balance,
      isVerified:isVerified,
  );
}