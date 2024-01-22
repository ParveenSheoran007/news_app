import 'package:flutter/material.dart';
import 'package:news_app/news_details_screen.dart';
import 'package:news_app/news_resopns.dart';
import 'package:news_app/news_screen.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<Article>? articleList;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    NewsApiService newsApiService = NewsApiService();
    NewsResponse newsResponse = await newsApiService.getNews();
    setState(() {
      articleList = newsResponse.articleList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Ajatak', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: _buildNewsList(),
      ),
    );
  }

  Widget _buildNewsList() {
    return articleList != null
        ? ListView.builder(
      itemCount: articleList!.length,
      itemBuilder: (context, index) {
        Article article = articleList![index];

        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(article: article),
                ),
              );
            },
            title: Text(
              article.title ?? '',
              style:const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(article.description ?? ''),
            trailing: _buildThumbnail(article.imageUrl),
          ),
        );
      },
    )
        : const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildThumbnail(String? imageUrl) {
    return imageUrl != null
        ? ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    )
        : const SizedBox(width: 60);
  }
}
