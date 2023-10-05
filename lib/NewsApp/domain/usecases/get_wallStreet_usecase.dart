import 'package:dartz/dartz.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../repository/base_news_repository.dart';

class GetWallStreetArticles extends BaseUseCase<List<Article>, NoParameters> {
  final BaseNewsRepository baseNewsRepository;

  GetWallStreetArticles(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<Article>>> call(NoParameters parameters) async {
    return await baseNewsRepository.getwallStreetArticles(parameters);
  }
}
