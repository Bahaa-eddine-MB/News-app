import 'package:dartz/dartz.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../usecases/get_popular_articles_usecase.dart';
import '../usecases/get_recent_articles_usecase.dart';
import '../usecases/get_topHeadlines_usecase.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, List<Article>>> getPopularArticles(
      PopularArticleParameters parameters);
  Future<Either<Failure, List<Article>>> getRecentArticles(
      RecentArticleParameters parameters);
  Future<Either<Failure, List<Article>>> getTopHeadlines(
      HeadlineArticleParameters parameters);
  Future<Either<Failure, List<Article>>> getTopTechCrunchHeadLines(
      NoParameters noParameters);
  Future<Either<Failure, List<Article>>> getwallStreetArticles(
      NoParameters noParameters);
}
