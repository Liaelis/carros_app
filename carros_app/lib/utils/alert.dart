import 'package:flutter/material.dart';

Function alert(context, String msg) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //barrierDismissible impede que feche o alert ao clicar fora
        return WillPopScope(
          // utilizado pra tecla de voltar do android nao feche o alert
          onWillPop: () async => false,
          child: AlertDialog(
            // empilha outra pagina por isso usar o pop para fechar
            title: Text("Carros"),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(
                      context); // poderia realizar um processamento encaminhando para outra pagina
                },
              ),
            ],
          ),
        );
      });
}