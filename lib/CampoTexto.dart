import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      setState(() {
        /**
         * Se o preço do alcool dividido pelo preço da gasolina
         * for > = 0.7 melhor abastecer com gasolina
         * senão melhor utilizar álccol
         */

        setState(() {
          _textoResultado = (precoAlcool / precoGasolina) > 0.7
              ? "Melhor abastecer com Gasolina"
              : "Melhor abastecer com Alcool";

          _limparCampos();
        });
      });
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              // Texto: Saiba melhor opção...
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qua a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              // input alccol
              TextField(
                //text, number, emailAdress, datatime
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do Alcool, ex: 4.10"),
                // enabled: false,
                // maxLength: 2,
                // maxLengthEnforced: true,
                style: TextStyle(fontSize: 22, color: Colors.black),
                // obscureText: true,
                // onChanged: (String texto) {
                //   print("valor digitado: " + texto);
                // },
                onSubmitted: (String texto) {
                  print("valor digitado: " + texto);
                },
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do Gasolina, ex: 5.10"),
                style: TextStyle(fontSize: 25, color: Colors.black),
                onSubmitted: (String texto) {
                  print("valor digitado: " + texto);
                },
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () => _calcular()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
