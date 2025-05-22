import 'package:get/get.dart';

import '../models/user_m_model.dart';

class UserMProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return UserM.fromJson(map);
      if (map is List) return map.map((item) => UserM.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<UserM?> getUserM(int id) async {
    final response = await get('userm/$id');
    return response.body;
  }

  Future<Response<UserM>> postUserM(UserM userm) async =>
      await post('userm', userm);
  Future<Response> deleteUserM(int id) async => await delete('userm/$id');
}
