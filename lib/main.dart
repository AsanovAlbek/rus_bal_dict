import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/hive/word_hive_model.dart';
import 'package:rus_bal_dict/feature/word_detail/di/detail_module.dart';
import 'package:rus_bal_dict/feature/words_list/di/word_list_module.dart';

import 'feature/history/di/history_module.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordHiveModelAdapter());
  final historyBox = await Hive.openBox<WordHiveModel>('history');
  final favoritesBox = await Hive.openBox<WordHiveModel>('favorites');
  final tempDir = await getTemporaryDirectory();
  coreModule(HiveCacheStore(tempDir.path));
  wordListModule();
  detailModule();
  historyModule(historyBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GetIt.I<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Русско - Балкарский словарь',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}