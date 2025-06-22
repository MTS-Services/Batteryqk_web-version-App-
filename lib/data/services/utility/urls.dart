class Urls{
  static const String _baseUrl = "https://backend.batteryqk.com/api";
  static  String userCreate = "$_baseUrl/users";
  static  String userLogin = "$_baseUrl/users/login";
  static String showAllListing = "$_baseUrl/listings";

  //----------------------user get -------------------------//
  static String getAllUser = "$_baseUrl/users/self";
  static String getBooking = "$_baseUrl/bookings/user";
}