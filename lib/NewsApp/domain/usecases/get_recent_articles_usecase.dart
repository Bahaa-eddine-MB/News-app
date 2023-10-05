import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../repository/base_news_repository.dart';

class GetRecentArticles
    extends BaseUseCase<List<Article>, RecentArticleParameters> {
  final BaseNewsRepository baseNewsRepository;

  GetRecentArticles(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(RecentArticleParameters parameters) async {
    return await baseNewsRepository.getRecentArticles(parameters);
  }
}

class RecentArticleParameters extends Equatable {
  final String query;
  final String from;

  const RecentArticleParameters(
      {required this.query, required this.from});

  @override
  List<Object> get props => [query,from];
}
