  import 'dart:convert';

  NutritionModel nutritionModelFromJson(String str) => NutritionModel.fromJson(json.decode(str));

  String nutritionModelToJson(NutritionModel data) => json.encode(data.toJson());

  class NutritionModel {
      final List<Nutrition> nutritions;
      final int totalNutritions;

      NutritionModel({
          required this.nutritions,
          required this.totalNutritions,
      });

      factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
          nutritions: List<Nutrition>.from(json["nutritions"].map((x) => Nutrition.fromJson(x))),
          totalNutritions: json["total_nutritions"],
      );

      Map<String, dynamic> toJson() => {
          "nutritions": List<dynamic>.from(nutritions.map((x) => x.toJson())),
          "total_nutritions": totalNutritions,
      };
  }

  class Nutrition {
      final String namaMakanan;
      final String namaGambar;
      final String urlGambar;
      final int kalori;
      final int protein;
      final int karbo;
      final int lemak;
      final String judulDeskripsi;
      final String isiDeskripsi;
      final int id;
      final DateTime createdAt;
      final User user;

      Nutrition({
          required this.namaMakanan,
          required this.namaGambar,
          required this.urlGambar,
          required this.kalori,
          required this.protein,
          required this.karbo,
          required this.lemak,
          required this.judulDeskripsi,
          required this.isiDeskripsi,
          required this.id,
          required this.createdAt,
          required this.user,
      });

      factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
          namaMakanan: json["nama_makanan"],
          namaGambar: json["nama_gambar"],
          urlGambar: json["url_gambar"],
          kalori: json["kalori"],
          protein: json["protein"],
          karbo: json["karbo"],
          lemak: json["lemak"],
          judulDeskripsi: json["judul_deskripsi"],
          isiDeskripsi: json["isi_deskripsi"],
          id: json["id"],
          createdAt: DateTime.parse(json["created_at"]),
          user: User.fromJson(json["user"]),
      );

      Map<String, dynamic> toJson() => {
          "nama_makanan": namaMakanan,
          "nama_gambar": namaGambar,
          "url_gambar": urlGambar,
          "kalori": kalori,
          "protein": protein,
          "karbo": karbo,
          "lemak": lemak,
          "judul_deskripsi": judulDeskripsi,
          "isi_deskripsi": isiDeskripsi,
          "id": id,
          "created_at": createdAt.toIso8601String(),
          "user": user.toJson(),
      };
  }

  class User {
      final String username;
      final String nik;
      final String role;
      final int id;
      final DateTime createdAt;

      User({
          required this.username,
          required this.nik,
          required this.role,
          required this.id,
          required this.createdAt,
      });

      factory User.fromJson(Map<String, dynamic> json) => User(
          username: json["username"],
          nik: json["nik"],
          role: json["role"],
          id: json["id"],
          createdAt: DateTime.parse(json["created_at"]),
      );

      Map<String, dynamic> toJson() => {
          "username": username,
          "nik": nik,
          "role": role,
          "id": id,
          "created_at": createdAt.toIso8601String(),
      };
  }
