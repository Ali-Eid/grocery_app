import 'dart:convert';

import 'package:grocery_app/core/constants.dart';
import 'package:grocery_app/core/error/exciption.dart';
import 'package:grocery_app/features/auth/data/model/auth_model.dart';
import 'package:grocery_app/injection_container.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String mobile, String password);
  Future<AuthModel> signUp(String mobile, String password, String name);
  Future<VerifyModel> otpVerfiy(String otp);
}

Map<String, String>? headers = {
  "Accept": "application/json",
  "Content-Type": "application/json",
  "version": "1.0.0",
  "Authorization": 'Bearer ${sl<SharedPreferences>().getString('token')}',
};

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);
  @override
  Future<AuthModel> login(String mobile, String password) async {
    try {
      final response = await client.post(Uri.parse(baseUrl + EndPoints.login),
          headers: headers,
          body: json.encode({
            'mobile': mobile,
            'password': password,
          }));
      if (response.statusCode == 200) {
        final jsondecode = json.decode(response.body) as Map<String, dynamic>;
        print(jsondecode);
        final AuthModel model = AuthModel.fromJson(jsondecode);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> signUp(String mobile, String password, String name) async {
    try {
      final response =
          await client.post(Uri.parse(baseUrl + EndPoints.register),
              headers: headers,
              body: json.encode({
                'mobile': mobile,
                'password': password,
                'name': name,
              }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        final jsondecode = json.decode(response.body) as Map<String, dynamic>;
        final AuthModel model = AuthModel.fromJson(jsondecode);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<VerifyModel> otpVerfiy(String otp) async {
    try {
      final response = await client.post(
          Uri.parse(baseUrl + EndPoints.otpVerify),
          headers: headers,
          body: json.encode({"otp": otp}));
      print(response.body);
      print(response.headers);
      print(response.request?.headers ?? '');
      if (response.statusCode == 200) {
        final jsondecode = json.decode(response.body) as Map<String, dynamic>;
        print(jsondecode);
        final VerifyModel model = VerifyModel.fromJson(jsondecode);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
