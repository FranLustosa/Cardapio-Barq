// --- PÁGINA QUE LISTA OS MEUS PRODUTOS --- //
// --- INTERLIGADA A PÁGINA DE BEBIDA ALCOOLICAS, OU SEJA, ELA É CHAMADA NESSA CLASSE E REALIZA O RETORNO --- //

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:cardapio_barq/src/view/VisualizandoBebida.dart';
import 'package:cardapio_barq/src/view/VisualizandoBebidaNaoAlcoolica.dart';
import 'MyBottomNavigationBar.dart';

class BebidasNaoAlcoolicas extends StatefulWidget {
  @override
  _PetiscosState createState() => _PetiscosState();
}

class _PetiscosState extends State<BebidasNaoAlcoolicas> {
  // bottom navigation
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00265F),
        centerTitle: true,
        title: Text("BARQ"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: BebidasNaoAlcoolicasListView(),
    );
  }
}

class BebidasNaoAlcoolicasListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "     Bebidas não Alcoólicas ",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00265F)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: 6, // Número total de itens
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VisualizandoBebidaNaoAlcoolica(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      alignment: Alignment(-1, 0),
                      child: Stack(
                        children: [
                          Text(
                            "   Cerveja Spaten 350ml\n   \n\n",
                            style: TextStyle(
                              color: Color(0xFF00265F),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 30,
                            child: Container(
                              width: 93,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xb200255e),
                              ),
                              child: Center(
                                child: Text(
                                  "R\$ 10,00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      width: 350,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF00265F).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          alignment: Alignment(1, 0),
                          image: AssetImage("assets/images/card${17}.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
