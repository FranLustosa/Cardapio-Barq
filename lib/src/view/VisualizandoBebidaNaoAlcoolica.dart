// --- PÁGINA DOS MEUS BOTÕES DE NAVEGAÇÃO INFERIOR, É CHAMADO PELA AS OUTRAS CLASSES --- //
// --- INTERLIGADA A TODAS AS PÁGINAS QUE É CHAMADO --- //

// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'MyBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'MyBottomNavigationBar.dart';

class ItemCarrinho {
  String nome;
  double preco;
  int quantidade;

  ItemCarrinho(
      {required this.nome, required this.preco, required this.quantidade});
}

class VisualizandoBebidaNaoAlcoolica extends StatefulWidget {
  const VisualizandoBebidaNaoAlcoolica({Key? key}) : super(key: key);

  @override
  State<VisualizandoBebidaNaoAlcoolica> createState() =>
      _VisualizandoBebidaState();
}

class _VisualizandoBebidaState extends State<VisualizandoBebidaNaoAlcoolica> {
  int _currentIndex = 0;
  int _quantity = 0; // Variável para controlar a quantidade
  List<ItemCarrinho> carrinho = [];

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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CarrinhoDeCompras(itens: carrinho),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/FundoBebidas.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 300),
                Container(
                  width: 500,
                  height: 347,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Positioned(
                        top: 300,
                        left: 0,
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            // CÓDIGO INCREMENTADOR
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 0) {
                                        _quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '$_quantity',
                                  style: TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: SizedBox(
                          width: 350,
                          height:
                              50, // Aumente a altura do botão conforme necessário
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    actionsOverflowAlignment:
                                        OverflowBarAlignment.center,
                                    title: Text(
                                        'Adicionado ao carrinho com sucesso!'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Continuar Pedindo'),
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250, 40),
                                          backgroundColor: Color(0xFF00265F),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CarrinhoDeCompras(
                                                      itens: carrinho),
                                            ),
                                          );
                                        },
                                        child: Text('Ver carrinho'),
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250, 40),
                                          backgroundColor:
                                              Color.fromARGB(255, 85, 85, 85),
                                          primary: Color.fromARGB(
                                              255, 255, 255, 255),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );

                              // Adicionar o item ao carrinho
                              carrinho.add(ItemCarrinho(
                                nome: ' Drink de Morango',
                                preco: 10.00,
                                quantidade: _quantity,
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  300, 62), // Atualize o tamanho do botão aqui
                              backgroundColor: Color(0xFF00265F),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text('Adicionar ao carrinho'),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Espaço entre o botão e o BottomNavigationBar
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 50,
            top: 8,
            child: Align(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  'assets/images/card17.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 37,
            top: 370,
            child: Align(
              child: SizedBox(
                width: 222,
                height: 32,
                child: Text(
                  'Cerveja Heineken 600ml',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.5599022865,
                    letterSpacing: -0.6,
                    color: Color(0xff4f4f4f),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 37,
            top: 410,
            child: Align(
              child: SizedBox(
                width: 328,
                height: 71,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Tempus interdum egestas vitae tellus parturient nam risus sed. Euismod tempor nunc eu est orci aenean in. ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.5599023183,
                    letterSpacing: -0.45,
                    color: Color(0xff4f4f4f),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: 370,
            child: Align(
              child: SizedBox(
                width: 92,
                height: 26,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xb200255e),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: 370,
            child: Align(
              child: SizedBox(
                width: 92,
                height: 26,
                child: Text(
                  '     R\$ 10,00',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.5599023183,
                    letterSpacing: -0.45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarrinhoDeCompras extends StatefulWidget {
  final List<ItemCarrinho> itens;

  const CarrinhoDeCompras({Key? key, required this.itens}) : super(key: key);

  @override
  _CarrinhoDeComprasState createState() => _CarrinhoDeComprasState();
}

class _CarrinhoDeComprasState extends State<CarrinhoDeCompras> {
  bool _confirmarPedido = false;
  bool _cancelarPedido = false;
  // bottom navigation
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _removerItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar exclusão'),
          content:
              Text('Tem certeza de que deseja excluir este item do carrinho?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.itens.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Excluir',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirmarPedidoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (widget.itens.isEmpty) {
          return AlertDialog(
            title: Text('Carrinho Vazio'),
            content: Text(
                'Não há itens no carrinho para cancelar o pedido. Por favor, adicione itens ao seu carrinho e realize o pedido.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Fechar',
                  style: TextStyle(
                    color: Color(0xFF00265F),
                  ),
                ),
              ),
            ],
          );
        }

        return AlertDialog(
          title: Text('Confirmar Pedido'),
          content: Text('Deseja confirmar o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _confirmarPedido = false;
                  widget.itens.clear();
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pedido confirmado'),
                      content: Text('O pedido foi confirmado com sucesso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Fechar',
                            style: TextStyle(
                              color: Color(0xFF00265F),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _cancelarPedidoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (widget.itens.isEmpty) {
          return AlertDialog(
            title: Text('Carrinho Vazio'),
            content: Text(
                'Não há itens no carrinho para cancelar o pedido. Por favor, adicione itens ao seu carrinho e realize o pedido.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Fechar',
                  style: TextStyle(
                    color: Color(0xFF00265F),
                  ),
                ),
              ),
            ],
          );
        }

        return AlertDialog(
          title: Text('Cancelar Pedido'),
          content: Text('Deseja cancelar o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _cancelarPedido = false;
                  widget.itens.clear();
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pedido cancelado'),
                      content: Text('O pedido foi cancelado!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Fechar',
                            style: TextStyle(
                              color: Color(0xFF00265F),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Color(0xFF00265F),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00265F),
        centerTitle: true,
        title: Text("BARQ"),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.itens.length,
              itemBuilder: (context, index) {
                final item = widget.itens[index];
                return ListTile(
                  title: Text(item.nome),
                  subtitle: Text('Quantidade: ${item.quantidade}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('R\$ ${item.preco * item.quantidade}'),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removerItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          !_confirmarPedido && !_cancelarPedido
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00265F),
                          fixedSize: Size(350, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          _confirmarPedidoDialog();
                        },
                        child: Text('Confirmar Pedido'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 85, 85, 85),
                          fixedSize: Size(350, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          _cancelarPedidoDialog();
                        },
                        child: Text('Cancelar Pedido'),
                      ),
                    ],
                  ),
                )
              : SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CarrinhoDeComprasProvider extends ChangeNotifier {
  List<ItemCarrinho> itens = [];

  void adicionarItem(ItemCarrinho item) {
    itens.add(item);
    notifyListeners();
  }

  void removerItem(int index) {
    itens.removeAt(index);
    notifyListeners();
  }

  void limparCarrinho() {
    itens.clear();
    notifyListeners();
  }
}
