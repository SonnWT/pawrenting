import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawrentingreborn/features/mypets/models/PetModel.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNum;
  final String email;
  final String dob;
  final String password;
  final String username;
  final List<LocationModel> locations;
  final List<PetModel> pets;

  UserModel({
    required this.pets, 
    required this.dob,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNum,
    required this.username,
    this.locations = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNum': phoneNum,
      'email': email,
      'dob': dob,
      'password': password,
      'username': username,
      'locations': locations.map((e) => e.toJson()).toList(),
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) {
      print('User data is null');
      return UserModel(
        firstName: '',
        lastName: '',
        phoneNum: '',
        email: '',
        dob: '',
        password: '',
        username: '',
        locations: [],
        pets: [],
      );
    }
    return UserModel(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      phoneNum: data['phoneNum'] ?? '',
      email: data['email'] ?? '',
      dob: data['dob'] ?? '',
      password: data['password'] ?? '',
      username: data['username'] ?? '',
      locations: (data['locations'] as List<dynamic>? ?? [])
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pets: [],
    );
  }
}
