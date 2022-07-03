import 'package:flutter/material.dart';

import '../../features/jogo_da_velha/presentation/controllers/game_methods.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Jogue novamente!',
              ),
            ),
          ],
        );
      });
}
