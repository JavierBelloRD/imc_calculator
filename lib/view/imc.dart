import 'package:flutter/material.dart';

class FormIMCWidget extends StatefulWidget {

  @override
  _FormIMCWidgetState createState() => _FormIMCWidgetState();
}

class _FormIMCWidgetState extends State<FormIMCWidget> {
  final _formKey = GlobalKey<FormState>();

  double weigth = 0;
  double heigth = 0;
  double imc = 0;
  String imcResult = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Estatura',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30.5
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
              hintText: 'Escribe la altura en centimetros aquí',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes introducir el tamaño';
              }
              if(int.parse(value) == 0)
                return 'El tamaño no puede ser 0';

              heigth = double.parse(value);

              return null;
            },
          ),
          Text(
            'Peso',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30.5
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
              hintText: 'Escribe el peso en kilogramos aqui',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes introducir el peso';
              }
              if(int.parse(value) == 0)
                return 'El peso no puede ser 0';

              weigth = double.parse(value);

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  imc = weigth / (( heigth * 0.01) * ( heigth * 0.01));

                  imcResult = 'Tu indice de masa corporal es: ' + imc.toStringAsFixed(2);

                  setState(() { });
                }
              },
              child: Text('Calcular'),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    imcResult
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}