import 'package:bees/bees_app.dart';
import 'package:bees/injector/injector.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const BeesApp());
}
