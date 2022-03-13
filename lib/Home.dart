import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "Resultado";
  void _calcular(){

    double? precoAlcool = double.tryParse( _controllerAlcool.text );
    double? precoGasolina = double.tryParse( _controllerGasolina.text );

    if (precoAlcool == null || precoGasolina == null ) {
      setState(() {
        _textoResultado = "Numero Inválido!, digite um número maior que 0 "
            "e utilizando o ponto";
      });
    }
    else{
      if (precoAlcool/precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";

        });
      }
      else{
        setState(() {
          _textoResultado = "Melhor abasteceer com álcool";
        });
      }
    }

    //_limpar();
  }

  void _limpar(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Saiba qual a melhor opção para abastecimento do"
                      " seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ) ,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Alcool, ex: 5.50"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerAlcool ,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 6.50"
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
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: _calcular
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Text(
                      _textoResultado,

                      style: TextStyle(

                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ],
            ),
          )
      ) ,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Text(
          "Made by: Kaio Antônio 🤓",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
