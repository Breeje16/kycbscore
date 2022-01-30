class ApiConstants {
  ApiConstants._();

  static const String baseVersion1URL =
      'https://kycbscore.herokuapp.com/api/v1';
      
  static const String registerURL = '/auth/register/';
  static const String authTokenURL = '/auth/token/';
  static const String authRefreshTokenURL = '/auth/token/refresh/';

  static const String ratingPOST = '/addrating/';
  static const String customerGET = '/customer';
  static const String addCustomerURL = '/addcustomer/';
}