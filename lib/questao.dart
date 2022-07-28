import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Questao extends StatelessWidget {
  final String texto;
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        ),
    );
  }
}

class Resposta extends StatelessWidget {
  final String resp;
  final void Function() quandoselecionado;
  Resposta(this.resp, this.quandoselecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: 50,
      child:ElevatedButton(
        onPressed: quandoselecionado, 
        child: Text(resp, style: TextStyle(fontSize: 15),),
      )
    );
      
      
    
  }
}