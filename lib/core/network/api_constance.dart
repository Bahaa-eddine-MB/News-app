class ApiConstance {
  static const String baseUrl = "https://newsapi.org/v2";
  static const String apiKey = "7c0a131cb8bf4a7994fd91180f1676aa";

  static const String topTechCrunchHeadLines =
      "$baseUrl/top-headlines?sources=techcrunch&apiKey=$apiKey";
  static const String wallStreetArticles =
      "$baseUrl/everything?domains=wsj.com&apiKey=$apiKey";

  static String allArticlesByPopularity(String query, String from, String to) =>
      "$baseUrl/everything?q=$query&from=$from&to=$to&sortBy=popularity&apiKey=$apiKey";

  static String allArticlesByRecent(String query, String from) =>
      "$baseUrl/everything?q=$query&from=$from&sortBy=publishedAt&apiKey=$apiKey";

  static String topHeadLines(String country,String category) =>
      "$baseUrl/top-headlines?country=$country&category=$category&apiKey=$apiKey";
}
