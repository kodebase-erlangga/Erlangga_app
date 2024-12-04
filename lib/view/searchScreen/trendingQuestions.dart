import 'package:flutter/material.dart';
import 'package:erl_app/database/db_helper.dart';

class TrendingQuestions extends StatefulWidget {
  @override
  _TrendingQuestionsState createState() => _TrendingQuestionsState();
}

class _TrendingQuestionsState extends State<TrendingQuestions> {
  List<Map<String, dynamic>> _trendingQuestions = [];

  @override
  void initState() {
    super.initState();
    _fetchTrendingQuestions();
  }

  // Memuat data pertanyaan trending dari database
  Future<void> _fetchTrendingQuestions() async {
    final questions = await DBHelper.instance.getTrendingSearchQueries();
    setState(() {
      _trendingQuestions = questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Questions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Pertanyaan Trending',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // List of Trending Questions
            Expanded(
              child: _trendingQuestions.isNotEmpty
                  ? ListView.builder(
                      itemCount: _trendingQuestions.length,
                      itemBuilder: (context, index) {
                        final question = _trendingQuestions[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            question['query'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '${question['frequency']} pencarian',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          onTap: () {
                            Navigator.pop(context, question['query']);
                          },
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Belum ada pertanyaan trending.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
