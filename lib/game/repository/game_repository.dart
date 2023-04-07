import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:game_book/home/models/game_data.dart';
import 'package:game_book/home/models/game_model.dart';
import 'package:http/http.dart' as http;

const String host = "https://www.freetogame.com/api/";

// Metodo para obtener la lista información base de todos los juegos
Future<List<GameModel>> getListGame() async {
  try {
    var route = host + "games";
    var uri = Uri.parse(route);
    var res = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    });
    print(res.body);
    return gameModelFromJson(res.body);
  } catch (e) {
    if (kDebugMode) {
      print("Ocurrio un error al traer la información de los juegos");
      print(e);
    }
    return [];
  }
}

Future<List<GameModel>> getListSlide() async {
  try {
    var route = host + "games?sort-by=popularity";
    var uri = Uri.parse(route);
    var res = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    });
    print(res.body);
    return gameModelFromJson(res.body);
  } catch (e) {
    if (kDebugMode) {
      print("Ocurrio un error al traer la información de los juegos");
      print(e);
    }
    return [];
  }
}

Future<List<GameModel>> getListGameVDio() async {
  try {
    var route = host + "games";
    var dio = Dio();
    var res = await dio.get(route);

    return (res.data as List).map((json) => GameModel.fromJson(json)).toList();
  } catch (e) {
    if (kDebugMode) {
      print("Ocurrio un error al traer la información de los juegos");
      print(e);
    }
    return [];
  }
}

Future<GameData?> getGameById(int id) async {
  try {
    var route = host + "game?id=$id";
    var uri = Uri.parse(route);
    var res = await http.get(uri);
    print(res.body);
    return gameDataFromJson(res.body);
  } catch (e) {
    if (kDebugMode) {
      print("Ocurrio un error al traer el detalle del juego");
      print(e);
    }
    return null;
  }
}
