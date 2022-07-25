import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({Key? key, required this.text, required this.onClicked, required this.icon, required this.buttonWidth}) : super(key: key);

  final String text;
  final VoidCallback onClicked;
  final IconData icon;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClicked,
      style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24))),
      child: Container(
        width: MediaQuery.of(context).size.width * buttonWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              // Icons.playlist_add,
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
