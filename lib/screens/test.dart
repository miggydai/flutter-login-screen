import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(TestWidget());

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    final response = await get(
        Uri.parse(
            'https://www.freetogame.com/api/games?platform=browser&category=mmorpg&sort-by=release-date'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        });
    if (response.statusCode == 200) {
      setState(() {
        games = json.decode(response.body) as List<dynamic>;
      });
    } else {
      throw Exception('Failed to fetch games');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Free PC Games'),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: games
                .take(20)
                .map(
                  (game) => Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          game['thumbnail'],
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            game['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            game['short_description'],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
