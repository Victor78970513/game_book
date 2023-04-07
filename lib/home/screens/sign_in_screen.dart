import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';
import 'package:game_book/game/screens/list_games_screen.dart';
import 'package:game_book/home/widgets/button_confirm.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // final auth = Provider.of<SignInSocialNetworkProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0, 1),
              children: [
                Image.asset(
                  "assets/img/welcome.png",
                  height: height * 0.65,
                  width: width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/img/logo-horizontal.png",
                  height: height * 0.1,
                  width: width * 0.8,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: const Text(
                'Bienvenid@ a la mejor aplicación sobre juegos, erate de todos los juegos que estan haciendo tendencia en el mundo y diviertete',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            // (auth.loadingAuth)
            // ? const Center(child: CircularProgressIndicator())
            ButtonConfirm(
              width: 300,
              icon: Image.asset(
                "assets/img/google-svgrepo-com.png",
                width: 35,
                height: 35,
              ),
              label: "Iniciar sesión con Google",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ListGameScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
