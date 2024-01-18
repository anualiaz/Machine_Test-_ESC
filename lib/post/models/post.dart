import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String job;
  final String gender;
  final String city;
  final String zipcode;
  final String profilePicture;
  final String email;
  final String phone;
  final String street;
  final String state;
  final String country;
  final double latitude;
  final double longitude;

  Post({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.job,
    required this.gender,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.email,
    required this.phone,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.profilePicture,
    required this.street
  });

  factory Post.fromJson(dynamic json) {
    return Post(
      id: json["id"],
      lastName: json["last_name"],
      firstName: json["first_name"],
      dateOfBirth: json["date_of_birth"],
      job: json["job"],
      gender: json["gender"],
      city: json["city"],
      country: json["country"],
      zipcode: json["zipcode"],
      email: json["email"],
      phone: json["phone"],
      state: json["state"],
      street: json["street"],
      profilePicture: json["profile_picture"],
      latitude: json["latitude"],
      longitude: json["longitude"]
    );
  }

  @override
  List<Object?> get props => [id, lastName, firstName, email, phone, profilePicture, dateOfBirth, job, 
  gender, city, country, zipcode, state, street, latitude, longitude ];
}