import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TemaUtil {
  //! CORES
  static const corDeFundo = Color(0xFFFFF8F3);
  static const appBar = Color(0xFF2F304E);
  static const laranja01 = Color(0xFFFF7755);
  static const laranja02 = Color(0xFFF2945B);
  static const vermelhoErro = Color(0xFFF92F57);
  static const branco = Colors.white;
  static const cinza = Colors.grey;
  static const preto = Colors.black;
  static const pretoSemFoco = Colors.black54;
  static const azul = Colors.blue;
  static const verde01 = Colors.green;
  static const verde02 = Color(0xff62C153);

  //* TEMA DE TEXTOS
  static dynamic textoPrincipal(BuildContext context) {
    return GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
  }
}
