import 'package:flutter/material.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/app.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(
    const GlobalBlocProviders(
      child: PizzaJournalsApp(),
    ),
  );
}
