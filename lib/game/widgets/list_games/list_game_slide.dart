import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';
import 'package:game_book/game/bloc/game_provider.dart';
import 'package:game_book/game/screens/detail_game.dart';
import 'package:game_book/home/models/game_model.dart';
import 'package:game_book/home/widgets/image_content.dart';
import 'package:provider/provider.dart';

class ListGameSlide extends StatefulWidget {
  const ListGameSlide({super.key});

  @override
  State<ListGameSlide> createState() => _ListGameSlideState();
}

class _ListGameSlideState extends State<ListGameSlide> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<GameProvider>(context, listen: false);
      if (provider.listSlide.isEmpty) {
        provider.getSlide();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        disableCenter: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
      items: (provider.loadingSlide)
          ? [Image.asset("assets/img/placeholder.gif")]
          : provider.listSlide.map((item) => bodySlide(game: item)).toList(),
    );
  }

  Widget bodySlide({required GameModel game}) {
    final provider = Provider.of<GameProvider>(context, listen: false);
    return ImageContent(
      imageUrl: game.thumbnail,
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width,
      child: body(game, provider),
    );
  }

  Widget body(GameModel game, GameProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            game.title,
            style: styleTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(game.shortDescription),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: primaryColor),
                child: const Text("Ver más"),
                onPressed: () {
                  provider.getDetail(game.id);
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const DetailGame(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
