import 'package:get/get.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/domain/usecases/get_popular_articles_usecase.dart';
import '../../../core/service/serviceLocator.dart';
import 'package:intl/intl.dart';

class PopulerArticlesController extends GetxController {
  List<Article> articles = [];
  bool loading = true;
  bool error = false;
  String query = "Palestine";

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
    final getPopularArticles = sl<GetPopularArticles>();
    final result = await getPopularArticles.call(PopularArticleParameters(
        query: query,
        from:
            "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 25)))}",
        to: "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1)))}"));
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