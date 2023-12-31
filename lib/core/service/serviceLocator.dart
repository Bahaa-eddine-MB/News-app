import 'package:get_it/get_it.dart';
import 'package:news_app/NewsApp/data/repository/news_repository.dart';
import 'package:news_app/NewsApp/domain/usecases/get_popular_articles_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_recent_articles_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_topHeadlines_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_topcrunch_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_wallStreet_usecase.dart';
import '../../NewsApp/data/datasource/news_remote_datasource.dart';
import '../../NewsApp/domain/repository/base_news_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    /// Use Cases
    sl.registerLazySingleton(() => GetPopularArticles(sl()));
    sl.registerLazySingleton(() => GetRecentArticles(sl()));
    sl.registerLazySingleton(() => GetTopCrunchArticles(sl()));
    sl.registerLazySingleton(() => GetTopHeadlineArticles(sl()));
    sl.registerLazySingleton(() => GetWallStreetArticles(sl()));

    /// Repository
    sl.registerLazySingleton<BaseNewsRepository>(
        () => NewsRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseNewsRemoteDataSource>(
        () => NewsRemoteDataSource());
  }
}
