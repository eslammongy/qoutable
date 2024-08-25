import 'package:flutter/material.dart';

const pubBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  gradient: LinearGradient(
    colors: [
      Color(0xFF5F20F1),
      Color(0xFF831D95),
      Color(0xFFAE0606),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0], // Optional, controls the distribution of colors
  ),
);
