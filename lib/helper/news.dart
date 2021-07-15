import 'dart:convert';

import 'package:whosaid_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = [];
  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=ng&apiKey=4edcd0035e76454d9324092cd5b8f71d";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if( jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] !=null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
              author: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['context'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
class CategoryNewsClass {

  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{

    String url = "https://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=4edcd0035e76454d9324092cd5b8f71d";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if( jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] !=null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}