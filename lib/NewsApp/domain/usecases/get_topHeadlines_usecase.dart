import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../repository/base_news_repository.dart';

class GetTopHeadlineArticles
    extends BaseUseCase<List<Article>, HeadlineArticleParameters> {
  final BaseNewsRepository baseNewsRepository;

  GetTopHeadlineArticles(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(
      HeadlineArticleParameters parameters) async {
    return await baseNewsRepository.getTopHeadlines(parameters);
  }
}

class HeadlineArticleParameters extends Equatable {
  final String country;
  final String category;

  const HeadlineArticleParameters(
      {required this.country, required this.category});

  @override
  List<Object> get props => [country, category];
}
