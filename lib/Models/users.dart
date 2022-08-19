class UserModel {
  String? uid;
  String? number;

  UserModel({
    this.uid,
    this.number,
  });

  //get data from the server
  factory UserModel.fromJson(map) {
    return UserModel(
      uid: map['uid'],
      number: map['number'],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'number': number,
    };
  }
}
