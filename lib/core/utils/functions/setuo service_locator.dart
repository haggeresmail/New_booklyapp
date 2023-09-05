import 'package:bookly/Features/home/Data/Data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/Data/Data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/Data/repos/home_repos_impl.dart';
import 'package:bookly/core/utils/api_sevice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}

final getIt = GetIt.instance;
