// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

List<GameModel> gameModelFromJson(String str) =>
    List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));

String gameModelToJson(List<GameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Modelo de datos para formatear la información base de un juego
class GameModel {
  GameModel({
    this.id = 0,
    this.title = "",
    this.thumbnail = "",
    this.shortDescription = "",
    this.gameUrl = "",
    this.genre = "",
    this.platform = "",
    this.publisher = "",
    this.developer = "",
    this.releaseDate,
    this.freetogameProfileUrl = "",
  });

  int id;
  String title;
  String thumbnail;
  String shortDescription;
  String gameUrl;
  String genre;
  String platform;
  String publisher;
  String developer;
  DateTime? releaseDate;
  String freetogameProfileUrl;

  /// Construye un objeto GameModel a partir de un json o MAP
  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        title: json["title"] ?? "",
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
      );

  /// Transforma el objeto a formato JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "freetogame_profile_url": freetogameProfileUrl,
      };
}
