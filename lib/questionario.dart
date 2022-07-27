import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_perguntas/questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas']
    : [];
    List<Widget> widgets = respostas
    .map((resp) => Resposta(resp['texto'].toString(), ()=>responder(int.parse(resp['nota'].toString()))))
    .toList();

    return Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            ...widgets,
            
          ],  
        );

  }
}



class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;
  String get fraseResultado{
    if(pontuacao < 16){
      return "Parabens";
    }else if(pontuacao < 20){
      return "Brabo!";
    }else if(pontuacao < 29){
      return "Brabissimo";
    } else{
      return "O Mestre!";
    }
  }
  Resultado(this.pontuacao, this.reiniciar);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 23, color: Colors.blue, fontWeight: FontWeight.bold),),
        ),
        ElevatedButton(onPressed: reiniciar, child: Text('Reiniciar'))
      ],
    );
  }
}