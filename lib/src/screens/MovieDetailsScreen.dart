import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/watch_list_provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> movie;

  MovieDetailsScreen({required this.movie});

  @override
  _MovieDetailsScreenState createState() =>
      _MovieDetailsScreenState(movie: movie);
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final Map<String, dynamic> movie;
  double userRating = 0;
  TextEditingController reviewController = TextEditingController();
  List<Map<String, String>> reviews = [
    {'name': 'Ali', 'comment': 'Awesome movie!', 'rating': '4.0'},
    {'name': 'Sara', 'comment': 'I loved it!', 'rating': '4.5'},
    {'name': 'Mohammed', 'comment': 'Decent', 'rating': '3.5'},
  ];

  _MovieDetailsScreenState({required this.movie});

  double calculateAverageRating() {
    if (reviews.isEmpty) {
      return 0;
    }

    double sum = 0;
    for (var review in reviews) {
      sum += double.parse(review['rating'] ?? '0');
    }

    return sum / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    double averageRating = calculateAverageRating();

    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              movie['title'],
              style: GoogleFonts.alata(fontSize: 28),
            ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['image'],
                width: MediaQuery.of(context).size.width),
            SizedBox(height: 10),
            Text(movie['title'],
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Rating: ${movie['rating']}',
                style: TextStyle(color: Colors.grey)),
            Text('Genre: ${movie['genre']}',
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text(movie['description'],
                style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20),
            Divider(color: Colors.grey, height: 1),
            SizedBox(height: 10),
            Text(
              'Reviews:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: averageRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              ignoreGestures: true,
              onRatingUpdate: (double value) {},
            ),
            SizedBox(width: 5),
            for (var review in reviews)
              ListTile(
                title: Text(
                  review['name'] ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating: ${review['rating'] ?? 0}',
                        style: TextStyle(color: Colors.grey)),
                    Text(review['comment'] ?? '',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Add Your Review:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  userRating = rating;
                });
              },
            ),
            TextField(
              controller: reviewController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your review',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                String review = reviewController.text;
                if (review.isNotEmpty && userRating > 0) {
                  setState(() {
                    reviews.add({
                      'name': 'You',
                      'comment': review,
                      'rating': userRating.toString(),
                    });
                    reviewController.clear();
                    userRating = 0;
                  });
                }
              },
              child: Text('Submit Review'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                _addToWatchList(context);
                Navigator.of(context).pop();
              },
              child: const Text('Add to Watch List'),
            )
          ],
        ),
      ),
    );
  }

  void _addToWatchList(BuildContext context) {
    final watchListProvider =
        Provider.of<WatchListProvider>(context, listen: false);
    watchListProvider.addToWatchList(movie);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${movie['title']} added to Watch List'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
