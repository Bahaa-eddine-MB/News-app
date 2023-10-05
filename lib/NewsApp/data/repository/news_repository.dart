import 'package:dartz/dartz.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/domain/usecases/get_recent_articles_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_topHeadlines_usecase.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/repository/base_news_repository.dart';
import '../../domain/usecases/get_popular_articles_usecase.dart';
import '../datasource/news_remote_datasource.dart';

class NewsRepository extends BaseNewsRepository {
  final BaseNewsRemoteDataSource baseNewsRemoteDataSource;

  NewsRepository(this.baseNewsRemoteDataSource);

  @override
  Future<Either<Failure, List<Article>>> getPopularArticles(
      PopularArticleParameters parameters) async {
    final result =
        await baseNewsRemoteDataSource.getPopularArticles(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getRecentArticles(
      RecentArticleParameters parameters) async {
    final result = await baseNewsRemoteDataSource.getRecentArticles(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getTopHeadlines(
      HeadlineArticleParameters parameters) async {
    final result = await baseNewsRemoteDataSource.getTopHeadlines(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getTopTechCrunchHeadLines(
      NoParameters noParameters) async {
    final result =
        await baseNewsRemoteDataSource.getTopTechCrunchHeadLines(noParameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getwallStreetArticles(
      NoParameters noParameters) async {
    final result =
        await baseNewsRemoteDataSource.getwallStreetArticles(noParameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
