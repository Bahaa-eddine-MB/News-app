import 'package:get/get.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/domain/usecases/get_wallStreet_usecase.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import '../../../core/service/serviceLocator.dart';

class HomeDetailsController extends GetxController {
  List<Article> articles = [];
  bool loading = true;
  bool error = false;
  int selectedCategory = 0;

  void setSelectedCategory(int value) {
    selectedCategory = value;
    update();
  }

  List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
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
    final getWallStreetArticles = sl<GetWallStreetArticles>();
    final result = await getWallStreetArticles.call(const NoParameters());
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
