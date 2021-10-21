import 'package:appserap/utils/tema.util.dart';
import 'package:flutter/material.dart';

class BotaoDefaultWidget extends StatelessWidget {
  final String? textoBotao;
  final Widget? child;
  final double? largura;
  final bool desabilitado;
  final Function()? onPressed;

  BotaoDefaultWidget({
    this.textoBotao,
    this.largura,
    this.onPressed,
    this.child,
    this.desabilitado = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: desabilitado ? null : onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: largura,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TemaUtil.laranja01,
        ),
        child: Center(
          child: _buildChild(),
        ),
      ),
    );
  }

  _buildChild() {
    if (textoBotao != null) {
      return Text(
        textoBotao!,
        textAlign: TextAlign.center,
        style: TextStyle(color: TemaUtil.branco, fontWeight: FontWeight.bold, fontSize: 16),
      );
    }

    return child;
  }
}
