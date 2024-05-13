// ignore_for_file: prefer_const_constructors

import 'package:cardapio_barq/src/ui/colors/colors.dart';
import 'package:cardapio_barq/src/view/CarrinhoDeCompras.dart';
import 'package:cardapio_barq/src/view/VisualizandoBebida.dart';
import 'package:flutter/material.dart';
import 'package:cardapio_barq/src/view/AdicionadoAoCarrinho.dart';
import 'package:cardapio_barq/src/view/BebidasAlcoolicas.dart';
import 'package:cardapio_barq/src/view/Inicial.dart';
import 'package:cardapio_barq/src/view/Login.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSystem.primaryColor,
      centerTitle: true,
      title: Text("BARQ", style: TextStyle(color: ColorSystem.white)),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
