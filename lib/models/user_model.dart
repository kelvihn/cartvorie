class User {
  String id;
  String firstname;
  String lastname;
  String email;
  String password;
  String accountType;
  String token;
  String phoneNumber;
  bool auth;

//  String role;

  User(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.token,
      this.phoneNumber,
      this.password,
      this.accountType});

  User.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    accountType = jsonMap['account_type'];
    email = jsonMap['email'];
    firstname = jsonMap['firstname'];
    lastname = jsonMap['lastname'];
    phoneNumber = jsonMap['phone_number'];
    token = jsonMap['access_token'];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["account_type"] = accountType;
    map["email"] = email;
    map["access_token"] = token;
    map["phone_number"] = phoneNumber;
    map["first_name"] = firstname;
    map["last_name"] = lastname;
    return map;
  }

  @override
  String toString() {
    var map = this.toMap();
    map["auth"] = this.auth;
    return map.toString();
  }
}
