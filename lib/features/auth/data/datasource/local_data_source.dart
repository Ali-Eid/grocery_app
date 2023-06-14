import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cachedToken(String token);
  Future<String> getToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<void> cachedToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  @override
  Future<String> getToken() async {
    if (sharedPreferences.getString('token') != null) {
      return sharedPreferences.getString('token')!;
    } else {
      return 'null';
    }
  }
}
