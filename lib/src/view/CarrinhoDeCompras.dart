// --- PÁGINA DOS MEUS BOTÕES DE NAVEGAÇÃO INFERIOR, É CHAMADO PELA AS OUTRAS CLASSES --- //
// --- INTERLIGADA A TODAS AS PÁGINAS QUE É CHAMADO --- //

// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, library_private_types_in_public_api

import 'package:cardapio_barq/src/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'MyBottomNavigationBar.dart';

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
