import 'package:dio/dio.dart';
import '../core/secure_storage.dart';
import '../models/User.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _api = ApiService();
}
  // Future<UserModel?> login(String email, String password) async {
  //   final response = await _api.post('/login', data: {
  //     'email': email,
  //     'password': password,
  //   });

  //   if (response.statusCode == 200) {
  //     final data = response.data;
  //     await TokenStorage.saveToken(data['token']);
  //     return UserModel.fromJson(data['user']);
  //   }
  //   return null;
  // }

//   Future<UserModel?> signup(Map<String, dynamic> userData) async {
//     final response = await _api.post('/signup', data: userData);

//     if (response.statusCode == 201) {
//       final data = response.data;
//       await TokenStorage.saveToken(data['token']);
//       return UserModel.fromJson(data['user']);
//     }
//     return null;
//   }

//   Future<void> logout() async {
//     await TokenStorage.clearToken();
//   }
// }
