import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/constants/config.dart';
import 'package:rus_bal_dict/core/navigation/go_router.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:talker/talker.dart';

final di = GetIt.instance;

void coreModule(EnvironmentConfig config, [CacheStore? cacheStore]) {
  di.registerSingleton<GoRouter>(AppRouter(config).router);
  final baseUrl = config.apiUrl;
  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    //baseUrl: reserveApiUrl,
    //baseUrl: testBaseUrl,
    baseUrl: baseUrl
    //baseUrl: balRusBaseUrl
  );
  
  final dio = Dio(options);
  if (cacheStore != null) {
    final cacheOptions = CacheOptions(store: cacheStore, maxStale: const Duration(days: 3));
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }
  di.registerSingleton<Dio>(dio);
  di.registerSingleton<Talker>(Talker());
  di.registerSingleton<AudioPlayer>(AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop)
    ..audioCache = AudioCache(prefix: ''));
}