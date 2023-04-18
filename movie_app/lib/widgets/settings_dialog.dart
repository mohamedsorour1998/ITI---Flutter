//  Widget to show settings dialog for sorting movies.
import 'package:flutter/material.dart';

Future<String?> showSettingsDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Sort by'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'popular'),
            child: const Text('Most Popular'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'top_rated'),
            child: const Text('Top Rated'),
          ),
        ],
      );
    },
  );
}
