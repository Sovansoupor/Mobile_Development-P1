import 'package:flutter/material.dart';
import 'jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const JokeList(),
      ),
    ));

class JokeList extends StatefulWidget {
  const JokeList({
    super.key,
  });

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  final List<Jokes> jokes = jokesDatabase;

  void toggleFavorite(Jokes joke) {
    setState(() {
      // Unmark the current favorite joke
      for (var j in jokes) {
        if (j.isFavorite) {
          j.isFavorite = false;
        }
      }

      // Mark the clicked joke as the new favorite
      joke.isFavorite = true;
    });
  }
  // bool _isFavorite = false;

  // void onFavoriteClick() {
  //   setState(() {
  //     _isFavorite = !_isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];

          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .5, color: Colors.grey),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        joke.title,
                        style: TextStyle(
                            color: appColor, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10.0),
                      Text(joke.description)
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => toggleFavorite(joke),
                  icon: Icon(
                    joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: joke.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },);
  }
}
