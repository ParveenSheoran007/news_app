class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articleList;
  String? nextPage;

  NewsResponse({this.status, this.totalResults, this.articleList, this.nextPage});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      articleList = <Article>[];
      json['results'].forEach((v) {
        articleList!.add(Article.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articleList != null) {
      data['results'] = articleList!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Article {
  String? articleId;
  String? title;
  String? link;
  String? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  String? sourceUrl;
  int? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;

  Article(
      {this.articleId,
        this.title,
        this.link,
        this.videoUrl,
        this.description,
        this.content,
        this.pubDate,
        this.imageUrl,
        this.sourceId,
        this.sourceUrl,
        this.sourcePriority,
        this.country,
        this.category,
        this.language,
        this.aiTag,
        this.sentiment,
        this.sentimentStats});

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourceUrl = json['source_url'];
    sourcePriority = json['source_priority'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['title'] = title;
    data['link'] = link;

    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['source_url'] = sourceUrl;
    data['source_priority'] = sourcePriority;
    data['country'] = country;
    data['category'] = category;
    data['language'] = language;
    data['ai_tag'] = aiTag;
    data['sentiment'] = sentiment;
    data['sentiment_stats'] = sentimentStats;
    return data;
  }
}