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
    int perg = perguntaSelecionada + 1;
    int quant = perguntas.length;
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Container(padding: EdgeInsets.all(6),child: Text('Pergunta [$perg/$quant]', style: TextStyle(fontSize: 17, color: Colors.white),), decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid), color: Colors.blue,),)
            ),
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            SizedBox(height: 30,),
            ...widgets,
            SizedBox(height: 120),
            Text("Feito por: Pedro H. Peres"),
            SizedBox(height: 6,),
            Text("github.com/PedroH-Peres")
          ],  
        );

  }
}



class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;
  String get fraseResultado{
    if(pontuacao == 0){
      return 'Busque melhorar! [$pontuacao/4]';
    }else if(pontuacao < 2){
      return 'Dá pra ser melhor. [$pontuacao/4]';
    }else if(pontuacao < 4){
      return 'Quase lá [$pontuacao/4]';
    }else{
      return 'Parabéns, nível gênio! [$pontuacao/4]';
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
        ElevatedButton(onPressed: reiniciar, child: Text('Reiniciar')),
        SizedBox(height: 60,),
        Text("Feito por: Pedro H. Peres"),
        SizedBox(height: 6,),
        Text("github.com/PedroH-Peres")
      ],
    );
  }
}