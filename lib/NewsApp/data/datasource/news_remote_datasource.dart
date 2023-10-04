import 'package:dio/dio.dart';
import 'package:news_app/NewsApp/data/models/ArticleModel.dart';
import 'package:news_app/NewsApp/domain/usecases/get_popular_articles_usecase.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseNewsRemoteDataSource {
  Future<List<ArticleModel>> getPopularArticles(
      PopularArticleParameters parameters);
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
}
