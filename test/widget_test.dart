import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:untitled8/src/providers/watch_list_provider.dart';
import 'package:untitled8/src/screens/auth_screen.dart';
import 'package:untitled8/src/screens/onboarding_screen.dart';
import 'package:untitled8/src/screens/watch_list.dart';

void main() {
  testWidgets('AuthScreen should render correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: AuthScreen()));

    // Verify if the "MovieWhisper" text is present.
    expect(find.text('MovieWhisper'), findsOneWidget);

    // Verify if the "Get The Best Movie Recommendations" text is present.
    expect(find.text('Get The Best Movie Recommendations'), findsOneWidget);

    // Verify if both login and register buttons are present.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  test('WatchListProvider should add and remove movies correctly', () {
    // Create an instance of WatchListProvider
    final watchListProvider = WatchListProvider();

    // Define sample movie data
    final movie = {
      'title': 'Test Movie',
      'image': 'https://example.com/test.jpg',
      'rating': 7.0,
      'genre': 'Test/Comedy',
      'description': 'This is a test movie for unit testing.',
    };

    // Verify initial state
    expect(watchListProvider.watchList, isEmpty);

    // Add a movie to the watchlist
    watchListProvider.addToWatchList(movie);

    // Verify if the movie is added correctly
    expect(watchListProvider.watchList, [movie]);

    // Remove the movie from the watchlist
    watchListProvider.removeFromWatchList(movie);

    // Verify if the movie is removed correctly
    expect(watchListProvider.watchList, isEmpty);
  });

  testWidgets('WatchListScreen UI Test', (WidgetTester tester) async {
    // Create a WatchListProvider for testing
    final watchListProvider = WatchListProvider();
    // Add some movies to the watch list for testing
    watchListProvider.addToWatchList({
      'title': 'Movie 1',
      'rating': 8.0,
      // Add more details as needed
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: watchListProvider,
          child: WatchListScreen(),
        ),
      ),
    );

    // Verify that the 'Movie Whisper' title is rendered.
    expect(find.text('Movie Whisper'), findsOneWidget);

    // Verify the presence of key UI elements.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Watch list'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Verify the presence of the watch list movie.
    expect(find.text('Movie 1'), findsOneWidget);
    expect(find.text('Rating: 8.0'), findsOneWidget);

    // Tap on the delete icon and wait for the SnackBar.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify that the movie is removed from the watch list.
    expect(find.text('Movie 1 Removed from Watch List'), findsOneWidget);
    expect(find.text('Movie 1'), findsNothing);
  });

  testWidgets('OnboardingScreen should render correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));

    // Verify if the "Welcome to Movie Whisper!" text is present.
    expect(find.text('Welcome to Movie Whisper!'), findsOneWidget);

    // Verify if the "Discover New movies with Movie Whisper. Lets get started!" text is present.
    expect(
        find.text('Discover New movies with Movie Whisper. Lets get started!'),
        findsOneWidget);

    // Verify if the Continue button is present.
    expect(find.text('Continue'), findsOneWidget);
  });
}
