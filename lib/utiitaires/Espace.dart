import 'package:flutter/material.dart';

class Espace extends StatelessWidget {
  double? hauteur;
  double? largeur;

  Espace({this.hauteur, this.largeur});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hauteur,
      width: largeur,
    );
  }
}
