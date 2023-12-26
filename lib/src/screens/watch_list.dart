import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';


import 'package:untitled8/src/screens/search_screen.dart';

import '../providers/watch_list_provider.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

class WatchListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watchListProvider = Provider.of<WatchListProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text(
          'Movie Whisper',
          style: GoogleFonts.abrilFatface(
            color: Colors.deepPurpleAccent,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildWatchList(watchListProvider.watchList),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF131313),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Watch list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildWatchList(List<Map<String, dynamic>> watchList) {
    if (watchList.isEmpty) {
      return Center(
        child: Text(
          'Your watch list is empty.',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: watchList.length,
        itemBuilder: (context, index) {
          final movie = watchList[index];
          return Card(
            color: Color(0xFF2C2C2E),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                movie['title'],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Rating: ${movie['rating']}',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  _removeFromWatchList(context, movie);
                },
              ),
            ),
          );
        },
      );
    }
  }

  void _removeFromWatchList(BuildContext context, Map<String, dynamic> movie) {
    final watchListProvider =
        Provider.of<WatchListProvider>(context, listen: false);
    watchListProvider.removeFromWatchList(movie);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${movie['title']} Removed from Watch List'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
