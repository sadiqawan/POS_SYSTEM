class User {
  final int? id;
  final String username;
  final String email;
  final String password;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ,
      username: map['username']?? '' , // Default to empty string if null
      email: map['email'] ,
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
