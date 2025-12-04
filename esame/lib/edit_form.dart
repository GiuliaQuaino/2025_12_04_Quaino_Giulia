import 'package:flutter/material.dart';
import 'review.dart';

class EditForm extends StatefulWidget {
  final Review? review;

  const EditForm({super.key, this.review});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  String title = '';
  String comment = '';
  int rating = 1;

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      title = widget.review!.title;
      comment = widget.review!.comment ?? '';
      rating = widget.review!.rating;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.review == null ? 'Nuova Recensione' : 'Modifica Recensione'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Titolo'),
            onChanged: (val) => title = val,
            controller: TextEditingController(text: title),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Commento (opzionale)'),
            onChanged: (val) => comment = val,
            controller: TextEditingController(text: comment),
          ),
          const SizedBox(height: 8),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => rating = 1),
              child: const Text('1'),

            ),
            ElevatedButton(
              onPressed: () => setState(() => rating = 2),
              child: const Text('2'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => rating = 3),
              child: const Text('3'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => rating = 4),
              child: const Text('4'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => rating = 5),
              child: const Text('5'),
            ),
          ],
        )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              'title': title,
              'comment': comment,
              'rating': rating,
            });
          },
          child: const Text('Salva'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annulla'),
        ),
      ],
    );
  }
}
