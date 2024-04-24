import 'package:nectar/features/const/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getSharedPreferencesInstance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  // on Boarding
  static Future<void> setOnBoardingStatus(bool status) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setBool(KeyConst.isVisitOnBoardingKey, status).then((value) {
      print(value);
      print("Success to store the status");
    });
  }

  static Future<bool?> getOnBoardingStatus() async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    bool? result = instance.getBool(KeyConst.isVisitOnBoardingKey);
    return result;
  }

  // login & sign up

  static Future<void> setUserLoggedInStatus(bool status) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setBool(KeyConst.isUserLoggedIn, status).then((value) {
      print(value);
      print(" User Logged In successfully...");
    });
  }

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    bool? result = instance.getBool(KeyConst.isUserLoggedIn);
    return result;
  }

  static Future<void> setUserName(String value) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setString(KeyConst.userName, value).then((value) {
      print(value);
      print(" User Name: $value");
    });
  }

  static Future<void> setUserEmail(String value) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setString(KeyConst.userEmail, value).then((value) {
      print(value);
      print(" User Email: $value");
    });
  }

  static Future<void> setUserPassword(String value) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setString(KeyConst.userPassword, value).then((value) {
      print(value);
      print(" User password: $value");
    });
  }

  // store user data to firebase
  static Future<void> setUserUid(String value) async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    instance.setString(KeyConst.userId, value).then((value) {
      print(value);
      print(" User uid: $value");
    });
  }

  static Future<String?> getUserUid() async {
    SharedPreferences instance =
        await SharedPreferencesHelper.getSharedPreferencesInstance();
    return instance.getString(KeyConst.userId);
  }
}
