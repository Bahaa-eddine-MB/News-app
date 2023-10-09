import 'package:get/get.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/domain/usecases/get_recent_articles_usecase.dart';
import '../../../core/service/serviceLocator.dart';

class SearchController extends GetxController {
  List<Article> articles = [];
  bool loading = true;
  bool error = false;
  String query = "";

  setLoading(bool value) {
    loading = value;
    update();
  }

  setError(bool value) {
    error = value;
    update();
  }

  fetchData() async {
    setLoading(true);
    articles.clear();
    final getRecentArticles = sl<GetRecentArticles>();
    final result = await getRecentArticles
        .call(RecentArticleParameters(query: query, from: "2023-09-09"));
    result.fold((l) {
      setLoading(false);
      setError(true);
    }, (r) async {
      articles = List.from(r);
      update();
      setLoading(false);
    });
  }

  void tryAgain() {
    fetchData();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
