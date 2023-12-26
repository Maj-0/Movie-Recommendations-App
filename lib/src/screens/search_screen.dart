import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/src/screens/watch_list.dart';

import '../providers/watch_list_provider.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> movies = [
    {
      'title': 'Doctor Strange',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_.jpg',
      'rating': 7.5,
      'genre': 'Fantasy/Sci-fi',
      'description':
          'Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse.'
    },
    {
      'title': 'Fantastic Beasts',
      'image':
          'https://artofthemovies.co.uk/cdn/shop/products/IMG_0655-1_1200x1200.jpg?v=1649693906',
      'rating': 6.8,
      'genre': 'Adventure/Fantasy',
      'description':
          'Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald\'s growing legion of followers.'
    },
    {
      'title': 'Inception',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
      'rating': 8.8,
      'genre': 'Sci-fi/Thriller',
      'description':
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'
    },
    {
      'title': 'The Shawshank Redemption',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
      'rating': 9.3,
      'genre': 'Drama',
      'description':
          'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'
    },
    {
      'title': 'The Dark Knight',
      'image':
          'https://musicart.xboxlive.com/7/abb02f00-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
      'rating': 9.0,
      'genre': 'Action/Crime',
      'description':
          'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.'
    },
    {
      'title': 'Interstellar',
      'image':
          'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
      'rating': 8.6,
      'genre': 'Sci-fi/Adventure',
      'description':
          "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."
    },
    {
      'title': 'The Matrix',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
      'rating': 8.7,
      'genre': 'Action/Sci-fi',
      'description':
          'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.'
    },
    {
      'title': 'Avatar',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_.jpg',
      'rating': 7.8,
      'genre': 'Action/Adventure',
      'description':
          'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.'
    },
    {
      'title': 'Forrest Gump',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg',
      'rating': 8.8,
      'genre': 'Drama/Romance',
      'description':
          'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75.'
    },
    {
      'title': 'Gladiator',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
      'rating': 8.5,
      'genre': 'Action/Drama',
      'description':
          'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.'
    },
    {
      'title': 'Pulp Fiction',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
      'rating': 8.9,
      'genre': 'Crime/Drama',
      'description':
          'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'
    },
    {
      'title': 'Fight Club',
      'image':
          'https://m.media-amazon.com/images/I/71YFxhhSRPL._AC_UF1000,1000_QL80_.jpg',
      'rating': 8.8,
      'genre': 'Drama',
      'description':
          'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.'
    },
    {
      'title': 'Jurassic Park',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_FMjpg_UX1000_.jpg',
      'rating': 8.1,
      'genre': 'Adventure/Sci-Fi',
      'description':
          "A pragmatic paleontologist visiting an almost complete theme park is tasked with protecting a couple of kids after a power failure causes the park's cloned dinosaurs to run loose."
    },
    {
      'title': 'The Lion King',
      'image':
          'https://lumiere-a.akamaihd.net/v1/images/p_thelionking_19752_1_0b9de87b.jpeg?region=0%2C0%2C540%2C810',
      'rating': 8.5,
      'genre': 'Animation/Drama',
      'description':
          'A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.'
    },
    {
      'title': 'The Godfather',
      'image':
          'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
      'rating': 9.2,
      'genre': 'Crime/Drama',
      'description':
          'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'
    },
    {
      'title': 'Titanic',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg',
      'rating': 7.8,
      'genre': 'Drama/Romance',
      'description':
          'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'
    },
    {
      'title': 'The Avengers',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
      'rating': 8.0,
      'genre': 'Action/Adventure',
      'description':
          "Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity."
    },
    {
      'title': 'The Lord of the Rings: The Return of the King',
      'image':
          'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
      'rating': 8.9,
      'genre': 'Action/Adventure',
      'description':
          "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."
    },
    {
      'title': 'Star Wars: Episode IV - A New Hope',
      'image':
          'https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_.jpg',
      'rating': 8.6,
      'genre': 'Action/Adventure',
      'description':
          "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader."
    },
    {
      'title': 'Back to the Future',
      'image':
          'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg',
      'rating': 8.5,
      'genre': 'Adventure/Comedy',
      'description':
          'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.'
    },
    {
      'title': 'Saving Private Ryan',
      'image':
          'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg',
      'rating': 8.6,
      'genre': 'Drama/War',
      'description':
          'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.'
    },
    {
      'title': 'Spirited Away',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
      'rating': 8.6,
      'genre': 'Animation/Adventure',
      'description':
          "During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts."
    }
  ];

  List<Map<String, dynamic>> filteredMovies = [];

  @override
  void initState() {
    filteredMovies = List.from(movies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text(
          'Movie Whisper ',
          style: GoogleFonts.abrilFatface(
            color: Colors.deepPurpleAccent,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            'Search',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                _searchMovies(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF131313),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WatchListScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          if (index == 1) {}
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

  void _searchMovies(String query) {
    setState(() {
      filteredMovies = movies
          .where((movie) =>
              movie['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        return ListTile(
          title: Text(
            movie['title'],
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                'Rating: ${movie['rating']}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onTap: () => _showMovieDetails(context, movie),
        );
      },
    );
  }

  void _showMovieDetails(BuildContext context, Map<String, dynamic> movie) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(movie['image'],
                    width: MediaQuery.of(context).size.width * 0.3),
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
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    _addToWatchList(context, movie);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add to Watch List'),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xFF1C1C1E),
        );
      },
    );
  }

  void _addToWatchList(BuildContext context, Map<String, dynamic> movie) {
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
