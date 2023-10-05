import 'package:dio/dio.dart';
import 'package:news_app/NewsApp/data/models/ArticleModel.dart';
import 'package:news_app/NewsApp/domain/usecases/get_popular_articles_usecase.dart';
import 'package:news_app/NewsApp/domain/usecases/get_recent_articles_usecase.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_topHeadlines_usecase.dart';

abstract class BaseNewsRemoteDataSource {
  Future<List<ArticleModel>> getPopularArticles(
      PopularArticleParameters parameters);
  Future<List<ArticleModel>> getRecentArticles(
      RecentArticleParameters parameters);
  Future<List<ArticleModel>> getTopHeadlines(
      HeadlineArticleParameters parameters);
  Future<List<ArticleModel>> getTopTechCrunchHeadLines(
      NoParameters noParameters);
  Future<List<ArticleModel>> getwallStreetArticles(NoParameters noParameters);
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  @override
  Future<List<ArticleModel>> getPopularArticles(parameters) async {
    final response = await Dio().get(ApiConstance.allArticlesByPopularity(
        parameters.query, parameters.from, parameters.to));
    if (response.statusCode == 200) {
      return List<ArticleModel>.from((response.data["articles"] as List).map(
        (e) => ArticleModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ArticleModel>> getRecentArticles(parameters) async {
    final response = await Dio().get(
        ApiConstance.allArticlesByRecent(parameters.query, parameters.from));
    if (response.statusCode == 200) {
      return List<ArticleModel>.from((response.data["articles"] as List).map(
        (e) => ArticleModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ArticleModel>> getTopHeadlines(parameters) async {
    final response = await Dio().get(
        ApiConstance.topHeadLines(parameters.country, parameters.category));
    if (response.statusCode == 200) {
      return List<ArticleModel>.from((response.data["articles"] as List).map(
        (e) => ArticleModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ArticleModel>> getTopTechCrunchHeadLines(
      NoParameters noParameters) async {
    final response = await Dio().get(ApiConstance.topTechCrunchHeadLines);
    if (response.statusCode == 200) {
      return List<ArticleModel>.from((response.data["articles"] as List).map(
        (e) => ArticleModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ArticleModel>> getwallStreetArticles(
      NoParameters noParameters) async {
    final response = await Dio().get(ApiConstance.wallStreetArticles);
    if (response.statusCode == 200) {
      return List<ArticleModel>.from((response.data["articles"] as List).map(
        (e) => ArticleModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
