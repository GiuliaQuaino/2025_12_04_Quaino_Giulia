import 'package:flutter/material.dart';
import 'review.dart';
import 'edit_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Review> reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews")),
      body: Center(
        child: Column(
          children: [
            if (reviews.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("No reviews"),
              ),
            for (int i = 0; i < reviews.length; i++)
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(reviews[i].title),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _openForm(review: reviews[i], index: i);
                      },
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    Text("Rating: ${reviews[i].rating}"),
                    Text(reviews[i].comment ?? ''),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openForm({Review? review, int? index}) async {
  final Map<String, Object?>? result = await showDialog<Map<String, Object?>>(
    context: context,
    builder: (context) => EditForm(review: review),
  );

  if (result != null) {
    setState(() {
      Review newReview = Review(
        title: result['title'] as String,
        comment: result['comment'] as String?,
        rating: result['rating'] as int,
      );

      if (index != null) {
        reviews[index] = newReview;
      } else {
        reviews.add(newReview);
      }
    });
  }
}
}









/*import 'package:flutter/material.dart';
import 'review.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Review> reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews")),
      body: Center(
        child: Column(
          children: [
            if (reviews.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("No reviews"),
              ),
            for (int i = 0; i < reviews.length; i++)
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(reviews[i].title),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _openForm(review: reviews[i], index: i);
                    },
                  ),
                ],
              ),
              subtitle: Column(
                children: [
                  Text("Rating: ${reviews[i].rating}"),
                  Text(reviews[i].comment ?? ''),
                ],
              ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openForm();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

Future<void> _openForm({Review? review, int? index}) async {
  // variabili temporanee
  String tempTitle = review?.title ?? "";
  String tempComment = review?.comment ?? "";
  int selectedRating = review?.rating ?? 1;

  final Review? result = await showDialog<Review>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(review == null ? "Nuova Recensione" : "Modifica Recensione"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Titolo"),
            onChanged: (value) => tempTitle = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Commento (opzionale)"),
            onChanged: (value) => tempComment = value,
          ),
          const SizedBox(height: 8),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => selectedRating = 1),
              child: const Text("1"),
            ),
            ElevatedButton(
              onPressed: () => setState(() => selectedRating = 2),
              child: const Text("2"),
            ),
            ElevatedButton(
              onPressed: () => setState(() => selectedRating = 3),
              child: const Text("3"),
            ),
            ElevatedButton(
              onPressed: () => setState(() => selectedRating = 4),
              child: const Text("4"),
            ),
            ElevatedButton(
              onPressed: () => setState(() => selectedRating = 5),
              child: const Text("5"),
            ),
          ],
        ),],
        //Text("Rating: $selectedRating"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
                context,
                Review(
                  title: tempTitle,
                  comment: tempComment,
                  rating: selectedRating,
                ));
          },
          child: const Text("Salva"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Annulla"),
        ),
      ],
    ),
  );

  if (result != null) {
    setState(() {
      if (index != null) {
        reviews[index] = result;
      } else {
        reviews.add(result);
      }
    });
  }
}
}
*/