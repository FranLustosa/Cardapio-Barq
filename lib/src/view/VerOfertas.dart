// --- PÁGINA QUE VISUALIZO OS MEUS PRODUTOS, OU SEJA, VEJO A LISTA COM OS PRODUTOS --- //
// --- INTERLIGADA A PÁGINA DE OFERTAS LIST VIEW --- //

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardapio_barq/src/view/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:cardapio_barq/src/view/VisualizandoBebida.dart';

import 'MyBottomNavigationBar.dart';

class VerOfertas extends StatefulWidget {
  const VerOfertas({super.key});

  @override
  State<VerOfertas> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<VerOfertas> {
  int _currentIndex = 0;
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "  Ofertas do Dia",
                  style: TextStyle(
                    color: Color(0xFF00265F),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // primeiro container
            SizedBox(height: 15),
            Container(
              alignment: Alignment(-1, 0),
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFF00265F).withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  alignment: Alignment(1, 0),
                  image: AssetImage("assets/images/card11.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 4,
                    child: Text(
                      "   Cerveja Spaten 350ml\n\n ",
                      style: TextStyle(
                        color: Color(0xFF00265F),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 35,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00265F).withOpacity(0.0),
                      ),
                      child: Center(
                        child: Text(
                          "R\$ 25,00",
                          style: TextStyle(
                            color: Color(0xFF00265F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.5599023104,
                            letterSpacing: -0.48,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    top: 35,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xb200255e),
                      ),
                      child: Center(
                        child: Text(
                          "R\$ 15,00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 65,
                        height: 21.97,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffdb0000),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '10% off',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment(-1, 0),
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFF00265F).withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  alignment: Alignment(1, 0),
                  image: AssetImage("assets/images/card11.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 4,
                    child: Text(
                      "   Cerveja Spaten 350ml\n\n ",
                      style: TextStyle(
                        color: Color(0xFF00265F),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 35,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00265F).withOpacity(0.0),
                      ),
                      child: Center(
                        child: Text(
                          "R\$ 25,00",
                          style: TextStyle(
                            color: Color(0xFF00265F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.5599023104,
                            letterSpacing: -0.48,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    top: 35,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xb200255e),
                      ),
                      child: Center(
                        child: Text(
                          "R\$ 15,00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 65,
                        height: 21.97,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffdb0000),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '10% off',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
