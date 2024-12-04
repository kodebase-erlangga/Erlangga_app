import 'package:flutter/material.dart';
import 'package:erl_app/database/db_helper.dart'; // Pastikan import DBHelper
import 'package:erl_app/view/searchScreen/dummy_carouselSlider.dart';

import '../searchScreen/trendingQuestions.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  // Memuat riwayat pencarian
  Future<void> _loadSearchHistory() async {
    final history = await DBHelper.instance.getSearchHistory();
    setState(() {
      _recentSearches = history;
    });
  }

  // Menambahkan pencarian baru
  Future<void> _addSearchHistory(String query) async {
    if (query.isNotEmpty &&
        !_recentSearches.any((item) => item['query'] == query)) {
      await DBHelper.instance.addSearchHistory(query);
      _loadSearchHistory(); // Memuat ulang riwayat setelah menambah pencarian
    }
  }

  // Membuat UI untuk halaman pencarian
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // Kembali ke halaman sebelumnya
        ),
        title: Text("Pencarian"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              controller: _searchController,
              onSubmitted: (query) {
                _addSearchHistory(
                    query); // Menambahkan pencarian baru saat di-submit
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Mau cari apa nih?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Recent Search History
            if (_recentSearches.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Pencarian Terbaru',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recentSearches.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Implement the action when a recent search is tapped
                        _searchController.text =
                            _recentSearches[index]['query'];
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            _recentSearches[index]['query'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            SizedBox(height: 20),
            Expanded(
              child: DummyCarouselSlider(),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              icon: Icon(Icons.trending_up),
              label: Text('Lihat Pertanyaan Trending'),
              onPressed: () async {
                final trendingResult = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrendingQuestions(),
                  ),
                );
                // Jika pengguna memilih pertanyaan trending, masukkan ke field pencarian
                if (trendingResult != null) {
                  _searchController.text = trendingResult;
                  _addSearchHistory(trendingResult);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
