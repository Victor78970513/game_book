import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';
import 'package:game_book/game/widgets/list_games/list_game_data.dart';
import 'package:game_book/game/widgets/list_games/list_game_slide.dart';

class ListGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: const ListGameSlide(),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 50),
              child: const Text('Todos los juegos', style: styleTitle)),
          const Expanded(child: ListGameData())
        ],
      )),
    );
  }
}
