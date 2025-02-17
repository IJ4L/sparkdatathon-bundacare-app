import 'dart:convert';

PredictModel predictModelFromJson(String str) =>
    PredictModel.fromJson(json.decode(str));

String predictModelToJson(PredictModel data) => json.encode(data.toJson());

class PredictModel {
  final String imageName;
  final String imageUrl;
  final Data data;

  PredictModel({
    required this.imageName,
    required this.imageUrl,
    required this.data,
  });

  factory PredictModel.fromJson(Map<String, dynamic> json) => PredictModel(
        imageName: json["image_name"],
        imageUrl: json["image_url"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "image_name": imageName,
        "image_url": imageUrl,
        "data": data.toJson(),
      };
}

class Data {
  final int kalori;
  final int protein;
  final int karbo;
  final int lemak;
  final String judulDeskripsi;
  final String isiDeskripsi;

  Data({
    required this.kalori,
    required this.protein,
    required this.karbo,
    required this.lemak,
    required this.judulDeskripsi,
    required this.isiDeskripsi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        kalori: json["kalori"],
        protein: json["protein"],
        karbo: json["karbo"],
        lemak: json["lemak"],
        judulDeskripsi: json["judul_deskripsi"],
        isiDeskripsi: json["isi_deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "kalori": kalori,
        "protein": protein,
        "karbo": karbo,
        "lemak": lemak,
        "judul_deskripsi": judulDeskripsi,
        "isi_deskripsi": isiDeskripsi,
      };
}
