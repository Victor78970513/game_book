import 'package:flutter/material.dart';
import 'package:game_book/game/repository/game_repository.dart';
import 'package:game_book/home/models/game_data.dart';
import 'package:game_book/home/models/game_model.dart';

class GameProvider extends ChangeNotifier {
  List<GameModel> _listGame = [];
  List<GameModel> _listSlide = [];
  GameData? _info;
  bool _loadingList = false;
  bool _loadingSlide = false;
  bool _loadingDetail = false;

  List<GameModel> get listGame => _listGame;
  set listGame(List<GameModel> list) {
    _listGame = list;
    notifyListeners();
  }

  List<GameModel> get listSlide => _listSlide;
  set listSlide(List<GameModel> list) {
    _listSlide = list;
    notifyListeners();
  }

  GameData? get info => _info;
  set info(GameData? data) {
    _info = data;
    notifyListeners();
  }

  bool get loadingList => _loadingList;
  set loadingList(bool state) {
    _loadingList = state;
    notifyListeners();
  }

  bool get loadingDetail => _loadingDetail;
  set loadingDetail(bool state) {
    _loadingDetail = state;
    notifyListeners();
  }

  bool get loadingSlide => _loadingSlide;
  set loadingSlide(bool state) {
    _loadingSlide = state;
    notifyListeners();
  }

  Future<void> getData() async {
    loadingList = true;
    var res = await getListGameVDio();
    res.shuffle();
    listGame = res;
    loadingList = false;
  }

  Future<void> getSlide() async {
    loadingSlide = true;
    var res = await getListSlide();
    listSlide = res.getRange(0, 10).toList();
    print(listSlide);
    loadingSlide = false;
  }

  Future<void> getDetail(int id) async {
    loadingDetail = true;
    info = await getGameById(id);
    loadingDetail = false;
  }
}

var listTest = [
  {
    "id": 521,
    "title": "Diablo Immortal",
    "thumbnail": "https://www.freetogame.com/g/521/thumbnail.jpg",
    "short_description":
        "Built for mobile and also released on PC, Diablo Immortal fills in the gaps between Diablo II and III in an MMOARPG environment.",
    "game_url": "https://www.freetogame.com/open/diablo-immortal",
    "genre": "MMOARPG",
    "platform": "PC (Windows)",
    "publisher": "Blizzard Entertainment",
    "developer": "Blizzard Entertainment",
    "release_date": "2022-06-02",
    "freetogame_profile_url": "https://www.freetogame.com/diablo-immortal"
  },
  {
    "id": 517,
    "title": "Lost Ark",
    "thumbnail": "https://www.freetogame.com/g/517/thumbnail.jpg",
    "short_description":
        "Smilegate's free-to-play multiplayer ARPG is a massive adventure filled with lands waiting to be explored, people waiting to be met, and an ancient evil waiting to be destroyed.",
    "game_url": "https://www.freetogame.com/open/lost-ark",
    "genre": "ARPG",
    "platform": "PC (Windows)",
    "publisher": "Amazon Games",
    "developer": "Smilegate RPG",
    "release_date": "2022-02-11",
    "freetogame_profile_url": "https://www.freetogame.com/lost-ark"
  },
  {
    "id": 516,
    "title": "PUBG: BATTLEGROUNDS",
    "thumbnail": "https://www.freetogame.com/g/516/thumbnail.jpg",
    "short_description":
        "Get into the action in one of the longest running battle royale games PUBG Battlegrounds.",
    "game_url": "https://www.freetogame.com/open/pubg",
    "genre": "Shooter",
    "platform": "PC (Windows)",
    "publisher": "KRAFTON, Inc.",
    "developer": "KRAFTON, Inc.",
    "release_date": "2022-01-12",
    "freetogame_profile_url": "https://www.freetogame.com/pubg"
  },
  {
    "id": 345,
    "title": "Forge of Empires",
    "thumbnail": "https://www.freetogame.com/g/345/thumbnail.jpg",
    "short_description":
        "A free to play 2D browser-based online strategy game, become the leader and raise your city.",
    "game_url": "https://www.freetogame.com/open/forge-of-empires",
    "genre": "Strategy",
    "platform": "Web Browser",
    "publisher": "InnoGames",
    "developer": "InnoGames",
    "release_date": "2012-04-17",
    "freetogame_profile_url": "https://www.freetogame.com/forge-of-empires"
  },
  {
    "id": 427,
    "title": "Drakensang Online",
    "thumbnail": "https://www.freetogame.com/g/427/thumbnail.jpg",
    "short_description":
        "A free to play browser-based top-down hack-and-slash 3D MMORPG similar to games in the Diablo series.",
    "game_url": "https://www.freetogame.com/open/drakensang-online",
    "genre": "MMORPG",
    "platform": "Web Browser",
    "publisher": "Bigpoint",
    "developer": "Bigpoint",
    "release_date": "2011-08-08",
    "freetogame_profile_url": "https://www.freetogame.com/drakensang-online"
  },
  {
    "id": 525,
    "title": "MultiVersus",
    "thumbnail": "https://www.freetogame.com/g/525/thumbnail.jpg",
    "short_description":
        "The Warner Bros lineup meets Smash in Player First Games’ MultiVersus.",
    "game_url": "https://www.freetogame.com/open/multiversus",
    "genre": "Fighting",
    "platform": "PC (Windows)",
    "publisher": "Warner Bros. Games",
    "developer": "Player First Games",
    "release_date": "2022-07-19",
    "freetogame_profile_url": "https://www.freetogame.com/multiversus"
  }
];
