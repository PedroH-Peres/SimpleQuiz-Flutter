
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';

main(){
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  
  final List<Map<String, Object>> _perguntas= const [
      {
        'texto': 'Qual é a sua cor favorita?', 
        'respostas': [
             {'texto': 'Amarelo', 'nota': 3},
             {'texto': 'Vermelho', 'nota': 3},
             {'texto': 'Verde', 'nota':7},
             {'texto': 'Azul', 'nota':10}
          ]
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [{'texto': 'Panda', 'nota': 9},{'texto': 'Pantera', 'nota': 8},{'texto': 'Capivara','nota': 4},{'texto': 'Lontra', 'nota': 10} ]
      },
      {
        'texto': 'Qual o seu filme/serie favorito?',
        'respostas': [{'texto': 'Game of Thrones', 'nota':9},{'texto': 'Lord of the rings', 'nota': 8},{'texto':'Interstellar' , 'nota': 10},{'texto': 'Lost in space', 'nota': 5} ]
      }
  ];
  
  void _reiniciarForm(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao){
    setState((){
      if(temPerguntaSelecionada){
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  @override
  Widget build(BuildContext context){
   /* 
   for(var textoResp in respostas){
      widgets.add(Resposta(textoResp, _responder));
    }
   */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas'), ),
        body: temPerguntaSelecionada 
        ? Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, responder: _responder) 
        : Resultado(_pontuacaoTotal, _reiniciarForm) 
      ),

    );
  }
}

class PerguntaApp extends StatefulWidget{
  
  State<PerguntaApp> createState(){
    return _PerguntaAppState();
  }

}
