class UserModel {
  String? uid;
  String? email;
  String? username;
  String? number;

  UserModel({
    this.uid,
    this.email,
    this.username,
    this.number,
  });

  //get data from the server
  factory UserModel.fromJson(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      number: map['number'],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'number': number,
    };
  }
}
