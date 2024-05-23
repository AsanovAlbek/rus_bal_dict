import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/feature/word_detail/di/detail_module.dart';
import 'package:rus_bal_dict/feature/words_list/di/word_list_module.dart';

void main() {
  coreModule();
  wordListModule();
  detailModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GetIt.I<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Русско - Балкарский словарь',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}