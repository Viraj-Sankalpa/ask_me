import 'package:flutter/material.dart';

import 'home.dart';

class ArticleSearchDelegate extends SearchDelegate<Article> {
  final List<Article> articles;

  ArticleSearchDelegate(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Article.none());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = articles
        .where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results[index].title),
          subtitle: Text(results[index].author),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = articles
        .where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results[index].title),
          subtitle: Text(results[index].author),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }
}