import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultadoOperaciones = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container (
            child: Row(
              children: [
                Text(
                  resultadoOperaciones,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blue,          
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
          child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "7";
                  });
                },
                child: Text("7")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "8";
                  });
                },
                child: Text("8")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "9";
                  });
                },
                child: Text("9")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " / ";
                  });
                },
                child: Text("/")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " %";
                  });
                },
                child: Text("%"))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "4";
                  });
                },
                child: Text("4")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "5";
                  });
                },
                child: Text("5")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "6";
                  });
                },
                child: Text("6")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " x ";
                  });
                },
                child: Text("x")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "√ ";
                  });
                },
                child: Text("√"))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "1";
                  });
                },
                child: Text("1")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "2";
                  });
                },
                child: Text("2")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "3";
                  });
                },
                child: Text("3")),
            ElevatedButton(
                onPressed: () {
                  setState(() { 
                    operaciones += " - ";
                  });
                },
                child: Text("-")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " x² ";
                  });
                },
                child: Text("x²"))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "0";
                  });
                },
                child: Text("0")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones = "";
                    resultadoOperaciones = "";
                  });
                },
                child: Text("C")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones = "";
                  });
                },
                child: Text("CE")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " + ";
                  });
                },
                child: Text("+")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getOperacion();
                  });
                },
                child: Text("="))
          ])          
        ])),          
      ],
    );
  }
  getOperacion() {
      var array = operaciones.split(" ");
      num resultado;
      if (!operaciones.contains(" ")) {             
            if (array[3].trim() == "%") {
              String operador = array[1].trim(); 
              double x = double.parse(array[0].trim());
              double y = double.parse(array[2].trim());              
              double z = y / 100;              
              resultado = x * z;
              resultado = resultado % 1 == 0 ? resultado.round() : resultado;
              setState(() {
                resultadoOperaciones = 
                    "$resultadoOperaciones\n $x $operador = $resultado";
                operaciones = "$resultado";
              });
            }  
      }       
      if (array[1].trim() == "x²") {
        String operador = array[1].trim(); 
        double x = double.parse(array[0].trim());
        resultado = x * x;
        resultado = resultado % 1 == 0 ? resultado.round() : resultado;
        setState(() {
          resultadoOperaciones = 
              "$resultadoOperaciones\n $x $operador = $resultado";
          operaciones = "$resultado";
        });
      }
      if (array[0].trim() == "√") {
        String operador = array[0].trim();
        double x = double.parse(array[1].trim());
        resultado = sqrt(x);
        resultado = resultado % 1 == 0 ? resultado.round() : resultado;
        setState(() {
          resultadoOperaciones = 
              "$resultadoOperaciones\n $x $operador  = $resultado";
          operaciones = "$resultado";
        });
      }
      if (array[3].trim() == "%"){
        String operador = array[1].trim();
        double x = double.parse(array[0].trim());
        double y = double.parse(array[2].trim());
          double z = y / 100;
          resultado = (operador == "+")
            ? (x + z)
            : (operador == "-")
                ? (x - z)
                : (operador == "x")
                    ? (x * z)
                    : (operador == "/")
                        ? (x / z)
                        : "Operación invalida";

          resultado = resultado % 1 == 0 ? resultado.round() : resultado;

          setState(() {
            resultadoOperaciones =
                "$resultadoOperaciones\n $x $operador $y = $resultado";
            operaciones = "$resultado";
          });

      }
      else{
        String operador = array[1].trim();
        double x = double.parse(array[0].trim());
        double y = double.parse(array[2].trim());
        resultado = (operador == "+")
            ? (x + y)
            : (operador == "-")
                ? (x - y)
                : (operador == "x")
                    ? (x * y)
                    : (operador == "/")
                        ? (x / y)
                        : "Operación invalida";

            resultado = resultado % 1 == 0 ? resultado.round() : resultado;

            setState(() {
              resultadoOperaciones =
                  "$resultadoOperaciones\n $x $operador $y = $resultado";
              operaciones = "$resultado";
            });

        
        
      }
    
  }  
}