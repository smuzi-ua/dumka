import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentCardComponent extends StatelessWidget {
  final String name;
  final String comment;

  const CommentCardComponent(
      this.name, this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: <Widget>[
          const Spacer(),
          Text(
            name,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontSize: 14)),
          ),
          const Spacer(flex: 2),
          Text(
            comment,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontSize: 14)),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}