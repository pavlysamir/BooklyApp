import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/repo_data_sources/home_local_data_source.dart';
import '../../Features/home/data/repo_data_sources/home_remote_data_source.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../main.dart';
import '../utils/api_services.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(Dio()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiServices>(),
      ),
    ),
  );
}
