import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String _theState = "0";
  int tipo = 0;
  int opcion = 0;
  final _random = new Random();
  String texto = "";
  int score = 0;

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    setRandomWord();
  }

  String setRandomWord() {
    var option = next(0, 2);
    var randomItem = "";
    if (option == 0) {
      print("change to noun");
      randomItem = (nouns.toList()..shuffle()).first;
      tipo = 1;
    } else {
      print("change to adjective");
      randomItem = (adjectives.toList()..shuffle()).first;
      tipo = 2;
    }
    setState(() {
      texto = randomItem;
    });
    return randomItem;
  }

  void _onPressed(int tipo, int opcion) {
    if (tipo == opcion) {
      setState(() {
        score++;
      });
    } else {
      setRandomWord();
    }
  }

  void _onReset() {
    setState(() {
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouns vs Adjectives"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(score.toString()),
          Text(setRandomWord()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () => _onPressed(tipo, 2),
                  child: const Text("Adjective")),
              ElevatedButton(
                  onPressed: () => _onPressed(tipo, 1), child: Text("Noun"))
            ],
          ),
          ElevatedButton(onPressed: () => _onReset(), child: Text("Reset")),
        ],
      ),
    );
  }
}
