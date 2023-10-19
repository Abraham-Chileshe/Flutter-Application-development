/*
pubspecs.yaml
------------------------
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
---------------------------

MY_NEWS_API_KEY
--------------------------------------
API = fcbf5d6272d34629a4eb05e6ceda09dc

*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: NewsList(),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final String apiKey = 'fcbf5d6272d34629a4eb05e6ceda09dc';
  final String newsApiURL =
      'https://newsapi.org/v2/top-headlines?country=US&apiKey=fcbf5d6272d34629a4eb05e6ceda09dc';

  List<dynamic> articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(newsApiURL));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        articles = data['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headlines'),
        backgroundColor: Colors.red[700],
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchNews(); // Refresh news when the button is pressed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),

            child: Text(
              'Latest News',

              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(
                    article['title'],
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(article['description']),
                  onTap: () {
                    // Navigate to a new screen to display the full article.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullArticleScreen(article: article),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FullArticleScreen extends StatelessWidget {
  final dynamic article;

  FullArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    final description = article['content'] ?? article['description'];
    final maxCharacters = 300; // Adjust the maximum character count as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
        backgroundColor: Colors.red[700],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article['urlToImage']),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                description.length > maxCharacters
                    ? '${description.substring(0,
                    maxCharacters)}...' // Truncate and add ellipsis if it's longer
                    : description,
                style: TextStyle(fontSize: 13.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
