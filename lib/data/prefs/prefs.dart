
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String token = "token";
  static const String refreshToken = "refresh_token";
  static const String userName = 'username';
  static const String password = 'password';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String hotelName = 'hotel_name';
  static const String hotelCity = 'hotel_city';
  static const String hotelCountry = 'hotel_country';
  static const email = 'email';
  static const isNewUser = 'is_new_user';

  static Future<bool> clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> getIsNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNewUser) ?? true;
  }

  static Future setIsNewUser(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isNewUser, val);
  }

  static setUserName(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userName, val);
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }

  static setPassword(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(password, val);
  }

  static Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(password);
  }

  static setFirstName(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(firstName, val);
  }

  static Future<String?> getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(firstName);
  }

  static setLastName(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(lastName, val);
  }

  static Future<String?> getLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastName);
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(email);
  }

  static Future setEmail(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(email, val);
  }

  static Future<String?> getHotelName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hotelName);
  }

  static Future setHotelName(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(hotelName, val);
  }

  static Future<String?> getHotelCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hotelCity);
  }

  static Future setHotelCity(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(hotelCity, val);
  }

  static Future<String?> getHotelCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hotelCountry);
  }

  static Future setHotelCountry(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(hotelCountry, val);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }

  static Future setToken(String tok) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(token, tok);
  }

  static Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshToken);
  }

  static Future setRefreshToken(String reftok) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(refreshToken, reftok);
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}