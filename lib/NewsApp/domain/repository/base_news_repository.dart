import 'package:dartz/dartz.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import '../../../core/error/failure.dart';
import '../usecases/get_popular_articles_usecase.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, List<Article>>> getPopularArticles(PopularArticleParameters parameters);
}
