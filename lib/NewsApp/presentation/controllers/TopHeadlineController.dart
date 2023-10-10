import 'package:get/get.dart';
import 'package:news_app/NewsApp/domain/usecases/get_topHeadlines_usecase.dart';
import 'package:news_app/NewsApp/presentation/controllers/HomeDetailsController.dart';

import '../../../core/service/serviceLocator.dart';
import '../../domain/entities/Article.dart';

class TopHeadlinesController extends GetxController {
  final HomeDetailsController homeDetailsController;
  List<Article> articles = [];
  bool loading = true;
  bool error = false;
  String category = "";
  TopHeadlinesController() : homeDetailsController = Get.find() {
    category = homeDetailsController
        .categories[homeDetailsController.selectedCategory];
  }
  List<Country> countries = [
    Country("United Arab Emirates", "ae"),
    Country("Argentina", "ar"),
    Country("Austria", "at"),
    Country("Australia", "au"),
    Country("Belgium", "be"),
    Country("Bulgaria", "bg"),
    Country("Brazil", "br"),
    Country("Canada", "ca"),
    Country("Switzerland", "ch"),
    Country("China", "cn"),
    Country("Colombia", "co"),
    Country("Cuba", "cu"),
    Country("Czech Republic", "cz"),
    Country("Germany", "de"),
    Country("Egypt", "eg"),
    Country("France", "fr"),
    Country("United Kingdom", "gb"),
    Country("Greece", "gr"),
    Country("Hong Kong", "hk"),
    Country("Hungary", "hu"),
    Country("Indonesia", "id"),
    Country("Ireland", "ie"),
    Country("India", "in"),
    Country("Italy", "it"),
    Country("Japan", "jp"),
    Country("South Korea", "kr"),
    Country("Lithuania", "lt"),
    Country("Latvia", "lv"),
    Country("Morocco", "ma"),
    Country("Mexico", "mx"),
    Country("Malaysia", "my"),
    Country("Nigeria", "ng"),
    Country("Netherlands", "nl"),
    Country("Norway", "no"),
    Country("New Zealand", "nz"),
    Country("Philippines", "ph"),
    Country("Poland", "pl"),
    Country("Portugal", "pt"),
    Country("Romania", "ro"),
    Country("Serbia", "rs"),
    Country("Russia", "ru"),
    Country("Saudi Arabia", "sa"),
    Country("Sweden", "se"),
    Country("Singapore", "sg"),
    Country("Slovenia", "si"),
    Country("Slovakia", "sk"),
    Country("Thailand", "th"),
    Country("Turkey", "tr"),
    Country("Taiwan", "tw"),
    Country("Ukraine", "ua"),
    Country("United States", "us"),
    Country("Venezuela", "ve"),
    Country("South Africa", "za"),
  ];

  String country = "us";

  void setCountry(String value) {
    country = value;
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
    final getTopHeadlineArticles = sl<GetTopHeadlineArticles>();
    final result = await getTopHeadlineArticles.call(
        HeadlineArticleParameters(category: category, country: country));
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

class Country {
  String name;
  String code;

  Country(this.name, this.code);
}
