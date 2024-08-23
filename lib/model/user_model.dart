import 'dart:typed_data';

class User {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String businessName;
  final String phoneNumber;
  final String address;
  final String businessType;
  final Uint8List? image; // Add image field

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.businessName,
    required this.phoneNumber,
    required this.address,
    required this.businessType,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'businessName': businessName,
      'phone': phoneNumber,
      'address': address,
      'businessType': businessType,
      'image': image, // Add image to map
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      businessName: map['businessName'],
      phoneNumber: map['phone'],
      address: map['address'],
      businessType: map['businessType'],
      image: map['image'], // Get image from map
    );
  }
}
