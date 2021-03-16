import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor predileta?',
      'respostas': [
        {'texto': 'Vermelha', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Amarela', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é seu animal predileto?',
      'respostas': [
        {'texto': 'Lobo-Guará', 'pontuacao': 10},
        {'texto': 'Onça-Pintada', 'pontuacao': 5},
        {'texto': 'Ariranha', 'pontuacao': 3},
        {'texto': 'Paca', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é sua árvore predileta?',
      'respostas': [
        {'texto': 'Pinheiro', 'pontuacao': 10},
        {'texto': 'Goiabeira', 'pontuacao': 5},
        {'texto': 'Jabuticabeira', 'pontuacao': 3},
        {'texto': 'Mangueira', 'pontuacao': 1}
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PerguntaApp'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
