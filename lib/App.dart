import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _Calcular(){
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
       _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }
    else{
      /*
      Se o preço do álcool dividido pelo preço da gasolina
      for >= 0.7 é melhor abastecer com gasolina
      senão é melhor utilizar álcool
       */
      if(precoAlcool/precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "É mais vantajoso abastecer com gasolina";
        });
      }
      else{
        setState(() {
          _textoResultado = "É mais vantajoso abastecer com álcool";
        });
      }
    }
  }

  void _LimparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
    body: Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 1.59"
              ),
              style: TextStyle(
                  fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.59"
              ),
              style: TextStyle(
                  fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text
                  (
                    "Calcular"
                ),
                onPressed: (){
                  _Calcular();
                  _LimparCampos();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                _textoResultado,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      )
    ),
    );
  }
}
