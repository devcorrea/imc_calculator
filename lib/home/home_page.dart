import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void calculate() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;

    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        _infoText = "Abaixo do peso ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade grau I \n Índice: ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            "Obesidade grau II \n Índice: ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 40) {
        _infoText =
            "Obesidade grau III \n Índice:${imc.toStringAsPrecision(4)}";
      }
    });
  }

  void _resetFields() {
    _weightController.text = "";
    _heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 64),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 120.0,
                    color: Colors.green,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe seu peso";
                      }
                    },
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 16.0),
                    decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(color: Colors.green)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe sua altura";
                      }
                    },
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontFamily: "Montserrat"),
                    decoration: InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontFamily: "Montserrat")),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 56,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          calculate();
                        }
                      },
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Montserrat",
                        fontSize: 18.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
