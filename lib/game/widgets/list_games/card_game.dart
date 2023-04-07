import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';
import 'package:game_book/game/bloc/game_provider.dart';
import 'package:game_book/game/screens/detail_game.dart';
import 'package:game_book/home/models/game_model.dart';
import 'package:game_book/home/widgets/image_content.dart';
import 'package:provider/provider.dart';

class CardGame extends StatelessWidget {
  final GameModel game;
  final String? alias;

  const CardGame({super.key, required this.game, this.alias});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final provider = Provider.of<GameProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      height: 200,
      child: ImageContent(
          imageUrl: game.thumbnail,
          width: width,
          child: title(width),
          onPressed: () {
            provider.getDetail(game.id);
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => DetailGame()));
          }),
    );
  }

  Row title(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [name(width), platform(width)],
    );
  }

  Container name(double width) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: width * 0.55,
      child: Text(
        game.title.toUpperCase(),
        style: styleTitle,
      ),
    );
  }

  Container platform(double width) {
    return Container(
      width: width * 0.33,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Text(
        game.platform,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
