import 'dart:convert';
import 'dart:io';

import 'package:bundacare/data/local_storage.dart';
import 'package:bundacare/data/models/chat_model.dart';
import 'package:bundacare/data/models/login_model.dart';
import 'package:bundacare/data/models/nutrition_model.dart';
import 'package:bundacare/data/models/predict_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final dio = Dio();
  final String baseUrl = '';
  final LocalStorage localStorage = LocalStorage.instance;

  Future<bool> autoLogin() async {
    final token = await localStorage.getTokenFromSharedPreferences();
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      await localStorage.removeTokenFromSharedPreferences();
      return false;
    } catch (e) {
      return true;
    }
  }

  Future<bool> login(String user, String pass) async {
    try {
      final response = await dio.post(
        '$baseUrl/login',
        data: {
          'username': user,
          'password': pass,
        },
        options: optionsXxxFromUrlencoded(),
      );

      debugPrint('response: ${response.statusCode}');
      if (response.statusCode != 200) {
        return false;
      }

      LoginModel loginModel = LoginModel.fromJson(response.data);
      await localStorage.saveTokenToSharedPreferences(loginModel.accessToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<NutritionModel> getNutrition() async {
    final token = await localStorage.getTokenFromSharedPreferences();
    final response = await dio.get(
      '$baseUrl/nutritions',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    NutritionModel nutritionModel = NutritionModel.fromJson(response.data);
    return nutritionModel;
  }

  Future<NutritionModel> getNutritionByDate(String date) async {
    debugPrint('date: $date');
    final token = await localStorage.getTokenFromSharedPreferences();
    final response = await dio.get(
      '$baseUrl/nutritions/date/$date',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    NutritionModel nutritionModel = NutritionModel.fromJson(response.data);
    return nutritionModel;
  }

  Future<PredictModel> getPredict(File? imageFile) async {
    final token = await localStorage.getTokenFromSharedPreferences();

    if (imageFile == null) {
      throw Exception("No image selected");
    }

    String fileName = imageFile.path.split('/').last;

    if (!fileName.toLowerCase().endsWith('.jpg') &&
        !fileName.toLowerCase().endsWith('.jpeg') &&
        !fileName.toLowerCase().endsWith('.png')) {
      throw Exception('The file must be an image (JPEG/PNG)');
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/predict'),
    );

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    var file = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: fileName,
      contentType: DioMediaType.parse('image/jpeg'),
    );
    request.files.add(file);

    try {
      var response = await request.send();

      final responseBody = await http.Response.fromStream(response);

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response data: ${responseBody.body}');

      if (response.statusCode == 200) {
        PredictModel predictModel =
            PredictModel.fromJson(json.decode(responseBody.body));
        return predictModel;
      } else {
        throw Exception(
          'Failed to load prediction. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
      throw Exception('Error uploading image: $e');
    }
  }

  Future<bool> storeFood(String namaMakanan, PredictModel model) async {
    String url = 'http://34.101.248.218/nutritions/';

    Map<String, dynamic> data = {
      "nama_makanan": "Nasi Pink",
      "nama_gambar": model.imageUrl,
      "url_gambar": model.imageUrl,
      "kalori": model.data.kalori,
      "protein": model.data.protein,
      "karbo": model.data.karbo,
      "lemak": model.data.lemak,
      "judul_deskripsi": "",
      "isi_deskripsi": "",
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${await localStorage.getTokenFromSharedPreferences()}',
        },
        body: jsonEncode(data),
      );

      debugPrint('Response status code: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<ChatModel> chat(String text) async {
    String url = 'http://34.101.248.218/chat';

    Map<String, dynamic> pesan = {
      "text": text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${await localStorage.getTokenFromSharedPreferences()}',
        },
        body: jsonEncode(pesan),
      );

      debugPrint('Response status code: ${response.body}');

      if (response.statusCode == 200) {
        return ChatModel.fromJson(jsonDecode(response.body));
      } else {
        return ChatModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return ChatModel.fromJson({
        "user_prompt": {
          "text": "Error",
          "created_at": DateTime.now().toIso8601String(),
        },
        "bot_response": {
          "text": "Error",
          "created_at": DateTime.now().toIso8601String(),
        },
      });
    }
  }
}

Options optionsXxxFromUrlencoded() {
  return Options(
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
}
