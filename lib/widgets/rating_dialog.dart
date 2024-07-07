import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double rating = 0;
  TextEditingController _suggestionC = TextEditingController();
  String _selectedOption = 'Sound Quality'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate this app'),
      content: SingleChildScrollView(
        // Wrap content with SingleChildScrollView
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 25),
            Text('Select an area for feedback:'),
            RadioListTile(
              title: Text('Sound Quality'),
              value: 'Sound Quality',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('User Interface'),
              value: 'User Interface',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('Performance'),
              value: 'Performance',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('Content'),
              value: 'Content',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value as String;
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _suggestionC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your suggestion',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thank you for your feedback on $_selectedOption!',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('OK'),
        )
      ],
    );
  }
}
