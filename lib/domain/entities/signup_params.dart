class SignupParams {
  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String password2;
  final String hotelName;
  final String hotelCity;
  final String hotelCountry;

  SignupParams({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.password2,
    required this.hotelName,
    required this.hotelCity,
    required this.hotelCountry,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'password2': password2,
        'hotelName': hotelName,
        'hotelCity': hotelCity,
        'hotelCountry': hotelCountry
      };
}