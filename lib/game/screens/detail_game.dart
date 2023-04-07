import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';
import 'package:game_book/game/bloc/game_provider.dart';
import 'package:game_book/game/widgets/detail_game/modal_show_image.dart';
import 'package:game_book/home/widgets/image_content.dart';
import 'package:provider/provider.dart';

class DetailGame extends StatefulWidget {
  const DetailGame({Key? key}) : super(key: key);

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return Scaffold(
      body: provider.loadingDetail
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: [
                ImageContent(
                  imageUrl: provider.info!.thumbnail,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(
                      provider.info!.title,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      provider.info!.description,
                      style: const TextStyle(fontSize: 16),
                    )),
                rowInfo("Desarrollado por:", provider.info!.developer),
                rowInfo("Publicado por:", provider.info!.publisher),
                rowInfo("Genero:", provider.info!.genre),
                rowInfo("Plataforma:", provider.info!.platform),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15, bottom: 30),
                  child: const Text(
                    "Requerimiento mínimos :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                rowInfo("Sistema Operativo",
                    provider.info!.minimumSystemRequirements!.os),
                rowInfo("Procesador",
                    provider.info!.minimumSystemRequirements!.processor),
                rowInfo("Memoria",
                    provider.info!.minimumSystemRequirements!.memory),
                rowInfo("Gráficos",
                    provider.info!.minimumSystemRequirements!.graphics),
                rowInfo("Almacenamiento",
                    provider.info!.minimumSystemRequirements!.storage),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: provider.info!.screenshots.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => ModalShowImage(
                                imageUrl:
                                    provider.info!.screenshots[index].image));
                      },
                      child: FadeInImage(
                        // height: 200,
                        // width: width,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage("assets/img/placeholder.gif"),
                        image: NetworkImage(
                            provider.info!.screenshots[index].image),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
    );
  }

  Widget rowInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Text(
                label,
                style: styleTextBold,
              )),
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.all(0),
            child: Text(
              value,
              style: styleText,
            ),
          ),
        ],
      ),
    );
  }
}
