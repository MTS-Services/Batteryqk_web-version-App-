class Urls {
  static const String _baseUrl = "https://backend.batteryqk.com/api";
  static  String userCreate = "$_baseUrl/users";
  static  String userLogin = "$_baseUrl/users/login";

  //----------------------user get -------------------------//
  static String getAllUser = "$_baseUrl/users/self";
  static String showAllListing = "$_baseUrl/listings?limit=1000";
  static String booking = "$_baseUrl/bookings";
}
