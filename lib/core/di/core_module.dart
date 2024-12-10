import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/navigation/go_router.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:rus_bal_dict/core/utils/interceptiors.dart';
import 'package:talker/talker.dart';

final di = GetIt.instance;
const dioWithBaseUrlInstanceName = 'dioWithBaswUrl';
const dioWithoutBaseUrlInstanceName = 'dioWithoutBaswUrl';

void coreModule([CacheStore? cacheStore]) {
  di.registerSingleton<GoRouter>(AppRouter().router);
  final options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      baseUrl: balRusBaseUrl
      );

  final dio = Dio(options);
  dio.interceptors.add(RedirectInterceptor(dio));
  dio.interceptors.add(LogInterceptor(responseBody: false));
  final dioWithoutBaseUrl =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));
  dioWithoutBaseUrl.interceptors.add(RedirectInterceptor(dioWithoutBaseUrl));
  dioWithoutBaseUrl.interceptors.add(LogInterceptor(responseBody: false));
  dio.interceptors.add(LogInterceptor(responseBody: false));
  if (cacheStore != null) {
    final cacheOptions =
        CacheOptions(store: cacheStore, maxStale: const Duration(days: 3));
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }
  di.registerSingleton<Dio>(dio, instanceName: dioWithBaseUrlInstanceName);
  di.registerSingleton<Dio>(dioWithoutBaseUrl,
      instanceName: dioWithoutBaseUrlInstanceName);
  di.registerSingleton<Talker>(Talker());
  di.registerSingleton<AudioPlayer>(AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop)
    ..audioCache = AudioCache(prefix: ''));
}
