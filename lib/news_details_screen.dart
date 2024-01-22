import 'package:flutter/material.dart';
import 'package:news_app/news_resopns.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'News Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(article.imageUrl),
              SizedBox(height: 16),
              DetailRow('Pub Date', article.pubDate),
              DetailRow('Article ID', article.articleId),
              DetailRow('Content', article.content),
              DetailRow('Description', article.description),
              DetailRow('Title', article.title),
              DetailRow('Source URL', article.sourceUrl, isLink: true),
              DetailRow('AI Tag', article.aiTag),
              DetailRow('Sentiment', article.sentiment),
              DetailRow('Sentiment Stats', article.sentimentStats),
              DetailRow('Video URL', article.videoUrl, isLink: true),
              DetailRow('Link', article.link, isLink: true),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl ?? '',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget DetailRow(String label, String? value, {bool isLink = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        isLink
            ? GestureDetector(
          onTap: () {
            // Handle link tap
          },
          child: Text(
            value ?? '',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        )
            : Text(
          value ?? '',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
