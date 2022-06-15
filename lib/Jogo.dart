import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = const AssetImage("images/padrao.png");
  var _message = "Resultado";

  void _imageSelected(String choiceUser) {
    var options = ['pedra', 'papel', 'tesoura'];
    var number = Random().nextInt(3);
    var choiceApp = options[number];
    switch (choiceApp) {
      case 'pedra':
        setState(() {
          _imageApp = const AssetImage("images/pedra.png");
        });
        break;
      case 'papel':
        setState(() {
          _imageApp = const AssetImage("images/papel.png");
        });
        break;
      case 'tesoura':
        setState(() {
          _imageApp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((choiceUser == "pedra" && choiceApp == 'tesoura') ||
        (choiceUser == "papel" && choiceApp == 'pedra') ||
        (choiceUser == "tesoura" && choiceApp == 'papel')) {
      _message = "Parabéns, você ganhou !";
    } else if ((choiceApp == "pedra" && choiceUser == 'tesoura') ||
        (choiceApp == "papel" && choiceUser == 'pedra') ||
        (choiceApp == "tesoura" && choiceUser == 'papel')) {
      _message = "Você perdeu :(";
    } else {
      _message = "Empatamos!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "JokenPo",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: Colors.blue,
              ),
            ),
          ),
          Image(
            image: _imageApp,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: Colors.blue,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _imageSelected('papel'),
                child: Image.asset(
                  'images/papel.png',
                  height: 110,
                ),
              ),
              GestureDetector(
                onTap: () => _imageSelected('pedra'),
                child: Image.asset(
                  "images/pedra.png",
                  height: 110,
                ),
              ),
              GestureDetector(
                onTap: () => _imageSelected('tesoura'),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 110,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
