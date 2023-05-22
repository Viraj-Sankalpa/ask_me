import 'package:flutter/material.dart';
import 'article_details_page.dart';

class Article {
  final String title;
  final String author;
  final String description;

  Article(
      {required this.title, required this.author, required this.description});

  Article.none() : this(title: '', author: '', description: '');
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Article> articles = [
    Article(
        title: "The Power of AI in Software Development",
        author: "John Doe",
        description:
            "Learn about the benefits of using AI in software development."),
    Article(
        title: "How Flutter is Revolutionizing Cross-Platform Development",
        author: "Jane Smith",
        description:
            "Discover how Flutter is making cross-platform development easier than ever before."),
    Article(
        title: "The Future of AI-Assisted Development",
        author: "Bob Johnson",
        description:
            "Explore what the future holds for AI-assisted development and how it will impact the industry.")
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ArticleSearchDelegate(articles),
                useRootNavigator: true,
              ).then((article) {
                if (article!.title == "") {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailsPage(
                      title: article.title,
                      author: article.author,
                      content: article.description,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(articles[index].title),
            subtitle: Text(articles[index].author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailsPage(
                    title: articles[index].title,
                    author: articles[index].author,
                    content: articles[index].description,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}