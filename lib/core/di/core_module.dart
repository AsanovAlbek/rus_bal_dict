import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/navigation/go_router.dart';
import 'package:talker/talker.dart';

final di = GetIt.instance;

void coreModule() {
  di.registerSingleton<GoRouter>(AppRouter().router);
  di.registerSingleton<Dio>(Dio(BaseOptions(
      //baseUrl: 'http://192.168.177.2:8000/',
      baseUrl: baseUrl
  )));
  di.registerSingleton<Talker>(Talker());
  di.registerSingleton<AudioPlayer>(AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop)
    ..audioCache = AudioCache(prefix: ''));
}