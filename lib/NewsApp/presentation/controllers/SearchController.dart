import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/domain/usecases/get_recent_articles_usecase.dart';
import '../../../core/service/serviceLocator.dart';

class SearchController extends GetxController {
  List<Article> articles = [];
  bool loading = true;
  bool error = false;
  String query = "";
  Timer? _debounce;

  setSearch(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 700), () {
      query = value;
      update();
      tryAgain();
    });
  }

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
    final result = await getRecentArticles.call(RecentArticleParameters(
        query: query,
        from:
            "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 25)))}"));
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
}
