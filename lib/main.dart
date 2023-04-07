import 'package:flutter/material.dart';

import 'package:game_book/constants.dart';
import 'package:game_book/game/screens/list_games_screen.dart';
import 'package:game_book/home/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import 'game/bloc/game_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
            primaryColor: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: Typography.blackRedmond.apply(
              bodyColor: fontColor,
              fontFamily: 'Lato',
            )),
        home: const ValidateToken(),
      ),
    );
  }
}

class ValidateToken extends StatefulWidget {
  const ValidateToken({super.key});

  @override
  State<ValidateToken> createState() => _ValidateTokenState();
}

class _ValidateTokenState extends State<ValidateToken> {
  @override
  Widget build(BuildContext context) {
    // return ListGameScreen();
    return SignInScreen();
  }
}
