
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recharge_app/features/login/data/models/user_model.dart';
import '../constants/key_constants.dart';
import 'hive/hive_service.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  late FlutterSecureStorage secureStorage;

  int _userID = 0;
  bool _isVerified = true;
  String _userName = '';
  int _balance = 0;

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

    _userID = await secureStorage.getInt(KeyConstants.keyUserId) ?? _userID;
    _isVerified = await secureStorage.getBool(KeyConstants.keyIsVerified) ?? _isVerified;
    _userName = await secureStorage.getString(KeyConstants.keyUserName) ?? _userName;
    _balance = await secureStorage.getInt(KeyConstants.keyBalance) ?? _balance;

  }

  void update(VoidCallback callback) {
    callback();
  }

  int get userID => _userID;



  set userID(int value) {
    _userID = value;
    secureStorage.setInt(KeyConstants.keyUserId, value);
  }

  bool get isVerified => _isVerified;
  set isVerified(bool value) {
    _isVerified = value;
    secureStorage.setBool(KeyConstants.keyIsVerified, value);
  }

  void deleteLoggedInUserID() {
    secureStorage.delete(key: KeyConstants.keyUserId);
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    secureStorage.setString(KeyConstants.keyUserName, value);
  }


  int get balance => _balance;

  set balance(int value) {
    _balance = value;
    secureStorage.setInt(KeyConstants.keyBalance, value);
  }

  void deleteLoginProvider() {
    secureStorage.delete(key: KeyConstants.keyBalance);
  }

   storeUserData({
    required UserModel user
  }) {

    userName = user.name ?? "";
    userID = user.id ?? 0;
    isVerified = user.isVerified??false;
    balance = user.balance ?? 0;
  }

  Future<void> clearSession() async {
    await secureStorage.deleteAll();
    await HiveService().clearBoxes();
  }
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);

  Future<void> setString(String key, String value) async => await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';

  Future<void> setBool(String key, bool value) async => await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async => int.tryParse(await read(key: key) ?? '');

  Future<void> setInt(String key, int value) async => await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async => double.tryParse(await read(key: key) ?? '');

  Future<void> setDouble(String key, double value) async => await write(key: key, value: value.toString());

}
