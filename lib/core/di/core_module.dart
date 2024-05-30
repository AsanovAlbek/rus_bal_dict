import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/navigation/go_router.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:talker/talker.dart';

final di = GetIt.instance;

void coreModule(CacheStore cacheStore) {

  final options = BaseOptions(
    //baseUrl: 'http://192.168.177.2:8000/',
    baseUrl: baseUrl
    //baseUrl: balRusBaseUrl
  );



  final cacheOptions = CacheOptions(store: cacheStore, maxStale: const Duration(days: 3));
  
  final dio = Dio(options)..interceptors.add(DioCacheInterceptor(options: cacheOptions));

  di.registerSingleton<GoRouter>(AppRouter().router);
  di.registerSingleton<Dio>(dio);
  di.registerSingleton<Talker>(Talker());
  di.registerSingleton<AudioPlayer>(AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop)
    ..audioCache = AudioCache(prefix: ''));
}