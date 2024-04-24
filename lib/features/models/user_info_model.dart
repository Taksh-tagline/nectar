class UserInfoModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? address;
  String? city;
  String? state;
  String? phoneNumber;

  UserInfoModel(
      {this.uid,
      this.name,
      this.email,
      this.password,
      this.address,
      this.state,
      this.city,
      this.phoneNumber});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      state: json['state'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'password': password,
        'address': address,
        'state': state,
        'city': city,
        'phoneNumber': phoneNumber,
      };
}
