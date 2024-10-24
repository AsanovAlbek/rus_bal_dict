import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rus_bal_dict/core/constants/config.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/feature/word_detail/data/repository/detail_repository_impl.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/repository/detail_repository.dart';

final di = GetIt.I;
void detailModule(EnvironmentConfig config) {
  di.registerSingleton<DetailRepository>(DetailRepositoryImpl(
      dio: di<Dio>(instanceName: dioWithBaseUrlInstanceName)));
}
