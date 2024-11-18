class Jokes {
  String title;
  String description;
  bool isFavorite;

  Jokes(
      {required this.title,
      required this.description,
      this.isFavorite = false});

 
}

// function to generate lists
// List<Jokes> jokesDatabase = [
//   Jokes(title: 'Joke 1', description: 'This is the first joke'),
//   Jokes(title: 'Joke 2', description: 'This is the second joke'),
//   Jokes(title: 'Joke 3', description: 'This is the third joke'),
//   // Add more jokes here
// ];

List<Jokes> jokesDatabase = List.generate(
  20,
  (index) => Jokes(
    title: 'Joke $index ',
    description: 'This is the description of joke $index',
  ),
);
