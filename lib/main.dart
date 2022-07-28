
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
        'texto': 'Quem foram os três astronautas que tripularam a Saturn V em 1969?', 
        'respostas': [
             {'texto': 'Neil Armstrong, Michael Collins e Johannes Kepler', 'nota': 0},
             {'texto': 'Carl Sagan, Buzz Aldrin e Michael Collins', 'nota': 0},
             {'texto': 'Michael Collins, Buzz Aldrin e Neil Armstrong', 'nota': 1},
             {'texto': 'Richard Feynman, Enrico Fermi e Neil Armstrong', 'nota': 0}
          ]
      },
      {
        'texto': 'O Neônio é um...',
        'respostas': [{'texto': 'Metal de transição', 'nota': 0},{'texto': 'Ametal', 'nota': 0},{'texto': 'Metal alcalino','nota': 0},{'texto': 'Gás nobre', 'nota': 1} ]
      },
      {
        'texto': 'Qual desses componentes possui entre suas finalidades limitar a corrente elétrica?',
        'respostas': [{'texto': 'Resistor', 'nota':1},{'texto': 'Transistor', 'nota': 0},{'texto':'Capacitor' , 'nota': 0},{'texto': 'Indutor', 'nota': 0} ]
      },
      {
        'texto': 'A expressão "F = m.a" também é chamada de:',
        'respostas': [{'texto': 'Primeira lei de Newton', 'nota':0},{'texto': 'Efeito Joule', 'nota': 0},{'texto':'Princípio Fundamental da Dinâmica' , 'nota': 1},{'texto': 'Segunda Lei de Kepler', 'nota': 0} ]
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
