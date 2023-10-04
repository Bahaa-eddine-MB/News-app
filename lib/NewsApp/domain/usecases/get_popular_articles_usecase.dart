import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../repository/base_news_repository.dart';

class GetPopularArticles
    extends BaseUseCase<List<Article>, PopularArticleParameters> {
  final BaseNewsRepository baseNewsRepository;

  GetPopularArticles(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(PopularArticleParameters parameters) async {
    return await baseNewsRepository.getPopularArticles(parameters);
  }
}

class PopularArticleParameters extends Equatable {
  final String query;
  final String from;
  final String to;

  const PopularArticleParameters(
      {required this.query, required this.from, required this.to});

  @override
  List<Object> get props => [query,from,to];
}
